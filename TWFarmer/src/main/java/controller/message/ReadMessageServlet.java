package controller.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FriendBean;
import model.MsgBean;
import model.dao.FriendDAOJdbc;
import model.dao.MsgDAOJdbc;

@WebServlet("/Message/ReadMessageServlet")
public class ReadMessageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("msgId");
		String value = request.getParameter("value");
		int msgId = Integer.parseInt(temp);

		MsgDAOJdbc dao = new MsgDAOJdbc();
		MsgBean bean = dao.select(msgId);
		bean.setMsgStatus(1);
		bean = dao.update(bean);
		request.setAttribute("msgBean", bean);
		FriendDAOJdbc dao2 = new FriendDAOJdbc();
		FriendBean fBean = new FriendBean();

		if ("reader".equals(value)) {
			request.setAttribute("value", "reader");
			fBean = dao2.select(bean.getMsgReaderId(), bean.getMsgWriterId());
			if (fBean != null && fBean.getFriendStatus() == 0) {
				request.setAttribute("friend", true);
			}
		} else {
			request.setAttribute("value", "writer");
			fBean = dao2.select(bean.getMsgWriterId(), bean.getMsgReaderId());
			if (fBean != null && fBean.getFriendStatus() == 0) {
				request.setAttribute("friend", true);
			}
		}

		request.getRequestDispatcher("readMessage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
