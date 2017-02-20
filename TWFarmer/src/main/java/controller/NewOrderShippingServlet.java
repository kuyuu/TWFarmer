package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrderStatusBean;
import model.OrderStatusDAO;
import model.OrdersBean;
import model.dao.OrderStatusDAOJdbc;
import model.dao.OrdersDAOJdbc;

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
		
		 List<String> orderStatusOptions = new ArrayList<String>();
		 orderStatusOptions.add("3103");
		 orderStatusOptions.add("3104");
		    
		
		
		
		

		request.setAttribute("order", ordersDAOJdbc.select(orderId));
		request.setAttribute("orderStatusOptions", orderStatusOptions);
		
		getServletContext().getRequestDispatcher("/Order/UpdateShippingStatus.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
