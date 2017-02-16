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
import model.MsgBean;
import model.dao.MemberDAOJdbc;
import model.dao.MsgDAOJdbc;

@WebServlet("/Msg/MsgCheckingDetail")
public class MsgCheckingDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("msgId");
		String value = request.getParameter("value");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int msgId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				msgId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("msgId", "msgId必須是整數");
			}
		}
		
		MsgDAOJdbc dao = new MsgDAOJdbc();
		MsgBean bean = dao.select(msgId);
		if ("reply".equals(value)) {						
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			MemberDAOJdbc dao2 = new MemberDAOJdbc();
			MemberBean bean2 = new MemberBean();
			int msgReaderId = dao.select(msgId).getMsgWriterId();
			String replyTitle = dao.select(msgId).getMsgTitle();
			String replyContent = dao.select(msgId).getMsgContent();
			Date replyMsgTime = dao.select(msgId).getMsgTime();
			bean.setMsgTitle(replyTitle);
			bean.setMsgContent(replyContent);
			bean.setMsgTime(replyMsgTime);
			session.setAttribute("msgReTitle", bean);
			
			String readerAccount = dao2.select(msgReaderId).getAccount();
			String readerName = dao2.select(msgReaderId).getName();
			bean2.setAccount(readerAccount);
			bean2.setName(readerName);
			session.setAttribute("memberBeanReader", bean2);
			
			request.getRequestDispatcher("MsgFormReply.jsp").forward(request, response);
//			response.sendRedirect("/MsgFormReply.jsp");		
		} else if("torch".equals(value)) {
			dao.delete(msgId);
			request.getRequestDispatcher("MsgDeleted.jsp").forward(request, response);
			return;
//			response.sendRedirect("/MsgDeleted.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
