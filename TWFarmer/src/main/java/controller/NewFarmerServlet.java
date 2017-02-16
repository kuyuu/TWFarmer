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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.FarmerBean;
import model.MemberBean;
import model.MemberDAO;
import model.MemberService;
import model.dao.FarmerDAOJdbc;
import model.dao.MemberDAOJdbc;
import model.dao.MsgDAOJdbc;

@WebServlet(
		urlPatterns={"/ToBeFarmer/NewFarmerServlet"}
)
public class NewFarmerServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");

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
    	String farmerId = request.getParameter("farmerId");
    	String temp6 = request.getParameter("memberId");
		String account  = request.getParameter("account") ;
		//String password  = request.getParameter("password");
		String name  = request.getParameter("name");
		String postalcode  = request.getParameter("postalCode");
		String district  = request.getParameter("district");
		String address  = request.getParameter("address");
		String phone  = request.getParameter("phone");
		String email  = request.getParameter("email");
		String farmerIntro =request.getParameter("farmerIntro");
		//String idnumber  = request.getParameter("idNumber");
		//String birthdate  = request.getParameter("birthDate");
		//String gender  = request.getParameter("gender");

	
		
		//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		if(farmerId == null || farmerId.length() == 0){
			errors.put("farmerId", "請提供中華民國農民證號");	
			}
		
		if(temp6 == null || temp6.length() == 0){
			errors.put("memberId", "必須是已註冊會員的編號");	
			}
		
		if(farmerIntro==null||farmerIntro.length()==0)
		{errors.put("farmerIntro", "賣場介紹必填，否則不予核准。");}
		
		if(account==null||account.length()==0){
			errors.put("account", "請輸入帳號");
		}

/*		if(password==null||password.length()==0){
			errors.put("password", "請輸入密碼");
		}*/
				
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
					
	/*	if(idnumber==null||idnumber.length()==0){
			errors.put("idnumber", "請輸入您的身分證字號");
		}

		if(birthdate==null||birthdate.length()==0){
			errors.put("birthdate", "請選擇您的生日");
		}

		if(gender==null||gender.length()==0){
			errors.put("gender", "請選擇您的性別");
		}*/
					
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/ToBeFarmer/UpToFarmer.jsp").forward(request, response);
			return;
		}
				
		System.out.println("驗證資料");
				
		//轉換資料
		
		java.util.Date birthDate = null;
		/*if(birthdate!=null && birthdate.length()!=0) {
			try {
				birthDate = sFormat.parse(birthdate);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("birthDate", "生日日期格式必須是yyyy-mm-dd");
			}
		}*/

		int memberId = 0;
		if (temp6 != null && temp6.length() != 0) {
			try {
				memberId = Integer.parseInt(temp6);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("memberId", "必須是已註冊會員的編號");
			}
		}	
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/ToBeFarmer/UpToFarmer.jsp").forward(request, response);
			return;
		}

			
//			// 4. 進行 Business Logic 運算
//			MemberSubmitService mss = new MemberSubmitService();
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
		MemberDAOJdbc dao = new MemberDAOJdbc();
		MemberBean memberBean = dao.select(memberId);
		FarmerDAOJdbc dao2 = new FarmerDAOJdbc();
		FarmerBean farmerBean = new FarmerBean();
		memberBean.setAccount(account);
		//bean.setPassword(password);
		memberBean.setName(name);
		memberBean.setPostalCode(postalcode);
		memberBean.setDistrict(district);
		memberBean.setAddress(address);
		memberBean.setPhone(phone);
		memberBean.setEmail(email);
		//bean.setIdNumber(idnumber);
		//bean.setBirthDate(birthDate);
		//bean.setGender(gender);
		memberBean.setIdType(4);
		//bean.setRating(0);
        dao.update2(memberBean);
        farmerBean.setFarmerId(farmerId);
        farmerBean.setMemberId(memberId);
        farmerBean.setFarmerIntro(farmerIntro);
        dao2.insert(farmerBean);
        //Can we change the format of Farmer ID?? 
        session.setAttribute("farmerBean", farmerBean);
        session.setAttribute("memberBean", memberBean);
        
        
        request.getRequestDispatcher("farmerSuccess.jsp").forward(request,response);
		
		
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		
	}


}
