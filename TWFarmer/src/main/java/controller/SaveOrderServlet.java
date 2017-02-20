package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
		request.setCharacterEncoding("UTF-8");
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
		String unit = request.getParameter("unit");
		
		//驗證資料	
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		System.out.println("shipName"+shipName);
		System.out.println(shipName.trim().length());
		if (shipName == null || shipName.trim().length()==0 ) {	
				errors.put("shipName", "收件人必填");
			}
		if (shipPostalCode == null || shipPostalCode.trim().length()==0) {	
			errors.put("shipPostalCode", "郵遞區號必填，例:115");
		}
		if (shipDistrict == null || shipDistrict.trim().length()==0) {	
			errors.put("shipDistrict", "收件地區必填，例:台北市大安區");
		}
		if (shipAddress == null || shipAddress.trim().length()==0) {	
			errors.put("shipAddress", "地址必填，例:忠孝東路X段X號X樓");
		}
		
		if (!errors.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/Order/NewOrder.jsp");
			rd.forward(request, response);
			return;
		}
		
//		if (amount == 0 ) {	
//			errors.put("amount", "數量必填，例:忠孝東路X段X號X樓");
//		}
//	

		
		
		
		
		
		try {
			OrdersBean ordersBean = new OrdersBean();
			//DTO
			ordersBean.setShipName(shipName);
			ordersBean.setShipPostalCode(shipPostalCode);
			ordersBean.setShipDistrict(shipDistrict);	
			ordersBean.setShipAddress(shipAddress);
			//此處sysout 測試輸入的文字是否為亂碼
//			System.out.println("controller: shipName="+shipName);
//			System.out.println("controller: shipDistrict="+shipDistrict);
//			System.out.println("controller: shipAddress="+shipAddress);
			ordersBean.setSellerId(sellerID);
//			System.out.println("controller: sellerID="+sellerID);
			ordersBean.setBuyerId(buyerID);
//			System.out.println("controller: buyerID="+buyerID);
			
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");					
			ordersBean.setOrderDate(sdFormat.parse(currentDateTime));
			ordersBean.setShipDate(sdFormat.parse(shipDateTime));
			//隱藏計算  如何顯示當下計算!?
			ordersBean.setTotalFreight(freight*amount);
			ordersBean.setTotalPrice((freight+price)*amount);
			//先寫死訂單狀態
			ordersBean.setBuyerOrderStatusId(3101);
			ordersBean.setSellerOrderStatusId(3103);
			OrdersBean orderResult = ordersDAOJdbc.insert(ordersBean);			
			
			
			
			OrderDetailBean orderDetailBean = new OrderDetailBean();
			orderDetailBean.setOrderId(orderResult.getOrderId());		
			orderDetailBean.setOrderQuantity(amount);
			orderDetailBean.setProductId(productID);
			orderDetailBean.setUnitPrice(price);
			orderDetailBean.setUnitFreight(freight);
			orderDetailBean.setUnit(unit);		
			
			OrderDetailBean orderDetailResult = orderDetailDAOJdbc.insert(orderDetailBean);
			System.out.println(orderResult.getOrderId());
		
			request.setAttribute("orderResult", orderResult);
			request.setAttribute("orderDetailResult", orderDetailResult);
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
			//response.sendRedirect("/Order/OrderDetailServlet");
			
			//orderDetailBean
		} catch (Exception e) {

			e.printStackTrace();
		}

	
	

	}

}
