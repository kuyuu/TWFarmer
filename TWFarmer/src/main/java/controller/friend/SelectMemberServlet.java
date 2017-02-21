package controller.friend;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.dao.MemberDAOJdbc;

@WebServlet("/Friend/SelectMemberServlet")
public class SelectMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String account = request.getParameter("account");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		if (account == null) {
			errors.put("account", "請輸入帳號");
		}
		MemberDAOJdbc dao = new MemberDAOJdbc();
		MemberBean bean = dao.selectByAccount(account);
		if (bean == null) {
			errors.put("account", "無此會員");
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("FriendHomeServlet").forward(request, response);
			return;
		}
		request.setAttribute("memberBean", bean);
		request.getRequestDispatcher("showMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
