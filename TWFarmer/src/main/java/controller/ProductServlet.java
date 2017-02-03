package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.dao.ProductDAOjdbc;

@WebServlet(
		urlPatterns={"/ProductSelect/product.controller"}
)
public class ProductServlet extends HttpServlet {
	private ProductDAOjdbc productDAOjdbc = new ProductDAOjdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收資料
		String name = request.getParameter("name");
		String selectBy = request.getParameter("selectBy");
		//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		if(name==null || name.length()==0){
			errors.put("name","請輸入欲搜尋蔬果");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/ProductSelect/product.jsp").forward(request, response);
			return;
		}
		
		//轉換資料
		
		//呼叫Model
		ProductBean bean = new ProductBean();
		bean.setOrigin(name);
		//根據Model執行結果，決定需要顯示的View元件
		if("origin".equals(selectBy)) {
			List<ProductBean> result = productDAOjdbc.selectByName(name);
			request.setAttribute("name", result);
			request.getRequestDispatcher(
					"/ProductSelect/product.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}
