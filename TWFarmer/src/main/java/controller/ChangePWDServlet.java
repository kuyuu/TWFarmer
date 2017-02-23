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
import model.dao.MemberDAOJdbc;

@WebServlet(urlPatterns = { "/BackStage/ChangePWDServlet" })
public class ChangePWDServlet extends HttpServlet {
	private MemberDAOJdbc memberDAOJdbc = new MemberDAOJdbc();

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
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String newPassword2 = request.getParameter("newPassword2");
		String submit = request.getParameter("submit");

		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		if ("cancel".equals(submit)) {
			request.getRequestDispatcher("/BackStage/WelcomeMember.jsp").forward(request, response);
			return;
		}

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (oldPassword == null || oldPassword.length() == 0 || newPassword == null || newPassword.length() == 0
				|| newPassword2 == null || newPassword2.length() == 0) {
			errors.put("PWD", "欄位不可為空白");
			request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request, response);
			return;
		}

		if (!newPassword.equals(newPassword2)) {
			errors.put("PWD", "新密碼與確認新密碼需相同");
		}

		if (oldPassword.equals(newPassword)) {
			errors.put("PWD", "新舊密碼不可相同");
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("/BackStage/changePWD.jsp").forward(request, response);
			return;
		}

		MemberBean bean = memberDAOJdbc.select(mb.getMemberId());
		bean.setPassword(newPassword);

		if ("change".equals(submit)) {
			if (mb.getPassword().equals(oldPassword)) {
				MemberBean result = memberDAOJdbc.update(bean);
				request.setAttribute("submit", result);
				request.getRequestDispatcher("/BackStage/afterChangePWD.jsp").forward(request, response);
			} else {
				errors.put("PWD", "密碼輸入錯誤");
				request.getRequestDispatcher("/BackStage/afterChangePWD.jsp").forward(request, response);
				return;
			}
		}

	}

}
