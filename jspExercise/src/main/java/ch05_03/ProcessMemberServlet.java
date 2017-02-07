package ch05_03;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch05_03/member.do")
public class ProcessMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);
		String memberId = request.getParameter("memberId");
		if (memberId == null || memberId.trim().length() == 0) {
			errorMessage.put("memberId", "帳號欄必須輸入");
		}
		String password = request.getParameter("password");
		if (password == null || password.trim().length() == 0) {
			errorMessage.put("password", "密碼欄必須輸入");
		}
		String name = request.getParameter("name");
		if (name == null || name.trim().length() == 0) {
			errorMessage.put("name", "姓名欄必須輸入");
		}
		String address = request.getParameter("address");
		if (address == null || address.trim().length() == 0) {
			errorMessage.put("address", "地址欄必須輸入");
		}
		String phone = request.getParameter("phone");
		String bday = request.getParameter("birthday");
		Date date = null;
		if (bday != null && bday.trim().length() > 0) {
			try {
				date = java.sql.Date.valueOf(bday);
			} catch (IllegalArgumentException e) {
				errorMessage.put("birthday", "生日欄格式錯誤");
			}
		}

		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String weight = request.getParameter("weight");
		double dWeight = -1;
		if (weight != null && weight.trim().length() > 0) {
			try {
				dWeight = Double.parseDouble(weight.trim());
			} catch (NumberFormatException e) {
				errorMessage.put("weight", "體重欄必須為數值");
			}
		}
		if (!errorMessage.isEmpty()) {
			request.getRequestDispatcher("/ch05_03/InsertMemberForm.jsp").forward(request, response);
			return;
		}
		try {
			MemberBean mb = new MemberBean(memberId, name, password, address, phone, date, ts, dWeight);
			MemberDAO mfio = new MemberDAO();
			mfio.insertMember(mb);
			request.setAttribute("bean", mb);
			request.getRequestDispatcher("/ch05_03/InsertMemberSuccess.jsp").forward(request, response);
			return;
		} catch (SQLException e) {
			if (e.getMessage().indexOf("重複的索引鍵") != -1 || e.getMessage().indexOf("Duplicate entry") != -1) {
				errorMessage.put("memberId", "帳號重複，請重新輸入帳號");
			} else {
				errorMessage.put("exception", "資料庫存取錯誤: " + e.getMessage());
			}
			request.getRequestDispatcher("/ch05_03/InsertMemberForm.jsp").forward(request, response);
			return;
		}
	}

}
