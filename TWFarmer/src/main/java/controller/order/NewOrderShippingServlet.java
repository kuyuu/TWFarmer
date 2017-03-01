package controller.order;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.OrderDetailBean;
import model.daojdbc.OrderDetailDAOJdbc;
import model.daojdbc.OrderStatusDAOJdbc;
import model.daojdbc.OrdersDAOJdbc;

/**
 * Servlet implementation class NewOrderShippingServlet
 */
@WebServlet("/BackStage/NewOrderShippingServlet")
public class NewOrderShippingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OrdersDAOJdbc ordersDAOJdbc;
	private OrderStatusDAOJdbc orderStatusDAOJdbc;
	private OrderDetailDAOJdbc orderDetailDAOJdbc;

	public void init() throws ServletException {

		ordersDAOJdbc = new OrdersDAOJdbc();
		orderStatusDAOJdbc = new OrderStatusDAOJdbc(); 
		orderDetailDAOJdbc = new OrderDetailDAOJdbc(); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		 Map<String, String> orderStatusOptions = new HashMap<String, String>();
		 orderStatusOptions.put("3103", "貨處理中");
		 orderStatusOptions.put("3104", "已出貨");
		 
		 List<OrderDetailBean> odList = orderDetailDAOJdbc.selectByOrderId(orderId);
			

		request.setAttribute("order", ordersDAOJdbc.selectWithOrderStatus(orderId));
		request.setAttribute("orderStatusOptions", orderStatusOptions);
		request.setAttribute("odList", odList);
		
		getServletContext().getRequestDispatcher("/Order/UpdateShippingStatus.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
