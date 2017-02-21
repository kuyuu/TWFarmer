package controller.friend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FriendBean;
import model.MemberBean;
import model.dao.FriendDAOJdbc;

@WebServlet("/Friend/DeleteFriendServlet")
public class DeleteFriendServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String temp = request.getParameter("friendId");

		FriendDAOJdbc dao = new FriendDAOJdbc();
		FriendBean bean = new FriendBean();

		if (temp != null && temp.trim().length() != 0) {
			int friendId = 0;
			try {
				friendId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			dao.delete(mb.getMemberId(), friendId);
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
