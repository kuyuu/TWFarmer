package controller.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.FarmerBean;
import model.bean.ProductBean;
import model.bean.ProductPicBean;
import model.daojdbc.FarmerDAOJdbc;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ProductPicDAOJdbc;

@Controller
@RequestMapping(path = { "Order/StarOrder.do" })
public class StarOrderController {
	@Autowired
	private ProductDAOjdbc productDAO;
//	@Autowired
//	private MemberDAOJdbc memberDAO;
	@Autowired
	private ProductPicDAOJdbc productPicDAO;
	@Autowired
	private FarmerDAOJdbc farmerDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWord(HttpSession session, Integer productId, Model model) {
		int sellerId = productDAO.select(productId).getSellerId();
		
		FarmerBean fBean = farmerDAO.selectByMemberId(sellerId);
		model.addAttribute("farmerBean", fBean);
		
		Map<ProductBean, List<ProductPicBean>> farmerProductMap = productDAO.selectBySellerIdWithPic(sellerId);
		
		List<ProductBean> list = new ArrayList<ProductBean>();
		for (ProductBean key : farmerProductMap.keySet()) {
			list.add(key);
		}
		
		Map<Integer, Set<Integer>> cart = (Map<Integer, Set<Integer>>) session.getAttribute("cart");
		
		if (cart != null && cart.get(fBean.getMemberId()) != null) {
			Map<ProductBean, List<ProductPicBean>> cartProductMap = new HashMap<ProductBean, List<ProductPicBean>>();
			for (int x : cart.get(fBean.getMemberId())) {
				ProductBean pBean = productDAO.select(x);
				cartProductMap.put(pBean, productPicDAO.selectByProductId(x));
				for (ProductBean key2 : list) {
					if (key2.equals(pBean)) {
						farmerProductMap.remove(key2);
					}
				}
			}
			model.addAttribute("cartProductMap", cartProductMap);
		}
		
		model.addAttribute("productId", productId);
		model.addAttribute("farmerProductMap", farmerProductMap);
		
		return "Orders/newOrder";
		
	}
}
