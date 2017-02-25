package controller.orders;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.OrderDetailBean;
import model.bean.OrdersBean;
import model.bean.ProductBean;
import model.daojdbc.OrderDetailDAOJdbc;
import model.daojdbc.OrdersDAOJdbc;
import model.daojdbc.ProductDAOjdbc;

@Controller
@RequestMapping(path = { "Order/NewOrder.do" })
public class NewOrderController {
	@Autowired
	private ProductDAOjdbc productDAO;
	@Autowired
	private OrdersDAOJdbc orderDAO;
	@Autowired
	private OrderDetailDAOJdbc orderDetailDAO;
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer[] productId, Integer[] count, String shipName, String shipPostalCode,
			String shipDistrict, String shipAddress, Integer sellerId) {

		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		OrdersBean oBean = new OrdersBean();
		oBean.setSellerId(sellerId);
		oBean.setBuyerId(mb.getMemberId());
		oBean.setOrderDate(new Date());
		oBean.setShipName(shipName);
		oBean.setShipPostalCode(shipPostalCode);
		oBean.setShipDistrict(shipDistrict);
		oBean.setShipAddress(shipAddress);
		oBean.setBuyerOrderStatusId(3101);
		oBean.setSellerOrderStatusId(3103);
		oBean = orderDAO.insert(oBean);
		
		for(int i = 0; i < productId.length; i++){
			ProductBean pBean = productDAO.select(productId[i]);
			OrderDetailBean odBean = new OrderDetailBean();
			odBean.setOrderId(oBean.getOrderId());
			odBean.setProductId(productId[i]);
			odBean.setUnit(pBean.getUnit());
			odBean.setUnitPrice(pBean.getPrice());
			odBean.setOrderQuantity(count[i]);
			odBean.setUnitFreight(pBean.getFreight());
			orderDetailDAO.insert(odBean);
		}
		
		
		return "Orders/success";
	}
}
