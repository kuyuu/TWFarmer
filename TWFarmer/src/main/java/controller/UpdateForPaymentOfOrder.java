package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrdersBean;
import model.dao.OrderDetailDAOJdbc;
import model.dao.OrdersDAOJdbc;

/**
 * Servlet implementation class UpdateForPaymentOfOrder
 */
@WebServlet("/BackStage/UpdateForPaymentOfOrder")
public class UpdateForPaymentOfOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OrdersDAOJdbc ordersDAOJdbc;

	public void init() {
		ordersDAOJdbc = new OrdersDAOJdbc();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int remittance = Integer.parseInt(request.getParameter("remittance"));
		String remittanceDate = request.getParameter("remittanceDate");
		String remittanceBank = request.getParameter("remittanceBank");
		String remittanceAcc = request.getParameter("remittanceAcc");

		
		try {
//			OrdersBean ordersBean = new OrdersBean();
//			ordersBean.setOrderId(orderId);
			OrdersBean ordersBean = ordersDAOJdbc.select(orderId);
			ordersBean.setRemittance(remittance);

			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			ordersBean.setRemittanceDate(sdFormat.parse(remittanceDate));

			ordersBean.setRemittanceBank(remittanceBank);
			ordersBean.setRemittanceAcc(remittanceAcc);
			ordersBean.setBuyerOrderStatusId(3102);
			ordersDAOJdbc.update(ordersBean);
			
			
			
			response.sendRedirect("ListOrderServlet");
			///BackStage/ListOrderServlet
			
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
