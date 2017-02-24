package controller.jointpurchase;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.JointPurchaseBean;
import model.bean.MemberBean;
import model.daojdbc.JointPurchaseDAOjdbc;
@WebServlet("/BackStage/FarmerCheckJpServlet")
public class FarmerCheckJpServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
		JointPurchaseDAOjdbc dao2 = new JointPurchaseDAOjdbc();
		List<JointPurchaseBean> list = dao2.selectJpIdBySellerId(mb.getMemberId());
		request.setAttribute("jpList", list);
		List<JointPurchaseBean> list2 = dao2.selectJpIdBySellerId2(mb.getMemberId());
		request.setAttribute("jpList2", list2);
		request.getRequestDispatcher("/BackStage/farmerCheckJP.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
