package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JointPurchaseBean;
import model.dao.JointPurchaseDAOjdbc;

@WebServlet(
		urlPatterns={"/PurchaseSelect/PurchaseSelect.controller"}
)
public class PurchaseSelectServlet extends HttpServlet {
	private JointPurchaseDAOjdbc jointPurchaseDAOjdbc = new JointPurchaseDAOjdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String keyword = request.getParameter("keyword");
		
		// 驗證資料
		
		// 轉換資料
		
		// 呼叫Model
		if(keyword.length() != 0){
			List<JointPurchaseBean> result = jointPurchaseDAOjdbc.selectByKeyword(keyword);
			request.setAttribute("keyword", result);
			request.getRequestDispatcher(
					"/PurchaseSelect/PurchaseSelect.jsp").forward(request, response);
		} else {
			List<JointPurchaseBean> result = jointPurchaseDAOjdbc.selectByPurchaseOk();
			request.setAttribute("keyword", result);
			request.getRequestDispatcher(
					"/PurchaseSelect/PurchaseSelect.jsp").forward(request, response);
		}
		
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}
