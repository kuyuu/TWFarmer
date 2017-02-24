package controller.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.MsgBean;
import model.daojdbc.MsgDAOJdbc;

@WebServlet("/Message/DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("msgId");
		String value = request.getParameter("value");
		
		int msgId = Integer.parseInt(temp);
		MsgDAOJdbc dao = new MsgDAOJdbc();
		MsgBean bean = dao.select(msgId);
		if("reader".equals(value)){
			bean.setReaderDelete(1);
			dao.update(bean);
		} else {
			bean.setWriterDelete(1);
			dao.update(bean);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
