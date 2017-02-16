package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FarmerBean;
import model.MemberBean;
import model.dao.FarmerDAOJdbc;
import model.dao.MemberDAOJdbc;

@WebServlet(
		urlPatterns={"/ToBeFarmer/NewFarmerServlet"}
)
public class NewFarmerServlet extends HttpServlet {
	private FarmerDAOJdbc farmerDAOJdbc = new FarmerDAOJdbc();
	private MemberDAOJdbc memberDAOJdbc = new MemberDAOJdbc();
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
    }
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		//接收資料
    	String farmerId = request.getParameter("farmerId");
    	String bank = request.getParameter("bank");
    	String bankAccount = request.getParameter("bankAccount");
//    	String temp6 = request.getParameter("memberId");
//		String account  = request.getParameter("account") ;
		//String password  = request.getParameter("password");
//		String name  = request.getParameter("name");
//		String postalcode  = request.getParameter("postalCode");
//		String district  = request.getParameter("district");
//		String address  = request.getParameter("address");
//		String phone  = request.getParameter("phone");
//		String email  = request.getParameter("email");
		String farmerIntro =request.getParameter("farmerIntro");
		//String idnumber  = request.getParameter("idNumber");
		//String birthdate  = request.getParameter("birthDate");
		//String gender  = request.getParameter("gender");
		System.out.println("farmerId=" + farmerId + ";bank=" + bank + ";bankAccount=" + bankAccount + ";farmerIntro=" + farmerIntro);
		//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if(mb.getIdType()==2 || mb.getIdType()==4){
			errors.put("farmer", "已為小農身分或審核中");
			request.getRequestDispatcher("/ToBeFarmer/UpToFarmer.jsp").forward(request, response);
			return;
		}
		
		if(farmerId == null || farmerId.length() == 0){
			errors.put("farmerId", "請提供中華民國農民證號");	
		}
		
		if(bank == null || bank.length() == 0){
			errors.put("bank", "請選擇銀行代碼");	
		}
		
		if(bankAccount == null || bankAccount.length() == 0){
			errors.put("bankAccount", "請輸入銀行帳號");	
		}
		
		if(farmerIntro==null||farmerIntro.length()==0){
			errors.put("farmerIntro", "賣場介紹必填，否則不予核准。");
		}
					
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/ToBeFarmer/UpToFarmer.jsp").forward(request, response);
			return;
		}
				
				
		//轉換資料
		
//		java.util.Date birthDate = null;
		/*if(birthdate!=null && birthdate.length()!=0) {
			try {
				birthDate = sFormat.parse(birthdate);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("birthDate", "生日日期格式必須是yyyy-mm-dd");
			}
		}*/

//		int memberId = 0;
//		if (temp6 != null && temp6.length() != 0) {
//			try {
//				memberId = Integer.parseInt(temp6);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				errors.put("memberId", "必須是已註冊會員的編號");
//			}
//		}	

			
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
		FarmerBean farmerBean = new FarmerBean();
		farmerBean.setMemberId(mb.getMemberId());
		farmerBean.setFarmerId(farmerId);
		farmerBean.setBank(bank);
		farmerBean.setBankAccount(bankAccount);
		farmerBean.setFarmerIntro(farmerIntro);
		
		MemberBean memberBean = memberDAOJdbc.select(mb.getMemberId());
		memberBean.setIdType(4);
        
        if(farmerBean != null){
        	FarmerBean result = farmerDAOJdbc.insert(farmerBean);
        	System.out.println(farmerBean);
        	request.setAttribute("insert", result);
        	request.getRequestDispatcher("farmerSuccess.jsp").forward(request,response);
        }
		
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		
	}


}
