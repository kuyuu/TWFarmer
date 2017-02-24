package controller.shoppingcart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.ProductBean;
import model.bean.ProductPicBean;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ProductPicDAOJdbc;

@Controller
@RequestMapping(path = { "/shoppingCart/ShowShoppingCart.do" })
public class ShowShoppingCartController {
	@Autowired
	private MemberDAOJdbc memberDAO;
	@Autowired
	private ProductDAOjdbc productDAO;
	@Autowired
	private ProductPicDAOJdbc productPicDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doGet(HttpSession session, Model model) {
		Map<Integer, Set<Integer>> cart = (Map<Integer, Set<Integer>>) session.getAttribute("cart");

		if (cart != null) {
			Map<MemberBean, Map<ProductBean, List<ProductPicBean>>> cartMap = new HashMap<MemberBean, Map<ProductBean, List<ProductPicBean>>>();
			for (Map.Entry entry : cart.entrySet()) {
				MemberBean mb = memberDAO.select((Integer) entry.getKey());
				Map<ProductBean, List<ProductPicBean>> map = new HashMap<ProductBean, List<ProductPicBean>>();
				Set<Integer> set = (Set) entry.getValue();
				Iterator it = set.iterator();
				List<ProductPicBean> list = new ArrayList<ProductPicBean>();
				while (it.hasNext()) {
					int productId = (Integer) it.next();
					list = productPicDAO.selectByProductId(productId);
					map.put(productDAO.select(productId), list);
				}
				cartMap.put(mb, map);
			}
			model.addAttribute("cartMap", cartMap);
		}

		return "shoppingCart/shoppingCart";
	}

}
