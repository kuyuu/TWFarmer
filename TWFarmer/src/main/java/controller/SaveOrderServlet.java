package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrderDetailBean;
import model.OrderStatusBean;
import model.OrdersBean;
import model.dao.OrderDetailDAOJdbc;
import model.dao.OrderStatusDAOJdbc;
import model.dao.OrdersDAOJdbc;

/**
 * Servlet implementation class SaveOrderServlet
 */
@WebServlet("/Order/SaveOrderServlet")
public class SaveOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OrdersDAOJdbc ordersDAOJdbc;
	private OrderDetailDAOJdbc orderDetailDAOJdbc;
	private OrderStatusDAOJdbc orderStatusDAOJdbc;
	
	public void init() throws ServletException {
		ordersDAOJdbc = new OrdersDAOJdbc();
		orderDetailDAOJdbc = new OrderDetailDAOJdbc();
		orderStatusDAOJdbc = new OrderStatusDAOJdbc();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//以下為input 跟 hidden input 儲存目標為Order table
		String shipName = String.valueOf(request.getParameter("shipName"));
		String shipPostalCode = String.valueOf(request.getParameter("shipPostalCode"));
		String shipDistrict = String.valueOf(request.getParameter("shipDistrict"));
		String shipAddress = String.valueOf(request.getParameter("shipAddress"));
		int amount = Integer.parseInt(request.getParameter("amount"));
	//	int totalFreight = Integer.parseInt(request.getParameter("totalFreight"));
	//	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		//以下為hidden input
		int sellerID = Integer.parseInt(request.getParameter("sellerID"));
		int buyerID = Integer.parseInt(request.getParameter("buyerID"));
		String currentDateTime = request.getParameter("orderDate");
		String shipDateTime = request.getParameter("shipDateTime");
		//下面三個存的目標是OrderDetail table
		int productID = Integer.parseInt(request.getParameter("productID"));
		int price = Integer.parseInt(request.getParameter("price"));
		int freight = Integer.parseInt(request.getParameter("freight"));
		
		try {
			OrdersBean ordersBean = new OrdersBean();
			//DTO
			ordersBean.setShipName(shipName);
			ordersBean.setShipPostalCode(shipPostalCode);
			ordersBean.setShipDistrict(shipDistrict);
			ordersBean.setShipAddress(shipAddress);
			ordersBean.setSellerId(sellerID);
			ordersBean.setBuyerId(buyerID);
			
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");					
			ordersBean.setOrderDate(sdFormat.parse(currentDateTime));
			ordersBean.setShipDate(sdFormat.parse(shipDateTime));
			//隱藏計算
			ordersBean.setTotalFreight(freight*amount);
			ordersBean.setTotalPrice((freight+price)*amount);
			//先寫死訂單狀態
			ordersBean.setOrderStatusId(3101);
			
			
			OrdersBean orderResult = ordersDAOJdbc.insert(ordersBean);			
			OrderDetailBean orderDetailBean = new OrderDetailBean();
			orderDetailBean.setOrderId(orderResult.getOrderId());		
			orderDetailBean.setOrderQuantity(amount);
			orderDetailBean.setProductId(productID);
			orderDetailBean.setUnitPrice(price);
			orderDetailBean.setUnitFreight(freight);	
			
			OrderDetailBean orderDetailResult = orderDetailDAOJdbc.insert(orderDetailBean);
			System.out.println(orderResult.getOrderId());
			
			
			//orderDetailBean
		} catch (Exception e) {

			e.printStackTrace();
		}

	
	

	}

}
