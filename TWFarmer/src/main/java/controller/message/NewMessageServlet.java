package controller.message;

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

@WebServlet("/Message/NewMessageServlet")
public class NewMessageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String readerAccount = request.getParameter("readerAccount");
		String msgTitle = request.getParameter("msgTitle");
		String msgContent = request.getParameter("msgContent");
		MsgDAOJdbc msgdao = new MsgDAOJdbc();
		MemberDAOJdbc mdao = new MemberDAOJdbc();

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (readerAccount == null || readerAccount.trim().length() == 0) {
			errors.put("readerAccount", "請輸入收件人帳號");
		}
		if (msgTitle == null || msgTitle.trim().length() == 0) {
			errors.put("msgTitle", "請輸入信件主旨");
		}
		if (msgContent == null || msgContent.trim().length() == 0) {
			errors.put("msgContent", "請輸入內容");
		}

		if (mdao.selectByAccount(readerAccount) == null) {
			errors.put("readerAccount", "帳號不存在");
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("newMessage.jsp").forward(request, response);
			return;
		}

		MsgBean msgBean = new MsgBean();
		msgBean.setMsgWriterId(mb.getMemberId());
		msgBean.setMsgReaderId(mdao.selectByAccount(readerAccount).getMemberId());
		msgBean.setMsgTitle(msgTitle);
		msgBean.setMsgContent(msgContent);
		Date date = new Date();
		msgBean.setMsgTime(date);
		msgBean.setMsgStatus(0);
		msgBean.setWriterDelete(0);
		msgBean.setReaderDelete(0);
		msgdao.insert(msgBean);

		request.getRequestDispatcher("MsgHomeServlet").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
