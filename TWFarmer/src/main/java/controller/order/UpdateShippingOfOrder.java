package controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdersBean;
import model.dao.OrdersDAOJdbc;

/**
 * Servlet implementation class UpdateShippingOfOrder
 */
@WebServlet("/BackStage/UpdateShippingOfOrder")
public class UpdateShippingOfOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OrdersDAOJdbc ordersDAOJdbc;

	public void init() {
		ordersDAOJdbc = new OrdersDAOJdbc();

	}
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int sellerOrderStatusId = Integer.parseInt(request.getParameter("sellerOrderStatusId"));
		OrdersBean orderBean = ordersDAOJdbc.select(orderId);
		orderBean.setSellerOrderStatusId(sellerOrderStatusId);
		
		ordersDAOJdbc.update(orderBean);
		
		response.sendRedirect("FarmerCheckOrderServlet");
		
		
		
	
	}

}
