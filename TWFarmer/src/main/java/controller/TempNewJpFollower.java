package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.F2FDetailBean;
import model.JPDetailBean;
import model.JointPurchaseBean;
import model.MemberBean;
import model.dao.F2FDetailDAOjdbc;
import model.dao.JPDetailDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;


@WebServlet("/JointPurchase/TempNewJpFollower")
public class TempNewJpFollower extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("memberId");
		String temp2 = request.getParameter("jpId");

		int memberId = 0;
		if (temp != null && temp.trim().length() != 0) {
			try {
				memberId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		int jpId = 0;
		if (temp2 != null && temp2.trim().length() != 0) {
			try {
				jpId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		MemberDAOJdbc dao = new MemberDAOJdbc();
		MemberBean memberBean = dao.select(memberId);
		JointPurchaseDAOjdbc dao2 = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = dao2.select(jpId);
		JPDetailDAOjdbc dao3 = new JPDetailDAOjdbc();
		List<JPDetailBean> list = dao3.selectByJpId(jpId);
		F2FDetailDAOjdbc dao4 = new F2FDetailDAOjdbc();
		List<F2FDetailBean> list2 = dao4.selectByJpId(jpId);
		
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("jpBean", jpBean);
		request.setAttribute("jpDetailList", list);
		request.setAttribute("f2fList", list2);
		
		request.getRequestDispatcher("newJpFollower.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
