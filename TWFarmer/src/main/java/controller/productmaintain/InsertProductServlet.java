package controller.productmaintain;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MemberBean;
import model.bean.ProductBean;
import model.daojdbc.ProductDAOjdbc;

@WebServlet("/ProductMaintain/InsertProductServlet")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 輸入資料編碼
		request.setCharacterEncoding("UTF-8");
		// 取出session物件
		HttpSession session = request.getSession();
		
		// 1.讀取使用者輸入的資料============================================
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");

		// 2.存放錯誤訊息============================================
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);

		// 3.轉換資料============================================
	
		// 如果有錯誤訊息，就顯示在MemberTemp.jsp(錯誤訊息顯示在欄位旁邊)
		if (errorMessage != null && !errorMessage.isEmpty()) {
			request.getRequestDispatcher("MemberTemp.jsp").forward(request, response);
			return;
		}

		// 4.呼叫Model(扮演封裝資料的角色)============================================
		ProductBean productBean = new ProductBean();
		productBean.setSellerId(mb.getMemberId());

		// 5.挑選適當頁面============================================
		session.setAttribute("product", productBean);

//		request.getRequestDispatcher("ProductInsert.jsp").forward(request, response);
		response.sendRedirect("ProductInsert.jsp");	//網址改為新網頁
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
