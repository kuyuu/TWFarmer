package controller.jpfollower;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.JPFollowerBean;
import model.daojdbc.JPFollowerDAOJdbc;

@WebServlet("/BackStage/RemittanceServlet")
public class RemittanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String temp = request.getParameter("jpFollowerId");
		int jpFollowerId = Integer.parseInt(temp);
		String remittanceBank = request.getParameter("remittanceBank");
		String remittanceAcc = request.getParameter("remittanceAcc");
		String temp3 = request.getParameter("remittance");
		String temp4 = request.getParameter("remittanceDate");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (remittanceBank == null || remittanceBank.trim().length() == 0) {
			errors.put("remittanceBank", "請輸入匯款銀行");
		}
		if (remittanceAcc == null || remittanceAcc.trim().length() == 0) {
			errors.put("remittanceAcc", "請輸入匯款帳號後5碼");
		}
		if (temp3 == null || temp3.trim().length() == 0) {
			errors.put("remittance", "請輸入匯款金額");
		}
		if (temp4 == null || temp4.trim().length() == 0) {
			errors.put("remittanceDate", "請輸入匯款時間");
		}

		int remittance = 0;
		if (temp3 != null && temp3.trim().length() != 0) {
			try {
				remittance = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				errors.put("remittance", "請輸入整數");
			}
		}
//		Date remittanceDate = null;
//		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//			remittanceDate = sdf.parse(temp4);
//		} catch (Exception e) {
//			e.printStackTrace();
//			errors.put("remittanceDate", "格式必須為yyyy-MM-dd HH:mm");
//		}
		
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Date remittanceDate = null;
		try {
//			System.out.println(f2fTime[i]);
			remittanceDate = sdFormat.parse(temp4);

		} catch (ParseException e) {
			System.out.println("時間轉換ERROR");
		}
		
		JPFollowerDAOJdbc dao = new JPFollowerDAOJdbc();
		JPFollowerBean jpfBean = dao.select(jpFollowerId);
		jpfBean.setRemittanceBank(remittanceBank);
		jpfBean.setRemittanceAcc(remittanceAcc);
		jpfBean.setRemittance(remittance);
		jpfBean.setRemittanceDate(remittanceDate);
		jpfBean.setRemittanceStatus(1);
		dao.update(jpfBean);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
