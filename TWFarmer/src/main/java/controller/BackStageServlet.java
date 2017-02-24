package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MemberBean;
import model.bean.ProductBean;
import model.bean.ViolationBean;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ViolationDAOJdbc;

@WebServlet("/BackStage/BackStageServlet")
public class BackStageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb != null) {
			request.getRequestDispatcher("WelcomeMember.jsp").forward(request, response);
//			if (mb.getIdType() == 2) {
//				ProductDAOjdbc dao1 = new ProductDAOjdbc();
//				List<ProductBean> list1 = dao1.selectBySellerId(mb.getMemberId());
//				request.setAttribute("productList", list1);
//				request.getRequestDispatcher("farmerManageProduct.jsp").forward(request, response);
//			} else if (mb.getIdType() == 3) {
//				ViolationDAOJdbc dao = new ViolationDAOJdbc();
//				List<ViolationBean> list = dao.selectAllUntreated();
//				request.setAttribute("violationList", list);
//				request.getRequestDispatcher("managerViolation.jsp").forward(request, response);
//			} else {
//				request.getRequestDispatcher("MemberCheckJpServlet").forward(request, response);
//			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
