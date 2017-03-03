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

import model.bean.FarmerBean;
import model.bean.JPDetailBean;
import model.bean.JPFollowerDetailBean;
import model.bean.JointPurchaseBean;
import model.bean.MemberBean;
import model.bean.MsgBoardBean;
import model.bean.ProductBean;
import model.bean.ProductPicBean;
import model.daojdbc.FarmerDAOJdbc;
import model.daojdbc.JPDetailDAOjdbc;
import model.daojdbc.JPFollowerDetailDAOJdbc;
import model.daojdbc.JointPurchaseDAOjdbc;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.MsgBoardDAOJdbc;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ProductPicDAOJdbc;

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
	@Autowired
	private JPDetailDAOjdbc jpDetailDAO;
	// @Autowired
	// private JPFollowerDAOJdbc jpfDAO;
	@Autowired
	private JPFollowerDetailDAOJdbc jpfDetailDAO;
	@Autowired
	private MsgBoardDAOJdbc msgBoardDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer jpId, Model model) {

		JointPurchaseBean jpBean = jpDAO.select(jpId);
		model.addAttribute("jpBean", jpBean);

		Map<JPDetailBean, ProductBean> map = productDAO.selectByJpId(jpId);
		Map<JPDetailBean, Map<ProductBean, List<ProductPicBean>>> map2 = new HashMap<>();
		int sellerId = 0;
		for (JPDetailBean bean : map.keySet()) {
			Map<ProductBean, List<ProductPicBean>> map3 = new HashMap<>();
			ProductBean pBean = map.get(bean);
			sellerId = pBean.getSellerId();
			map3.put(pBean, producPictDAO.selectByProductId(pBean.getProductId()));
			map2.put(bean, map3);
		}
		model.addAttribute("jpdMap", map2);

		MemberBean mBean = memberDAO.select(jpBean.getInitId());
		model.addAttribute("mBean", mBean);

		FarmerBean fBean = farmerDAO.selectByMemberId(sellerId);
		model.addAttribute("fBean", fBean);

		List<JPDetailBean> jpdList = jpDetailDAO.selectByJpId(jpId);
		List<JPFollowerDetailBean> jpfdList = jpfDetailDAO.selectByJpId(jpId);
		List<Integer> quantity = new ArrayList<>();
		for (int i = 0; i < jpdList.size(); i++) {
			quantity.add(0);
		}
		for (int i = 0; i < jpdList.size(); i++) {
			for (int j = 0; j < jpfdList.size(); j++) {
				if (jpdList.get(i).getProductId() == jpfdList.get(j).getProductId()) {
					int count = 0;
					count = quantity.get(i) + jpfdList.get(j).getQuantity();
					quantity.remove(i);
					quantity.add(i, count);
				}
			}
		}
		model.addAttribute("size", quantity.size());
		model.addAttribute("jpdList", jpdList);
		model.addAttribute("quantity", quantity);

		List<MsgBoardBean> msgBoardList = msgBoardDAO.selectByJpId(jpId);
		model.addAttribute("msgBoardList", msgBoardList);

		return "JointPurchase";
	}

}
