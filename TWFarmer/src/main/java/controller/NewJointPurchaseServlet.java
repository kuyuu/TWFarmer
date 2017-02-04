package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.JPDetailBean;
import model.JointPurchaseBean;
import model.JointPurchaseDAO;
import model.dao.JPDetailDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;

@WebServlet(urlPatterns="/JointPurchase/NewJointPurchaseServlet")
public class NewJointPurchaseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String temp1 = request.getParameter("memberId");
		String temp2 = request.getParameter("productId");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int memberId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				memberId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("memberId", "memberId必須是整數");
			}
		}
		
		int productId = 0;
		if (temp2 != null && temp2.length() != 0) {
			try {
				productId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("productId", "productId必須是整數");
			}
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"error.jsp").forward(request, response);
			return;
		}
		
		JointPurchaseBean bean = new JointPurchaseBean();
		bean.setInitId(memberId);
		
		JPDetailBean bean2 = new JPDetailBean();
		bean2.setProductId(productId);
		
		HttpSession session = request.getSession();
		session.setAttribute("JointPurchase", bean);
		session.setAttribute("JPDetail", bean2);
		
		request.getRequestDispatcher("newJp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
