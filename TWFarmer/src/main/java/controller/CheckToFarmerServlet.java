package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.FarmerBean;
import model.bean.MemberBean;
import model.daojdbc.FarmerDAOJdbc;
import model.daojdbc.MemberDAOJdbc;

@WebServlet(urlPatterns = "/BackStage/CheckToFarmerServlet")
public class CheckToFarmerServlet extends HttpServlet {
	private FarmerDAOJdbc farmerDAOJdbc = new FarmerDAOJdbc();
	private MemberDAOJdbc memberDAOJdbc = new MemberDAOJdbc();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("memberId");
		String button = request.getParameter("button");
		
		int memberId = 0;
		if(temp1!=null && temp1.length()!=0) {
			try {
				memberId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} 
		}
		
		if("OK".equals(button)){
			MemberBean bean = memberDAOJdbc.select(memberId);
			bean.setIdType(2);
			MemberBean memberBean = memberDAOJdbc.update(bean);
			request.setAttribute("Member", memberBean);
			request.getRequestDispatcher("/BackStage/SelectFarmerUpServlet").forward(request, response);
		} else if("NO".equals(button)){
			MemberBean bean = memberDAOJdbc.select(memberId);
			bean.setIdType(1);
			MemberBean memberBean = memberDAOJdbc.update(bean);
			boolean result1 = farmerDAOJdbc.deleteByMemberId(memberId);
			request.setAttribute("member", memberBean);
			request.getRequestDispatcher("/BackStage/SelectFarmerUpServlet").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
