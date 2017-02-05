package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MsgBean;
import model.dao.MsgDAOJdbc;

@WebServlet("/Msg/MsgCreatingServlet")
public class MsgCreatingServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final long serialVersionUID = 1L;
	//====== INSERTING MESSAGE INTO TABLE MSG
	@Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//session.getAttribute("")
//mstWriterId 寄件人需要Session Scope技術 (Servlet / JSP II ch8)才能從網站取得，所以先寫死~
		
		String temp1 = request.getParameter("msgWriterId");
		String temp2 = request.getParameter("msgReaderId");
		String msgTitle = request.getParameter("msgTitle");
		String msgContent = request.getParameter("msgContent");		
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
	
		
		if (temp2 == null || temp2.length() == 0) {
			
				errors.put("msgReaderId", "請指明收件人之會員編號");	
		}

		if (msgTitle == null || msgTitle.length() == 0) {
			errors.put("msgTitle", "主旨為必填欄位");
		}
		if (msgContent == null || msgContent.length() == 0) {
			errors.put("msgContent", "內文為必填欄位");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"MsgForm.jsp").forward(request, response);
			return;
		}
		
	//SessionScope出來之後要知道如何呼叫寄件人帶入欄位中	
		int msgWriterId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				msgWriterId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("msgWriterId", "msgWriterId必須是整數");
			}
		
		int msgReaderId = 0;
		if (temp2 != null && temp2.length() != 0) {
			try {
				msgReaderId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("msgReaderId", "msgReaderId必須是整數");
			}
			
		
			
		}
		
	       // Setting the user's ID as Writer ID and the system time on his/her computer as Message Time
	   
	      			
	        MsgDAOJdbc daom = new MsgDAOJdbc();
			MsgBean msgBean = new MsgBean();
			msgBean.setMsgWriterId(msgWriterId);
			msgBean.setMsgReaderId(msgReaderId);
			msgBean.setMsgContent(msgContent);
			msgBean.setMsgTitle(msgTitle);
			java.util.Date date = new java.util.Date();
			msgBean.setMsgTime(date);
			msgBean = daom.insert(msgBean);
			//MsgBean firstRow = daom.select().get(0);
			
			//System.out.println(System.currentTimeMillis());
			//System.out.println(firstRow.getMsgTitle());
			
			session.setAttribute("msgBean", msgBean);
			
			request.getRequestDispatcher("MsgFormSuccess.jsp").forward(request, response);
			//response.sendRedirect("/MsgFormSuccess.jsp");
	
	}

}}
	
