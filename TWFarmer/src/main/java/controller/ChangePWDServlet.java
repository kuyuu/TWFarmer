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

import model.MemberBean;

@WebServlet(urlPatterns = { "/BackStage/ChangePWDServlet" })
public class ChangePWDServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp1 = request.getParameter("oldPassword");
		String temp2 = request.getParameter("newPassword");
		String temp3 = request.getParameter("newPassword2");
		String submit = request.getParameter("submit");

		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		if ("cancel".equals(submit)) {
			request.getRequestDispatcher("/BackStage/WelcomeMember.jsp").forward(request, response);
		}

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (temp1 == null || temp1.length() == 0 || temp2 == null || temp2.length() == 0 || temp3 == null
				|| temp3.length() == 0) {
			 errors.put("PWD", "欄位不可為空白");
			 request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request,
			 response);
			 return;
		}

		int oldPassword = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				oldPassword = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("PWD", "密碼必須是整數");
			}
		}

		int newPassword = 0;
		if (temp2 != null && temp2.length() != 0) {
			try {
				newPassword = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("PWD", "密碼必須是整數");
			}
		}

		int newPassword2 = 0;
		if (temp3 != null && temp3.length() != 0) {
			try {
				newPassword = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("PWD", "密碼必須是整數");
			}
		}

		System.out.println(oldPassword + newPassword + newPassword2);

		// errors.put("PWD", "欄位不可為空白");
		// request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request,
		// response);
		// return;

		if (newPassword != newPassword2) {
			errors.put("PWD", "新密碼與確認新密碼需相同");
			request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request, response);
			return;
		}

		if (oldPassword == newPassword) {
			errors.put("PWD", "新舊密碼不可相同");
			request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request, response);
			return;
		} 

		// if ("change".equals(submit)) {
		// if(mb.getMemberId() == oldPassword ){
		// if(newPassword != newPassword2){
		// errors.put("PWD", "新密碼與確認新密碼需相同");
		// request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request,
		// response);
		// return;
		// }
		// }
		//
		// }

	}

}
