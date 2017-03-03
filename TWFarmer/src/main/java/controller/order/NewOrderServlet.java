package controller.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MemberBean;
import model.bean.MsgBean;
import model.bean.OrdersBean;
import model.bean.ProductBean;
import model.dao.OrderStatusDAO;
import model.dao.ProductDAO;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.MsgDAOJdbc;
import model.daojdbc.OrdersDAOJdbc;
import model.daojdbc.ProductDAOjdbc;

/**
 * Servlet implementation class InsertOrdersIServlet
 */
@WebServlet("/Order/NewOrderServlet")
public class NewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDAOJdbc memberDAOJdbc;
	private OrdersDAOJdbc ordersDAOJdbc;
	private ProductDAOjdbc productDAOjdbc;

	public void init() throws ServletException {
		memberDAOJdbc = new MemberDAOJdbc();
		ordersDAOJdbc = new OrdersDAOJdbc();
		productDAOjdbc = new ProductDAOjdbc();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("test");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		int productId = Integer.parseInt(request.getParameter("productId"));

		MemberBean member = memberDAOJdbc.select(sellerId);
		ProductBean product = productDAOjdbc.select(productId);

		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date current = new Date();
		//System.out.println(sdFormat.format(current));
		 	
		Date shipDate = new Date();		
		Calendar c = Calendar.getInstance(); 
		c.setTime(shipDate); 
		c.add(Calendar.DATE, 1);
		shipDate = c.getTime();
		//System.out.println(sdFormat.format(shipDate));
		
		request.setAttribute("member", member);
		request.setAttribute("product", product);
		request.setAttribute("currentDateTime", sdFormat.format(current));
		request.setAttribute("shipDateTime",sdFormat.format(shipDate));
		//request.setAttribute("totalFreight", product.getFreight());
		//request.setAttribute("total", product.getPrice()+product.getFreight());
		
		request.getRequestDispatcher("NewOrder.jsp").forward(request, response);
		
		
		
		
		
//		HttpSession session = request.getSession();
//		// request.getParameter("orderId"); //這三行如何直接撈資料
//		// request.getParameter("sellerId");
//		// request.getParameter("buyerId");
//		// String temp5 = request.getParameter("sellerId");
//		String temp6 = request.getParameter("buyerId");
//		String temp1 = request.getParameter("totalFreight");// 如何直接帶入運費金額
//		// String temp2 = request.getParameter("totalPrice");//如何直接帶入商品金額
//		String temp3 = request.getParameter("orderDate");// 如何直接抓當下時間
//		String temp4 = request.getParameter("shipDate");
//		String shipName = request.getParameter("shipName");
//		String shipPostalCode = request.getParameter("shipPostalCode");
//		String shipDistrict = request.getParameter("shipDistrict");
//		String shipAddress = request.getParameter("shipAddress");
//		// String temp9 = request.getParameter("orderStatusId");
//		// //如何寫入狀態(已、未付款，已、出貨)
//		// String temp10 = request.getParameter("ratingBuyer");//還沒寫入評比
//		// String temp11 = request.getParameter("ratingSeller");//還沒寫入評比
//		String selectedProductId = request.getParameter("selectedProduct");
//		String amount = request.getParameter("amount");
//
//		// 錯誤訊息
//		Map<String, String> errors = new HashMap<String, String>();
//		request.setAttribute("errors", errors);
//
//		System.out.println("Selected Product ID");
//		System.out.println(selectedProductId);
//		ProductDAOjdbc pd = new ProductDAOjdbc();
//		if (selectedProductId == null) {
//
//			List<ProductBean> plist = pd.select();// new
//													// ArrayList<ProductBean>();
//
//			System.out.println(plist.size());
//			request.setAttribute("products", plist);
//
//			request.getRequestDispatcher("NewOrder.jsp").forward(request, response);
//		} else {
//
//			System.out.println("test2");
//			if (temp1 == null || temp1.length() == 0) {
//				errors.put("totalFreight", "運費必填");
//			}
//
//			// if(temp2 == null || temp2.length() == 0){
//			// errors.put("totalPrice", "總價位必填");
//			// }
//			// if(temp5 == null || temp5.length() == 0){
//			// errors.put("sellerId", "賣家必填");
//			// }
//			if (temp6 == null || temp6.length() == 0) {
//				errors.put("buyerId", "買家必填");
//			}
//			// if(temp3 == null || temp3.length() == 0){
//			// errors.put("orderDate", "購買日期必填");
//			// }
//			//
//			// if(temp4 == null || temp4.length() == 0){
//			// errors.put("shipDate", "出貨日期必填");
//			// }
//			if (shipName == null || shipName.length() == 0) {
//				errors.put("shipName", "收件人必填");
//			}
//			if (shipPostalCode == null || shipPostalCode.length() == 0) {
//				errors.put("shipPostalCode", "收件郵遞區號");
//			}
//			if (shipDistrict == null || shipDistrict.length() == 0) {
//				errors.put("shipDistrict", "收件地區");
//			}
//			if (shipAddress == null || shipAddress.length() == 0) {
//				errors.put("shipAddress", "收件地址");
//			}
//
//			// 轉換
//
//			int totalFreight = 0;
//			if (temp1 != null && temp1.length() != 0) {
//				try {
//					totalFreight = Integer.parseInt(temp1);
//				} catch (NumberFormatException e) {
//					e.printStackTrace();
//					errors.put("totalFreight", "總運費必須是整數");
//				}
//			}
//
//			int unitPrice = 0;
//			// if (temp2 != null && temp2.length() != 0) {
//			// try {
//			// totalPrice = Integer.parseInt(temp1);
//			// } catch (NumberFormatException e) {
//			// e.printStackTrace();
//			// errors.put("totalPrice", "總金額必須是整數");
//			// }
//			// }
//
//			int sellerId = 0;
//			// if (temp5 != null && temp5.length() != 0) {
//			// try {
//			// sellerId = Integer.parseInt(temp5);
//			// } catch (NumberFormatException e) {
//			// e.printStackTrace();
//			// errors.put("sellerId", "賣家編號必須是整數");
//			// }
//			// }
//			int buyerId = 0;
//			if (temp6 != null && temp6.length() != 0) {
//				try {
//					buyerId = Integer.parseInt(temp6);
//				} catch (NumberFormatException e) {
//					e.printStackTrace();
//					errors.put("buyerId", "買家編號必須是整數");
//				}
//			}
//
//			int shipDate = 0;
//			if (temp4 != null && temp4.length() != 0) {
//				try {
//					shipDate = Integer.parseInt(temp1);
//				} catch (NumberFormatException e) {
//					e.printStackTrace();
//					errors.put("shipDate", "出貨日期必須符合yyyy-MM-dd格式日期");
//				}
//			}
//
//			int orderDate = 0;
//			if (temp4 != null && temp4.length() != 0) {
//				try {
//					orderDate = Integer.parseInt(temp1);
//				} catch (NumberFormatException e) {
//					e.printStackTrace();
//					errors.put("orderDate", "訂購日期必須符合yyyy-MM-dd格式日期");
//				}
//			}
//
//			// Trying to get serial number~
//			int orderId = 0;
//
//			if (errors != null && !errors.isEmpty()) {
//				// request.setAttribute("test", "This is test");
//				request.getRequestDispatcher("NewOrder.jsp").forward(request, response);
//				return;
//			}
//
//			OrdersDAOJdbc daoo = new OrdersDAOJdbc();
//			OrdersBean ordersBean = new OrdersBean();
//
//			// get information based on the product ID selected by user
//			ProductBean pro = pd.select(Integer.valueOf(selectedProductId));
//			sellerId = pro.getSellerId();
//			unitPrice = pro.getPrice();
//
//			int totalPrice = unitPrice * Integer.valueOf(amount) + Integer.valueOf(totalFreight);
//			ordersBean.setOrderId(orderId);
//			ordersBean.setSellerId(sellerId);
//			ordersBean.setBuyerId(buyerId);
//			ordersBean.setTotalFreight(totalFreight);
//			ordersBean.setTotalPrice(totalPrice);
//			java.util.Date date = new java.util.Date();
//			ordersBean.setOrderDate(date);
//			ordersBean.setShipDate(date); // ShipDate非當下時間，目前測試用，日後改正
//			ordersBean.setShipName(shipName);
//			ordersBean.setShipPostalCode(shipPostalCode);
//			ordersBean.setShipDistrict(shipDistrict);
//			ordersBean.setShipAddress(shipAddress);
//			// Integer orderStatus = new Integer(3101); // OrderStatusDAO.
//			ordersBean.setOrderStatusId(3101);
//
//			ordersBean = daoo.insert(ordersBean);
//
//			// OrderStatusDAO.
//
//			session.setAttribute("ordersBean", ordersBean);
//
//			// request.setAttribute("test", "This is test");
//
//			request.getRequestDispatcher("OrderSuccess.jsp").forward(request, response);
//		}
//
	}
}
