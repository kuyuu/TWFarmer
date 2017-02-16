package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.ProductBean;
import model.dao.ProductDAOjdbc;

@WebServlet("/BackStage/BackStageServlet")
public class BackStageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb != null) {
			if (mb.getIdType() == 2) {
				ProductDAOjdbc dao1 = new ProductDAOjdbc();
				List<ProductBean> list1 = dao1.selectBySellerId(mb.getMemberId());
				request.setAttribute("productList", list1);
				request.getRequestDispatcher("farmerManageProduct.jsp").forward(request, response);
			} else if (mb.getIdType() == 3) {

			} else {
				request.getRequestDispatcher("../Order/ListOrderServlet").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
