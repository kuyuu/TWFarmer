package controller.order;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	public void init() throws ServletException {

		ordersDAOJdbc = new OrdersDAOJdbc();
		orderStatusDAOJdbc = new OrderStatusDAOJdbc(); 

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		 Map<String, String> orderStatusOptions = new HashMap<String, String>();
		 orderStatusOptions.put("3103", "貨處理中");
		 orderStatusOptions.put("3104", "已出貨");
		 
		

		request.setAttribute("order", ordersDAOJdbc.selectWithOrderStatus(orderId));
		request.setAttribute("orderStatusOptions", orderStatusOptions);
		
		getServletContext().getRequestDispatcher("/Order/UpdateShippingStatus.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
