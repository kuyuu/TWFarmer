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

import model.bean.FarmerBean;
import model.bean.MemberBean;
import model.daojdbc.FarmerDAOJdbc;
import model.daojdbc.MemberDAOJdbc;

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
		String farmerIntro =request.getParameter("farmerIntro");
//		System.out.println("farmerId=" + farmerId + ";bank=" + bank + ";bankAccount=" + bankAccount + ";farmerIntro=" + farmerIntro);
		
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
			errors.put("farmerIntro", "賣場介紹必填，否則不予核准");
		}
					
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/ToBeFarmer/UpToFarmer.jsp").forward(request, response);
			return;
		}
							
		//轉換資料

		//呼叫Model
		FarmerBean farmerBean = new FarmerBean();
		farmerBean.setMemberId(mb.getMemberId());
		farmerBean.setFarmerId(farmerId);
		farmerBean.setBank(bank);
		farmerBean.setBankAccount(bankAccount);
		farmerBean.setFarmerIntro(farmerIntro);
		
		MemberBean memberBean = memberDAOJdbc.select(mb.getMemberId());
		memberBean.setIdType(4);
		
        if(farmerBean != null ){
        	FarmerBean result = farmerDAOJdbc.insert(farmerBean);
        	MemberBean result2= memberDAOJdbc.update(memberBean);
        	request.setAttribute("farmerBean", result);
        	request.setAttribute("memberBean", result2);
        	session.setAttribute("LoginOK", memberBean);
        	request.getRequestDispatcher("farmerSuccess.jsp").forward(request,response);
        }
		
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		
	}


}
