package controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.MemberBean;
import model.bean.OrderDetailBean;
import model.bean.OrdersBean;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.OrderDetailDAOJdbc;
import model.daojdbc.OrdersDAOJdbc;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/Order/OrderDetailServlet")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		private MemberDAOJdbc memberDAOJdbc;
		private OrdersDAOJdbc ordersDAOJdbc;
		private OrderDetailDAOJdbc orderDetailDAOJdbc;

	public void init() throws ServletException{
		memberDAOJdbc =new MemberDAOJdbc();
		ordersDAOJdbc =new OrdersDAOJdbc();
		orderDetailDAOJdbc =new OrderDetailDAOJdbc();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //MemberBean member = (MemberBean)request.getSession().getAttribute("LoginOK");
		// memberDAOJdbc.select(memberId)
		//request.getParameter(arg0)
		
		int orderId = Integer.parseInt(request.getParameter("orderId")); 


		
		 
		OrdersBean orderResult = ordersDAOJdbc.select(orderId);
		request.setAttribute("orderResult", orderResult);
		
		List<OrderDetailBean> orderDetails = orderDetailDAOJdbc.selectByOrderId(orderId);
		request.setAttribute("orderDetails", orderDetails);
		
		
		
		request.getRequestDispatcher("OrderForPayment.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
