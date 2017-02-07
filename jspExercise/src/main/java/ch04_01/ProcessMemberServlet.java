package ch04_01;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch04_01/member.do")
public class ProcessMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Collection<String> errorMessage = new ArrayList<String>();
		request.setAttribute("ErrorMsg", errorMessage);
		String id = request.getParameter("memberId");
		if (id == null || id.trim().length() == 0) {
			errorMessage.add("帳號欄必須輸入");
		}
		String password = request.getParameter("password");
		if (password == null || password.trim().length() == 0) {
			errorMessage.add("密碼欄必須輸入");
		}
		String name = request.getParameter("name");
		if (name == null || name.trim().length() == 0) {
			errorMessage.add("姓名欄必須輸入");
		}
		String address = request.getParameter("address");
		if (address == null || address.trim().length() == 0) {
			errorMessage.add("地址欄必須輸入");
		}
		String phone = request.getParameter("phone");
		String bday = request.getParameter("birthday");
		Date date = null;
		if (bday != null && bday.trim().length() > 0) {
			try {
				date = java.sql.Date.valueOf(bday);
			} catch (IllegalArgumentException e) {
				errorMessage.add("生日欄格式錯誤");
			}
		}

		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String weight = request.getParameter("weight");
		double dWeight = -1;
		if (weight != null && weight.trim().length() > 0) {
			try {
				dWeight = Double.parseDouble(weight.trim());
			} catch (NumberFormatException e) {
				errorMessage.add("體重欄必須為數值");
			}
		}
		if(!errorMessage.isEmpty()) {
			request.getRequestDispatcher("/ch04_01/InsertMemberError.jsp").forward(request, response);
			return;
		}
		try {
			MemberBean mb = new MemberBean(id, name, password, address, phone, date, ts, dWeight);
			MemberFileIO mfio = new MemberFileIO("C:\\data\\member.dat");
			mfio.insertMember(mb);
			request.setAttribute("bean", mb);
			request.getRequestDispatcher("/ch04_01/InsertMemberSuccess.jsp").forward(request, response);
			return;
		} catch (IOException e) {
			errorMessage.add("IO錯誤: "+e.getMessage());
			request.getRequestDispatcher("/ch04_01/InsertMemberError.jsp").forward(request, response);
			return;
		}
	}

}
