package controller;

import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.MemberBean;
import model.MsgBean;
import model.FriendBean;
import model.dao.MemberDAOJdbc;
import model.dao.MsgDAOJdbc;
import model.dao.FriendDAOJdbc;

@WebServlet("/FindFriends/FriendCheckingServlet")
public class FriendCheckingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//得到當前使用者的登入狀態
		HttpSession session = request.getSession();
		MemberBean bean = (MemberBean)session.getAttribute("LoginOK");
		
		int friendCheckerId = bean.getMemberId();
		FriendDAOJdbc daof = new FriendDAOJdbc();	
		List<FriendBean> initList = daof.selectByMemberId(friendCheckerId);
		request.setAttribute("friendList", initList);
		request.getRequestDispatcher("FriendList.jsp").forward(request, response);
		
		//抓取當前使用者的ID，產生帶有該成員編號的清單：intList
		//initList是最一開始的總表，內容包括該會員的 好友(friendStatus = 1） 以及 拒絕往來戶(friendStatus = 0）
		
		
		/*//根據好友或封鎖將清單一分為二(未釐清)
		List<FriendBean> friendList = initList.subList(fromIndex, toIndex);
		List<FriendBean> blockedList = */
		//MemberBean beanm = new MemberBean();
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
