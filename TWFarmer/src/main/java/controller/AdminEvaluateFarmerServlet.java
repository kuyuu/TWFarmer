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

import model.FarmerBean;
import model.JPDetailBean;
import model.JointPurchaseBean;
import model.MemberBean;
import model.ProductBean;
import model.dao.FarmerDAOJdbc;
import model.dao.JPDetailDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;
import model.dao.ProductDAOjdbc;
@WebServlet("/BackStage/AdminEvaluateFarmerServlet")
public class AdminEvaluateFarmerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("memberId");
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		//An outer shell that does a little.
		int memberId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				memberId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("memberId", "Id必須是整數");
			}
		}
		
		MemberDAOJdbc dao = new MemberDAOJdbc();
		MemberBean memberBean = dao.select(memberId);
		
		FarmerDAOJdbc dao3 = new FarmerDAOJdbc();
		//FarmerBean farmerBean = dao3.insert(memberId);
		request.setAttribute("memberBean", memberBean);
		//request.setAttribute("farmerBean", farmerBean);
		
		request.getRequestDispatcher("AEFDetail.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
