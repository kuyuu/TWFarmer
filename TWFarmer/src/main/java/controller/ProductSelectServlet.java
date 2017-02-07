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
		urlPatterns={"/ProductSelect/ProductSelect.controller"}
)
public class ProductSelectServlet extends HttpServlet {
	private ProductDAOjdbc productDAOjdbc = new ProductDAOjdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收資料
		String name = request.getParameter("name");
		String selectBy = request.getParameter("selectBy");
		
		//驗證資料
//		Map<String, String> errors = new HashMap<String, String>();
//		request.setAttribute("errors", errors);
//		if(name==null || name.length()==0){
//			errors.put("name","請輸入產地名稱");
//		}
//		
//		if(errors!=null && !errors.isEmpty()) {
//			request.getRequestDispatcher(
//					"/ProductSelect/product.jsp").forward(request, response);
//			return;
//		}
		
		//轉換資料

		//呼叫Model
//		ProductBean bean = new ProductBean();
//		bean.setOrigin(name);
//		bean.setProductTypeName(selectBy);
		
		//根據Model執行結果，決定需要顯示的View元件
		if(selectBy.length() == 0){
			List<ProductBean> result = productDAOjdbc.selectByName(name);
			request.setAttribute("name", result);
			request.getRequestDispatcher(
					"/ProductSelect/ProductSelect.jsp").forward(request, response);
		} else {
			List<ProductBean> result = productDAOjdbc.selectByType(selectBy);
			request.setAttribute("selectBy", result);
			request.getRequestDispatcher(
					"/ProductSelect/ProductSelect.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}
