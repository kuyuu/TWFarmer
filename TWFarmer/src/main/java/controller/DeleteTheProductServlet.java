package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDiscountBean;
import model.ProductPicBean;
import model.dao.ProductDAOjdbc;
import model.dao.ProductDiscountDAOjdbc;
import model.dao.ProductPicDAOJdbc;

@WebServlet("/BackStage/DeleteTheProductServlet")
public class DeleteTheProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收資料
		String temp = request.getParameter("productId");

		// 轉換資料
		int productId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				productId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		// 呼叫Model，根據Model執行結果，決定需要顯示的View元件
		ProductDAOjdbc dao = new ProductDAOjdbc();
		boolean bean = dao.delete(productId);
		request.setAttribute("productBean", bean);

		ProductDiscountDAOjdbc dao2 = new ProductDiscountDAOjdbc();
		boolean list = dao2.delete(productId);
		request.setAttribute("productDiscountList", list);

		ProductPicDAOJdbc dao3 = new ProductPicDAOJdbc();
		boolean list2 = dao3.delete(productId);
		request.setAttribute("productPicList", list2);

		request.getRequestDispatcher("../ProductMaintain/ProductDeleteSuccess.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
