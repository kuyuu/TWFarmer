package controller;

import java.io.IOException;

import java.util.Date;
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
import model.FriendBean;
import model.dao.FriendDAOJdbc;

@WebServlet("/FindFriends/AddFriendServlet")
public class AddFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		HttpSession session = request.getSession();
//		MemberDAOJdbc daom = new MemberDAOJdbc();
//		MemberBean memberBean = (MemberBean)session.getAttribute("LoginOK");
//		
//		int memberId = memberBean.getMemberId();
//		String account = memberBean.getAccount();
//	    
//		
//		String friend = request.getParameter("friendId");
//		String value = request.getParameter("value");
//
//		Map<String, String> errors = new HashMap<String, String>();
//		request.setAttribute("errors", errors);
//
//		int friendId = 0;
//		if (friend != null && friend.length() != 0) {
//			try {
//				friendId = Integer.parseInt(friend);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				errors.put("friendId", "friendId必須是整數");
//			}
//		}
//		
//		FriendDAOJdbc daof = new FriendDAOJdbc();
//		FriendBean friendBean = new FriendBean();
//		if ("add".equals(value)) {						
//			friendBean.setMemberId(memberId);
//			friendBean.setFriendId(friendId);
//			friendBean.setFriendStatus(1);
//			daof.insert(friendBean);
//			request.getRequestDispatcher("FriendList.jsp").forward(request, response);
////			response.sendRedirect("/MsgFormReply.jsp");		
//		} else if("block".equals(value)) {
//			friendBean.setMemberId(memberId);
//			friendBean.setFriendId(friendId);
//			friendBean.setFriendStatus(0);
//			daof.insert(friendBean);
//			request.getRequestDispatcher("FriendList.jsp").forward(request, response);
//			return;
////			response.sendRedirect("/MsgDeleted.jsp");
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
