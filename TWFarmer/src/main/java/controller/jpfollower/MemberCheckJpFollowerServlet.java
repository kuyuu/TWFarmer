package controller.jpfollower;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.JPFollowerBean;
import model.MemberBean;
import model.dao.JPFollowerDAOJdbc;

@WebServlet("/BackStage/MemberCheckJpFollowerServlet")
public class MemberCheckJpFollowerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		JPFollowerDAOJdbc dao = new JPFollowerDAOJdbc();
		List<JPFollowerBean> list = dao.selectByBuyerId(mb.getMemberId());
		request.setAttribute("jpFollowerList", list);
		request.getRequestDispatcher("/BackStage/memberCheckJpFollower.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
