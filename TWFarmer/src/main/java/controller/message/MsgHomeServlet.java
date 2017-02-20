package controller.message;

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
import model.dao.MsgDAOJdbc;

@WebServlet("/Message/MsgHomeServlet")
public class MsgHomeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		MsgDAOJdbc dao = new MsgDAOJdbc();
		List<MsgBean> list = dao.selectByReaderId(mb.getMemberId());
		request.setAttribute("msgList", list);
		
		List<MsgBean> list2 = dao.selectByWriterId(mb.getMemberId());
		request.setAttribute("msgList2", list2);
		
		request.getRequestDispatcher("msgHome.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
