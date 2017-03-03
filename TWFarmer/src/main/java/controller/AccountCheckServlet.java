package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.FarmerBean;
import model.bean.MemberBean;
import model.daojdbc.FarmerDAOJdbc;
import model.daojdbc.MemberDAOJdbc;

/**
 * Servlet implementation class AccountCheckServlet
 */
@WebServlet("/MemberSubmit/AccountCheckServlet")
public class AccountCheckServlet extends HttpServlet {
	
	 @Override
	 protected void doGet(HttpServletRequest request,
	 HttpServletResponse response) throws ServletException, IOException {
	 this.doPost(request, response);
	 }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
//		 接收資料
//		 1. 讀取使用者輸入資料(<Input>標籤內的name屬性分別為 account
		String newaccount = request.getParameter("newaccount");

		// 準備存放錯誤訊息的 Map<String, String> 物件 : msg
		Map<String, String> msg = new HashMap<String, String>();

		// 將 errors 放入 request 置物櫃內，識別字串為 "msg"
		request.setAttribute("msg", msg);

		MemberDAOJdbc mdj = new MemberDAOJdbc();
		
		MemberBean mb = mdj.selectByAccount(newaccount);
		
		System.out.println(newaccount);
		
		String strMsg = "該帳號可以使用";
		
		// 如果變數mb的值不等於 null,表示資料庫含有account的紀錄
		if (mb != null) {
			msg.put("newaccount", "帳號已存在");
			strMsg = "帳號已存在";
			System.out.println("nnn");
		} else {
			msg.put("newaccount", "該帳號可以使用");
			System.out.println("yyy");
		}
		out.write(strMsg);
		System.out.println(strMsg);
	}
}
