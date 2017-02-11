package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductDiscountBean;
import model.ProductPicBean;
import model.dao.ProductDAOjdbc;
import model.dao.ProductDiscountDAOjdbc;
import model.dao.ProductPicDAOJdbc;
@WebServlet("/BackStage/ToProductServlet")
public class DeleteProductServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("productId");
		
		int productId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				productId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
	
		ProductDAOjdbc dao = new ProductDAOjdbc();
		ProductBean bean = dao.select(productId);
		request.setAttribute("productBean", bean);
		
		ProductDiscountDAOjdbc dao2 = new ProductDiscountDAOjdbc();
		List<ProductDiscountBean> list = dao2.selectByProductId(productId);
		request.setAttribute("productDiscountList", list);
		
		ProductPicDAOJdbc dao3 = new ProductPicDAOJdbc();
		List<ProductPicBean> list2 = dao3.selectByProductId(productId);
		request.setAttribute("productPicList", list2);
		
		request.getRequestDispatcher("../ProductMaintain/ProductDelete.jsp").forward(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
