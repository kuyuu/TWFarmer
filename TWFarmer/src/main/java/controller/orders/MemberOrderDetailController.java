package controller.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.OrderDetailBean;
import model.bean.OrdersBean;
import model.daojdbc.OrderDetailDAOJdbc;
import model.daojdbc.OrdersDAOJdbc;

@Controller
@RequestMapping(path = { "/Order/MemberOrderDetail.do" })
public class MemberOrderDetailController {
	@Autowired
	private OrdersDAOJdbc orderDAO;
	@Autowired
	private OrderDetailDAOJdbc orderDetailDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(Integer orderId, Model model) {
		
		OrdersBean oBean = orderDAO.select(orderId);
		model.addAttribute("orderBean", oBean);
		
		List<OrderDetailBean> odList = orderDetailDAO.selectByOrderId(orderId);
		model.addAttribute("orderDetailList", odList);
		
		return "BackStage/memberCheckOrderDetail";
		
	}

}
