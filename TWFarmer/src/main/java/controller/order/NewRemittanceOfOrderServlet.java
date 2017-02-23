package controller.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdersBean;
import model.dao.MemberDAOJdbc;
import model.dao.OrdersDAOJdbc;
import model.dao.ProductDAOjdbc;

/**
 * Servlet implementation class NewRemittanceOfOrderServlet
 */
@WebServlet("/BackStage/NewRemittanceOfOrderServlet")
public class NewRemittanceOfOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private OrdersDAOJdbc ordersDAOJdbc;
	
	public void init() throws ServletException {
		
		ordersDAOJdbc = new OrdersDAOJdbc();
		
	}
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		 OrdersBean order = ordersDAOJdbc.select(orderId);
		 
			
			request.setAttribute("order", order);

			getServletContext().getRequestDispatcher("/Order/UpdateForPamentOfOrder.jsp").forward(request, response);
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
