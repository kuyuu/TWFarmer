package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MsgBean;
import model.dao.MsgDAOJdbc;

@WebServlet("/Msg/MsgCheckingServlet")
public class MsgCheckingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("msgReaderId");
		int msgReaderId = 0;
		if (temp != null && temp.trim().length() != 0) {
			msgReaderId = Integer.parseInt(temp);
		}
		
		MsgDAOJdbc dao = new MsgDAOJdbc();
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
