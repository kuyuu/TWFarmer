package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.OrderDetailBean;
import model.OrdersBean;
import model.dao.OrderDetailDAOJdbc;
import model.dao.OrdersDAOJdbc;
import model.dao.ProductDAOjdbc;

/**
 * Servlet implementation class ListOrderServlet
 */
@WebServlet("/Order/ListOrderServlet")
public class ListOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private OrdersDAOJdbc ordersDAOJdbc;
	private OrderDetailDAOJdbc orderDetailDAOJdbc;

    public ListOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    public void init() {
    	ordersDAOJdbc = new OrdersDAOJdbc();
    	orderDetailDAOJdbc =new OrderDetailDAOJdbc();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberBean member = (MemberBean) request.getSession().getAttribute("LoginOK");
		request.setCharacterEncoding("UTF-8");
		
//		List<OrdersBean> sellerorders = ordersDAOJdbc.findSellerAllList(member.getMemberId());
//		System.out.println("seller:"+sellerorders);
//		System.out.println("memeber:"+member.getMemberId());
//		
		
		List<OrdersBean> sellerorders = ordersDAOJdbc.findSellerAllList(member.getMemberId());
		System.out.println(sellerorders);
		request.setAttribute("sellerorders", sellerorders);
		request.getRequestDispatcher("FarmerManergeOrderList.jsp").forward(request, response);
		
		
//		if (member.getIdType()==2){
//			List<OrdersBean> sellerorders = ordersDAOJdbc.findSellerAllList(member.getMemberId());
//			request.setAttribute("sellerorders", sellerorders);
//			request.getRequestDispatcher("FarmerManergeOrderList.jsp").forward(request, response);
//		}else if(member.getIdType()==3){
//			
//		}else{
//			List<OrdersBean> buyerorders =ordersDAOJdbc.findBuyerAllList(member.getMemberId());
//			
//			request.setAttribute("buyerorders", buyerorders);
//			request.getRequestDispatcher("OrderList.jsp").forward(request, response);
//			
//		}
		
		
//		List<OrdersBean> buyerorders =ordersDAOJdbc.findBuyerAllList(member.getMemberId());	
//		request.setAttribute("buyerorders", buyerorders);
//		request.getRequestDispatcher("OrderList.jsp").forward(request, response);

		
		
//ordersDAOJdbc.selectAllOrdersWithDetail
		
//		List<OrderDetailBean> myorderdetail = orderDetailDAOJdbc.selectByOrderId(member.getMemberId());
//		System.out.println("detail:"+myorderdetail );
//		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
