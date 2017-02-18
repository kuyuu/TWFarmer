package controller.jointpurchase;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.JointPurchaseBean;
import model.ProductBean;
import model.ProductPicBean;
import model.dao.ProductDAOjdbc;

@WebServlet("/JointPurchase/CheckJointPurchaseServlet")
public class CheckJointPurchaseServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String jpName = request.getParameter("jpName");
		String jpIntro = request.getParameter("jpIntro");
		String temp1 = request.getParameter("initDate");
		String temp2 = request.getParameter("endDate");
		String jpLocation = request.getParameter("jpLocation");
		String temp3 = request.getParameter("miscViaWay");
		String temp4 = request.getParameter("misc");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (jpName == null || jpName.length() == 0) {
			errors.put("jpName", "合購團名是必填欄位");
		}
		if (temp1 == null || temp1.length() == 0) {
			errors.put("initDate", "開始日期是必填欄位");
		}
		if (temp2 == null || temp2.length() == 0) {
			errors.put("endDate", "結束日期是必填欄位");
		}
		if (jpLocation == null || jpLocation.length() == 0) {
			errors.put("jpLocation", "合購地區是必填欄位");
		}
		if (temp3 == null || temp3.length() == 0) {
			errors.put("miscViaWay", "雜費收取方式是必填欄位");
		}
		java.util.Date initDate = null;
		if (temp1 != null && temp1.length() != 0) {
			try {
				initDate = sFormat.parse(temp1);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("initDate", "initDate必須是符合yyyy-Mm-dd格式的日期");
			}
		}
		java.util.Date endDate = null;
		if (temp2 != null && temp2.length() != 0) {
			try {
				endDate = sFormat.parse(temp2);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("endDate", "endDate必須是符合yyyy-Mm-dd格式的日期");
			}
		}

		int miscViaWay = 0;
		if (temp3 != null && temp3.length() != 0) {
			try {
				miscViaWay = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("miscViaWay", "miscViaWay必須是整數");
			}
		}

		int misc = 0;
		if (temp4 != null && temp4.length() != 0) {
			try {
				misc = Integer.parseInt(temp4);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("misc", "misc必須是整數");
			}
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("newJp.jsp").forward(request, response);
			return;
		}

		JointPurchaseBean jpBean = new JointPurchaseBean();
		
		jpBean.setJpName(jpName);
		if (jpIntro != null && jpIntro.length() != 0) {
			jpBean.setJpIntro(jpIntro);
		}
		jpBean.setInitDate(initDate);
		jpBean.setEndDate(endDate);
		jpBean.setJpLocation(jpLocation);
		jpBean.setJpStatusId(4101);
		jpBean.setMiscViaId(miscViaWay);
		jpBean.setMisc(misc);
		
		HttpSession session = request.getSession();
		session.setAttribute("jpBean", jpBean);
		request.getRequestDispatcher("selectJpProduct.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
