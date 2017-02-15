package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MsgBean;
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
			
		} else if("torch".equals(value)) {
			dao.delete(msgId);
		}
		request.getRequestDispatcher("MsgDeleted.jsp").forward(request, response);
		response.sendRedirect("/MsgDeleted.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
