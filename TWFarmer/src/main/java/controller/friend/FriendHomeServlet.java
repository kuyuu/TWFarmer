package controller.friend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FriendBean;
import model.MemberBean;
import model.dao.FriendDAOJdbc;

@WebServlet("/Friend/FriendHomeServlet")
public class FriendHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		FriendDAOJdbc dao = new FriendDAOJdbc();
		List<FriendBean> list = dao.selectWhiteByMemberId(mb.getMemberId());
		request.setAttribute("whiteList", list);
		
		List<FriendBean> list2 = dao.selectBlackByMemberId(mb.getMemberId());
		request.setAttribute("blackList", list2);
		
		request.getRequestDispatcher("friendHome.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
