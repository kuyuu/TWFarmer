package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProductBean;
import model.bean.ProductPicBean;
import model.daojdbc.ProductDAOjdbc;

@WebServlet(urlPatterns = { "/ProductSelect/ProductSelectAllServlet" })
public class ProductSelectAllServlet extends HttpServlet {

	private ProductDAOjdbc productDAOjdbc = new ProductDAOjdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = "";
		Map<ProductBean, List<ProductPicBean>> result = productDAOjdbc.selectByName(keyword);
		request.setAttribute("keyword", result);
		request.getRequestDispatcher("/ProductSelect/ProductSelect.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
