package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MemberBean;
import model.dao.MemberDAOJdbc;



@WebServlet(urlPatterns = { "/FindFriends/MemberSelect.controller" })
public class MemberSelectServlet extends HttpServlet {
	private MemberDAOJdbc memberDAOjdbc = new MemberDAOJdbc();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收資料
		String keyword = request.getParameter("keyword");
		//String selectBy = request.getParameter("selectBy");
		//String selectBy2 = request.getParameter("selectBy2");

		// 驗證資料
		// Map<String, String> errors = new HashMap<String, String>();
		// request.setAttribute("errors", errors);
		// if(name==null || name.length()==0){
		// errors.put("name","請輸入產地名稱");
		// }
		//
		// if(errors!=null && !errors.isEmpty()) {
		// request.getRequestDispatcher(
		// "/ProductSelect/product.jsp").forward(request, response);
		// return;
		// }

		// 轉換資料

		// 呼叫Model
		// ProductBean bean = new ProductBean();
		// bean.setOrigin(name);
		// bean.setProductTypeName(selectBy);

		// 根據Model執行結果，決定需要顯示的View元件
	
		List<MemberBean> result = memberDAOjdbc.selectByAccName(keyword);
			request.setAttribute("keyword", result);
			request.getRequestDispatcher("/FindFriends/MemberSelect.jsp").forward(request, response);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
