package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.json.simple.JSONValue;

import model.bean.JointPurchaseBean;
import model.daojdbc.JointPurchaseDAOjdbc;

@WebServlet(
		urlPatterns={"/PurchaseSelect/PurchaseSelect.controller"}
)
public class PurchaseSelectServlet extends HttpServlet {
	private JointPurchaseDAOjdbc jointPurchaseDAOjdbc = new JointPurchaseDAOjdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String keyword = request.getParameter("keyword");
		String temp1 = request.getParameter("district");
		String temp2 = request.getParameter("district2");
		
		String district = null;
		if (temp2.length() != 0){
			String district2 = temp2.substring(3);
			district = temp1 + district2 ;
		}
		
//		System.out.println("keyword=" + keyword + ",temp1=" + temp1 + ",temp2=" + temp2 + ",district=" + district);
		// 驗證資料
		
		// 轉換資料
		
		// 呼叫Model
		if(keyword.length() != 0 && district != null){
			List<JointPurchaseBean> result = jointPurchaseDAOjdbc.selectByKnL(keyword ,district);
			request.setAttribute("keyword", result);
			request.getRequestDispatcher(
					"/PurchaseSelect/PurchaseSelect.jsp").forward(request, response);
		} else if(keyword.length() != 0 && district == null){
			List<JointPurchaseBean> result = jointPurchaseDAOjdbc.selectByKeyword(keyword);
			request.setAttribute("keyword", result);
			request.getRequestDispatcher(
					"/PurchaseSelect/PurchaseSelect.jsp").forward(request, response);
		} else if(district != null && keyword.length() == 0){
			List<JointPurchaseBean> result = jointPurchaseDAOjdbc.selectByKeyword(district);
			request.setAttribute("keyword", result);
			request.getRequestDispatcher(
					"/PurchaseSelect/PurchaseSelect.jsp").forward(request, response);
		} else {
			List<JointPurchaseBean> result = jointPurchaseDAOjdbc.selectByPurchaseOk();
			request.setAttribute("keyword", result);
			request.getRequestDispatcher(
					"/PurchaseSelect/PurchaseSelect.jsp").forward(request, response);
		}
		
//		String jsonString = JSONValue.toJSONString(result);
//		 out.println(jsonString);
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}
