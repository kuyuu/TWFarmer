package ch06_01;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ch06_01/login.do")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		String userId = request.getParameter("userId");
		String password = request.getParameter("pswd");

		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("asswordEmptyError", "密碼欄必須輸入");
		}
		if (!errorMsgMap.isEmpty()) {
			request.getRequestDispatcher("/ch06_01/login.jsp").forward(request, response);
			return;
		}
		LoginService ls = new LoginService();
		MemberBean mb = ls.checkIDPassword(userId, password);
		if (mb != null) {
			session.setAttribute("LoginOK", mb);
		} else {
			errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
		}
		if (errorMsgMap.isEmpty()) {
			String contextPath = getServletContext().getContextPath();
			String target = (String) session.getAttribute("target");
			if (target != null) {
				session.removeAttribute("target");
				response.sendRedirect(contextPath + target);
			} else {
				response.sendRedirect(contextPath + "/index.jsp");
			}
			return;
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/ch06_01/login.jsp");
			rd.forward(request, response);
			return;
		}
	}
}
