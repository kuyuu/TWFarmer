package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.MemberService;
import model.dao.MemberDAOJdbc;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet(
		urlPatterns={"/Login.controller"}
)
public class LoginServlet extends HttpServlet {

//	@Override
//	protected void doGet(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		
//		
//		String action = String.valueOf(request.getParameter("action"));
// 	
//		if(action.equals("logout")) {
//			request.getSession().removeAttribute("MemberBean");
//			response.sendRedirect("MemberBean");
//		}else {
//			//user
//			request.getRequestDispatcher("/Login.jsp").forward(request, response);
//		}		
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//
//		String account = String.valueOf(request.getParameter("account"));
//		String password = String.valueOf(request.getParameter("password"));		
//	
//		//MemberBean memberBean = new MemberBean(account,password);
//		
//		MemberDAOJdbc memberDAO = new  MemberDAOJdbc();
//		MemberBean member = memberDAO.findByAccountAndPassword(account , password);
//		
//		if(member == null) {
//			response.sendRedirect("/TWFarmer/Login.jsp");
//		}else {
//			response.sendRedirect("/TWFarmer/index.jsp");;
//		}
//		
//		
//		if(!validateUser(memberBean)) {
//			System.out.println("not logon!");
//			response.sendRedirect("MemberBean");
//			return;
//		}else {
//			request.getSession().setAttribute("MemberBean", memberBean);
//			System.out.println("login!");
//			response.sendRedirect("Order/InsertOrderServlet");
//		}
//	}
//}

	private MemberService memberService = new MemberService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
    }

	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		//接收資料
		String account  = request.getParameter("account") ;
		String password  = request.getParameter("password");
		String requestURI = (String) session.getAttribute("requestURI");

		System.out.println(account+":"+password);
		System.out.println("接收資料");
		
		
		//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
			
		if(account==null||account.trim().length()==0){
			errors.put("account", "請輸入帳號");
		}

		if(password==null||password.trim().length()==0){
			errors.put("password", "請輸入密碼");
		}
				
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/Login.jsp").forward(request, response);
			return;
		}
				
		System.out.println("驗證資料");
				
		//轉換資料
        
		// 4. 進行 Business Logic 運算
		// 將LoginServiceDB類別new為物件，存放物件參考的變數為 lsdb
		MemberService ms = new MemberService();
			try {
				// 呼叫 ms物件的 checkIDPassword()，要記得傳入userid與password兩個參數
				MemberBean mb = ms.login(account, password);
				if (mb != null && !"".equals(mb)) {
					// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"
					session.setAttribute("LoginOK", mb);
				} 
				//		} catch (NamingException e) {
				//		} catch (SQLException e) {
				//			errors.put("LoginError",
				//					"LoginServlet->SQLException:" + e.getMessage());
				//			e.printStackTrace();
				//		}
			} catch (Exception e) {
					errors.put("LoginError",
							"該帳號不存在或密碼錯誤");
					e.printStackTrace();
			}
			
			
			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
			
			MemberDAOJdbc memberDAO = new  MemberDAOJdbc();
			MemberBean member = memberDAO.findByAccountAndPassword(account , password);
			
			if(member == null) {
				// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
				RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
				rd.forward(request, response);
				return;
			}else {
				session.setAttribute("contextMemberBean", member);
				RequestDispatcher rd = request.getRequestDispatcher("/test/ShowMember.jsp");
				rd.forward(request, response);
				return;

//				// 此時不要用下面兩個敘述，因為網址列的URL不會改變
//				// RequestDispatcher rd = request.getRequestDispatcher("...");
//				// rd.forward(request, response);
//				if (requestURI != null) {
//					requestURI = (requestURI.length() == 0 ? request
//							.getContextPath() : requestURI);
//					response.sendRedirect(response.encodeRedirectURL(requestURI));
//					return;
//				} else {
//					response.sendRedirect(response.encodeRedirectURL(request
//							.getContextPath()));
//					return;
//				}
			}

			
	}


}
