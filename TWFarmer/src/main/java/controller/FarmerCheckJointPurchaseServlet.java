package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JPDetailBean;
import model.JointPurchaseBean;
import model.dao.JPDetailDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;
@WebServlet("/BackStage/FarmerCheckJointPurchaseServlet")
public class FarmerCheckJointPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("jointPurchaseId");
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int jointPurchaseId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				jointPurchaseId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("jointPurchaseId", "Id必須是整數");
			}
		}
		
		JointPurchaseDAOjdbc dao = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = dao.select(jointPurchaseId);
		
		JPDetailDAOjdbc dao2 = new JPDetailDAOjdbc();
		List<JPDetailBean> list = dao2.selectByJpId(jointPurchaseId);
		
		request.setAttribute("jpBean", jpBean);
		request.setAttribute("JPDetailList", list);
		
		request.getRequestDispatcher("farmerCheckJpDetail.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
