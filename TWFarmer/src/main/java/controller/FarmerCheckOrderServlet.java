package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.OrdersBean;
import model.dao.OrderDetailDAOJdbc;
import model.dao.OrdersDAOJdbc;

/**
 * Servlet implementation class FarmerCheckOrderServlet
 */
@WebServlet("/BackStage/FarmerCheckOrderServlet")
public class FarmerCheckOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private OrdersDAOJdbc ordersDAOJdbc;
	private OrderDetailDAOJdbc orderDetailDAOJdbc;
	
    public FarmerCheckOrderServlet() {
       
    }
    public void init() {
    	ordersDAOJdbc = new OrdersDAOJdbc();
    	orderDetailDAOJdbc =new OrderDetailDAOJdbc();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberBean member = (MemberBean) request.getSession().getAttribute("LoginOK");
		request.setCharacterEncoding("UTF-8");
		
	
		//單一測試賣家接到的訂單
		 List<OrdersBean> sellerorders = ordersDAOJdbc.findSellerAllList(member.getMemberId());
		System.out.println(sellerorders);
		request.setAttribute("sellerorders", sellerorders);
		getServletContext().getRequestDispatcher("/Order/FarmerManergeOrderList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//request.getParameter()
	}

}
