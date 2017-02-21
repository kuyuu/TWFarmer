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

@WebServlet("/Friend/AddFriendServlet")
public class AddFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String temp = request.getParameter("whiteId");
		String temp2 = request.getParameter("blackId");

		int whiteId = Integer.parseInt(temp);
		int blackId = Integer.parseInt(temp2);

		FriendDAOJdbc dao = new FriendDAOJdbc();
		FriendBean bean = new FriendBean();
		bean.setMemberId(mb.getMemberId());
		if (temp != null && temp.trim().length() != 0) {
			bean.setFriendId(whiteId);
			bean.setFriendStatus(0);
		} else if (temp2 != null && temp2.trim().length() != 0) {
			bean.setFriendId(blackId);
			bean.setFriendStatus(1);
		}
		dao.insert(bean);
		
		System.out.println("add friend success!!");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
