package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberBean;
import model.MemberService;
import model.dao.MemberDAOJdbc;
import model.dao.MsgDAOJdbc;

@WebServlet(
		urlPatterns={"/MemberSubmit/MemberSubmit.controller"}
)
public class MemberSubmitServlet extends HttpServlet {
	
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private MemberService memberService = new MemberService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
    }

	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
		//接收資料
		String account  = request.getParameter("account") ;
		String password  = request.getParameter("password");
		String name  = request.getParameter("name");
		String postalcode  = request.getParameter("postalcode");
		String district  = request.getParameter("district");
		String address  = request.getParameter("address");
		String phone  = request.getParameter("phone");
		String email  = request.getParameter("email");
		String idnumber  = request.getParameter("idnumber");
		String birthdate  = request.getParameter("birthDate");
		String gender  = request.getParameter("gender");

//		System.out.println(account+":"+password+":"+name+":"+postalcode+":"+district+":"+address+":"+phone+":"+email+":"+idnumber+":"+birthdate+":"+gender);
//		System.out.println("接收資料");
		
		//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
			
		if(account==null||account.length()==0){
			errors.put("account", "請輸入帳號");
		}

		if(password==null||password.length()==0){
			errors.put("password", "請輸入密碼");
		}
				
		if(name==null||name.length()==0){
			errors.put("name", "請輸入您的姓名");
		}

		if(postalcode==null||postalcode.length()==0){
			errors.put("postalcode", "請輸入您的郵遞區號");
		}
					
		if(district==null||district.length()==0){
			errors.put("district", "請選擇您的居住地區");
		}

		if(address==null||address.length()==0){
			errors.put("address", "請輸入您的居住地址");
		}
		
		if(phone==null||phone.length()==0){
			errors.put("phone", "請輸入您的手機");
		}

		if(email==null||email.length()==0){
			errors.put("email", "請輸入您的email");
		}
					
		if(idnumber==null||idnumber.length()==0){
			errors.put("idnumber", "請輸入您的身分證字號");
		}

		if(birthdate==null||birthdate.length()==0){
			errors.put("birthdate", "請選擇您的生日");
		}

		if(gender==null||gender.length()==0){
			errors.put("gender", "請選擇您的性別");
		}
					
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/MemberSubmit/MemberSubmit.jsp").forward(request, response);
			return;
		}
				
//		System.out.println("驗證資料");
				
		//轉換資料
		
		java.util.Date birthDate = null;
		if(birthdate!=null && birthdate.length()!=0) {
			try {
				birthDate = sFormat.parse(birthdate);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("birthDate", "生日日期格式必須是yyyy-mm-dd");
			}
		}

		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/MemberSubmit/MemberSubmit.jsp").forward(request, response);
			return;
		}

			
//			// 4. 進行 Business Logic 運算
			MemberService mss = new MemberService();
//			if (mss.idExists(account)) {
//				errorMsg.add("該代號 (" +  account  + ") 已經存在，請換新的代號");
//			} else {
//				try {
//					MemberBean mem = new MemberBean(account, password, name, postalcode, district, address, phone, email, idnumber, birthDate, gender);
//					mss.insert(mem);
//				} catch (SQLException e) {
//					errorMsg.add("儲存資料時發生錯誤，請檢查，例外=" + e.getMessage());
//					e.printStackTrace();
//				}
//			}

        
		//呼叫Model
		
		MemberBean bean = new MemberBean();
		bean.setAccount(account);
		bean.setPassword(password);
		bean.setName(name);
		bean.setPostalCode(postalcode);
		bean.setDistrict(district);
		bean.setAddress(address);
		bean.setPhone(phone);
		bean.setEmail(email);
		bean.setIdNumber(idnumber);
		bean.setBirthDate(birthDate);
		bean.setGender(gender);
		bean.setIdType(1);
		bean.setRating(0);

		
//        MemberDAO MemberDAO = new MemberDAOJdbc();
//        MemberDAO.insert(bean);
//        request.getRequestDispatcher("/SubmitSuccess.jsp").forward(request,
//                response);
		
		
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		request.setAttribute("account", account);
		MemberBean memberBean = null;

		if (errors.isEmpty())	{	
			MemberBean result = memberService.insert(bean);
			if(result==null) {
				errors.put("action", "Insert fail");
			} else {
				request.setAttribute("insert", result);
			}
			request.setAttribute("memberBean", result);
			request.getRequestDispatcher(
					"/MemberSubmit/SubmitSuccess.jsp").forward(request, response);
//			System.out.println("成功");
			return ; 

		}  else {
			RequestDispatcher rd = request.getRequestDispatcher("/MemberSubmit/MemberSubmit.jsp");
			rd.forward(request, response);
//			System.out.println("失敗");
			return;
		}


		
		
		
		
		
		
		
		//呼叫Model
//		MemberBean mb = memberSubmitService.insert(mb);

		//根據Model執行結果，決定需要顯示的View元件
//		if(bean==null) {
//			//login fail
//			errors.put("username", "註冊失敗");
//			request.getRequestDispatcher(
//					"/MemberSubmit/MemberSubmit.jsp").forward(request, response);
//		} else {
//			HttpSession session = request.getSession();
//			session.setAttribute("user", bean);
//			
//			String contextPath = request.getContextPath();
//			response.sendRedirect(contextPath+"/index.jsp");
//		}
//		
//		System.out.println("呼叫model");

//		//根據Model執行結果，決定需要顯示的View元件
//		
//		if(bean!=null) {
//			MemberBean result = memberSubmitService.insert(bean);
//			request.setAttribute("insert", result);
//			request.getRequestDispatcher(
//					"/MemberSubmit/SubmitSuccess.jsp").forward(request, response);
//		}
//
//		System.out.println("hahahaa");
//

	}


}
