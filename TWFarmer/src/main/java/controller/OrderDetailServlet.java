package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.OrdersBean;
import model.dao.MemberDAOJdbc;
import model.dao.OrderDetailDAOJdbc;
import model.dao.OrdersDAOJdbc;

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
		// MemberBean member = (MemberBean)request.getSession().getAttribute("LoginOK");
		 //memberDAOJdbc.select(memberId)
		//request.getParameter(arg0)
		 
		//OrdersBean order = ordersDAOJdbc.select(member.getMemberId());
		
		//Object orderdetail = orderDetailDAOJdbc.select(orderId, productId);
		//request.setAttribute("order", order);
		
		//request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
