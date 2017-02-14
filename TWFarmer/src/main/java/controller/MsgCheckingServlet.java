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
import model.dao.MemberDAOJdbc;
import model.dao.MsgDAOJdbc;

@WebServlet("/Msg/MsgCheckingServlet")
public class MsgCheckingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean bean = (MemberBean)session.getAttribute("LoginOK");
		int msgReaderId = bean.getMemberId();
		MsgDAOJdbc dao = new MsgDAOJdbc();
		//根據收件者的ID決定被讀取的信
		List<MsgBean> list = dao.selectByReaderId(msgReaderId);
		
		request.setAttribute("msgList", list);
		
		request.getRequestDispatcher("MsgCheck.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
