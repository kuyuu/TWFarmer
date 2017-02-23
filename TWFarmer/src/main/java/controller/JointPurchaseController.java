package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.FarmerBean;
import model.JPDetailBean;
import model.JointPurchaseBean;
import model.MemberBean;
import model.ProductBean;
import model.ProductPicBean;
import model.dao.FarmerDAOJdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;
import model.dao.ProductDAOjdbc;
import model.dao.ProductPicDAOJdbc;

@Controller
@RequestMapping(path = { "/JointPurchase.do" })
public class JointPurchaseController {
	@Autowired
	private JointPurchaseDAOjdbc jpDAO;
	@Autowired
	private MemberDAOJdbc memberDAO;
	@Autowired
	private FarmerDAOJdbc farmerDAO;
	@Autowired
	private ProductDAOjdbc productDAO;
	@Autowired
	private ProductPicDAOJdbc producPictDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer jpId, Model model) {

		JointPurchaseBean jpBean = jpDAO.select(jpId);
		model.addAttribute("jpBean", jpBean);

		Map<JPDetailBean, ProductBean> map = productDAO.selectByJpId(jpId);
		Map<JPDetailBean, Map<ProductBean, List<ProductPicBean>>> map2 = new HashMap<>();
		for (JPDetailBean bean : map.keySet()) {
			Map<ProductBean, List<ProductPicBean>> map3 = new HashMap<>();
			ProductBean pBean = map.get(bean);
			map3.put(pBean, producPictDAO.selectByProductId(pBean.getProductId()));
			map2.put(bean, map3);
		}
		model.addAttribute("jpdMap", map2);

		MemberBean mBean = memberDAO.select(jpBean.getInitId());
		model.addAttribute("mBean", mBean);

		FarmerBean fBean = farmerDAO.selectByMemberId(jpBean.getInitId());
		model.addAttribute("fBean", fBean);

		return "JointPurchase";
	}

}
