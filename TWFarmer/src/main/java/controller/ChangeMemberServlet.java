package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.dao.MemberDAOJdbc;

@WebServlet(
		urlPatterns={"/BackStage/ChangeMemberServlet"})
public class ChangeMemberServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private MemberDAOJdbc memberDAOJdbc = new MemberDAOJdbc();
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
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String temp1 = request.getParameter("birthDate");
		String gender = request.getParameter("gender");
		String postalCode = request.getParameter("postalCode");
		String district = request.getParameter("district");
		String address = request.getParameter("address");
		String submit = request.getParameter("submit");
		
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		if("cancel".equals(submit)){
			request.getRequestDispatcher(
					"/BackStage/WelcomeMember.jsp").forward(request, response);
		}
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if(name == null || name.length() == 0){
			errors.put("name", "姓名不可為空白");
		}
		
		if(phone == null || phone.length() == 0){
			errors.put("phone", "電話不可為空白");
		}
		
		if(email == null || email.length() == 0){
			errors.put("email", "電子信箱不可為空白");
		}
		
		if(temp1 == null || temp1.length() == 0){
			errors.put("birthDate", "生日不可為空白");
		}
		
		if(gender == null || gender.length() == 0){
			errors.put("gender", "請選擇性別");
		}
		
		if(postalCode == null || postalCode.length() == 0){
			errors.put("postalCode", "郵遞區號不可為空白");
		}
		
		if(district == null || district.length() == 0){
			errors.put("district", "居住地區不可為空白");
		}
		
		if(address == null || address.length() == 0){
			errors.put("address", "地址不可為空白");
		}
		
		java.util.Date birthDate = null;
		if(temp1!=null && temp1.length()!=0) {
			try {
				birthDate = sFormat.parse(temp1);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("birthDate", "生日格式必須是yyyy-mm-dd");
			}
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/BackStage/changeMemberInfo.jsp").forward(request, response);
			return;
		}
		
		MemberBean bean = memberDAOJdbc.select(mb.getMemberId());
		bean.setName(name);
		bean.setPhone(phone);
		bean.setEmail(email);
		bean.setBirthDate(birthDate);
		bean.setGender(gender);
		bean.setPostalCode(postalCode);
		bean.setDistrict(district);
		bean.setAddress(address);
	}

}
