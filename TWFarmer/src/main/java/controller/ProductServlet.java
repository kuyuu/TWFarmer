package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProductBean;
import model.bean.ProductPicBean;
import model.bean.QnABean;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ProductPicDAOJdbc;
import model.daojdbc.QnADAOJdbc;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("productId");

		int productId = 0;
		if (temp != null && temp.trim().length() != 0) {
			try {
				productId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		ProductDAOjdbc dao = new ProductDAOjdbc();
		ProductBean bean = dao.select(productId);
		request.setAttribute("productBean", bean);

		ProductPicDAOJdbc dao2 = new ProductPicDAOJdbc();
		List<ProductPicBean> list = dao2.selectByProductId(productId);
		request.setAttribute("picList", list);
		
		QnADAOJdbc dao3 = new QnADAOJdbc();
		List<QnABean> list1 = dao3.selectByProductId(productId);
		request.setAttribute("QnA", list1);

		request.getRequestDispatcher("Product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
