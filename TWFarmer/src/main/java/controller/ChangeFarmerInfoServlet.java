package controller;

import java.io.IOException;
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

@WebServlet(urlPatterns = { "/BackStage/ChangeFarmerInfoServlet" })
public class ChangeFarmerInfoServlet extends HttpServlet {
	private FarmerDAOJdbc farmerDAOJdbc = new FarmerDAOJdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bank = request.getParameter("bank");
		String bankAccount = request.getParameter("bankAccount");
		String farmerIntro = request.getParameter("farmerIntro");
		String submit = request.getParameter("submit");
		
		HttpSession session = request.getSession();
		FarmerBean fb = (FarmerBean) session.getAttribute("IsFarmer");
		
		if("cancel".equals(submit)){
			request.getRequestDispatcher(
					"/BackStage/FarmerInfo.jsp").forward(request, response);
			return;
		}
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if(bank == null || bank.length() == 0){
			errors.put("bank", "請選擇銀行代碼");
		}
		
		if(bankAccount == null || bankAccount.length() == 0){
			errors.put("bankAccount", "請輸入銀行帳號");
		}
		
		if(farmerIntro == null || farmerIntro.length() == 0){
			errors.put("farmerIntro", "賣場介紹必填，否則不予核准");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/BackStage/changeFarmerInfo.jsp").forward(request, response);
			return;
		}
		FarmerBean farmerBean = farmerDAOJdbc.select(fb.getFarmerId());
		farmerBean.setBank(bank);
		farmerBean.setBankAccount(bankAccount);
		farmerBean.setFarmerIntro(farmerIntro);
		
		if("change".equals(submit)){
			FarmerBean result= farmerDAOJdbc.update(farmerBean);
			request.setAttribute("FarmerBean", result);
			session.setAttribute("IsFarmer", result);
			request.getRequestDispatcher(
					"/BackStage/FarmerInfo.jsp").forward(request, response);
		}	
	}
	
}
