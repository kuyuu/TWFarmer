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
@WebServlet("/BackStage/FarmerCheckJpServlet")
public class FarmerCheckJpServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
		JointPurchaseDAOjdbc dao2 = new JointPurchaseDAOjdbc();
		List<JointPurchaseBean> list2 = dao2.selectJpIdBySellerId(mb.getMemberId());
		System.out.println(list2);
		request.setAttribute("jpList", list2);
		request.getRequestDispatcher("/BackStage/farmerCheckJP.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
