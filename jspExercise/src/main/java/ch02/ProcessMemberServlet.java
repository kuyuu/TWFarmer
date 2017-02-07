package ch02;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch02/member.do")
public class ProcessMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收資料
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String tempbirthday = request.getParameter("birthday");
		String tempweight = request.getParameter("weight");
		Timestamp registerDate = new Timestamp(System.currentTimeMillis());
		
		//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		//轉換資料
		Date birthday = null;
		try {
			birthday = java.sql.Date.valueOf(tempbirthday);
		} catch (Exception e) {
			e.printStackTrace();
			errors.put("birthday", "日期格式必須為yyyy-MM-dd");
			request.getRequestDispatcher("/ch02/InsertMemberForm.jsp").forward(request, response);
		}
		double weight = -1;
		try {
			weight = Double.parseDouble(tempweight.trim());
		} catch (NumberFormatException e) {
			e.printStackTrace();
			errors.put("weight", "體重格式必須為數字");
		}
		
		//呼叫Model
		MemberBean bean = new MemberBean();
		bean.setMemberId(memberId);
		bean.setName(name);
		bean.setPassword(password);
		bean.setAddress(address);
		bean.setPhone(phone);
		bean.setBirthday(birthday);
		bean.setWeight(weight);
		bean.setRegisterDate(registerDate);
		
		//根據Model執行結果，決定需要顯示的View元件
		try {
			MemberFileIO mfio = new MemberFileIO("c:\\data\\member.dat");
			mfio.insertMember(bean);
			request.setAttribute("bean", bean);
			request.getRequestDispatcher("/ch02/InsertMemberSuccess.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/ch02/InsertMemberError.jsp").forward(request, response);
			return;
		}
	}

}
