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

		FriendDAOJdbc dao = new FriendDAOJdbc();
		FriendBean bean = new FriendBean();

		if (temp != null && temp.trim().length() != 0) {
			int whiteId = 0;
			try {
				whiteId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			bean = dao.select(mb.getMemberId(), whiteId);
			if (bean != null) {
				bean.setFriendStatus(0);
				dao.update(bean);
			} else {
				bean = new FriendBean();
				bean.setMemberId(mb.getMemberId());
				bean.setFriendId(whiteId);
				bean.setFriendStatus(0);
				dao.insert(bean);
			}
		} else if (temp2 != null && temp2.trim().length() != 0) {
			int blackId = 0;
			try {
				blackId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			bean = dao.select(mb.getMemberId(), blackId);
			if (bean != null) {
				bean.setFriendStatus(1);
				dao.update(bean);
			} else {
				bean = new FriendBean();
				bean.setMemberId(mb.getMemberId());
				bean.setFriendId(blackId);
				bean.setFriendStatus(1);
				dao.insert(bean);
			}
		}
		
		request.getRequestDispatcher("FriendHomeServlet").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
