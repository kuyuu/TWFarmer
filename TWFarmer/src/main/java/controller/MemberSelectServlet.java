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

import model.bean.MemberBean;
import model.daojdbc.MemberDAOJdbc;

@WebServlet(urlPatterns = { "/FindFriends/MemberSelect.controller" })
public class MemberSelectServlet extends HttpServlet {
	private MemberDAOJdbc memberDAOjdbc = new MemberDAOJdbc();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		// 接收資料
//		String keyword = request.getParameter("keyword");
//		Map<String, String> errors = new HashMap<String, String>();
//		request.setAttribute("errors", errors);
//
//		if (keyword == null || keyword.length() == 0) {
//			errors.put("keyword", "請輸入您想搜尋的會員帳號或姓名");
//		}
//
//		if (errors != null && !errors.isEmpty()) {
//			request.getRequestDispatcher("/FindFriends/MemberSelect.jsp").forward(request, response);
//			return;
//		}
//
//		// 如果使用者成功輸入密碼，就可顯示所有會員(還沒做出來)
//		if (keyword == "ShowMeTheMinions") {
//			List<MemberBean> result = memberDAOjdbc.selectByAccNameCheat();
//			request.setAttribute("keyword", result);
//			request.getRequestDispatcher("/FindFriends/MemberSelect.jsp").forward(request, response);
//		}
//		//否則需帳號或名字完全相符才可找到該員
//		else{
//			List<MemberBean> result = memberDAOjdbc.selectByAccName(keyword);
//			request.setAttribute("keyword", result);
//			request.getRequestDispatcher("/FindFriends/MemberSelect.jsp").forward(request, response);
//		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
