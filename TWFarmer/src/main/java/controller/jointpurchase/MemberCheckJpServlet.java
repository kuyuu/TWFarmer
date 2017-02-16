package controller.jointpurchase;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.JointPurchaseBean;
import model.MemberBean;
import model.dao.JointPurchaseDAOjdbc;

@WebServlet("/BackStage/MemberCheckJpServlet")
public class MemberCheckJpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
		JointPurchaseDAOjdbc dao2 = new JointPurchaseDAOjdbc();
		List<JointPurchaseBean> list3 = dao2.selectByInitId(mb.getMemberId());
		request.setAttribute("initJpList", list3);
		request.getRequestDispatcher("/BackStage/memberCheckJp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
