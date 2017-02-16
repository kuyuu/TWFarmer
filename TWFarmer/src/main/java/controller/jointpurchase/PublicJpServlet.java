package controller.jointpurchase;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JointPurchaseBean;
import model.dao.JointPurchaseDAOjdbc;

@WebServlet("/BackStage/PublicJpServlet")
public class PublicJpServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("jpId");
		int jpId=Integer.parseInt(temp);
		JointPurchaseDAOjdbc dao = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = dao.select(jpId);
		jpBean.setJpStatusId(4103);
		dao.update(jpBean);
		request.getRequestDispatcher("MemberCheckJpServlet").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
