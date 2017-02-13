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

import model.FarmerBean;
import model.MemberBean;
import model.dao.FarmerDAOJdbc;
import model.dao.MemberDAOJdbc;

@WebServlet("/BackStage/AEFDetailServlet")
public class AEFDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//An inner shell that does a lot more maybe?
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("memberId");
		String value = request.getParameter("value");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		
		HttpSession session = request.getSession();
        //session.getAttribute("farmerBean", farmerBean);
        //session.getAttribute("memberBean", memberBean);
		
		String farmerId = "0";
		int memberId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				memberId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("memberId", "memberId必須是整數");
			}
		}
		
		MemberDAOJdbc dao = new MemberDAOJdbc();
		MemberBean bean = dao.select(memberId);
		FarmerDAOJdbc dao2 = new FarmerDAOJdbc();
		FarmerBean bean2 = dao2.selectByMemberId(memberId);
		if ("accept".equals(value)) {
			bean.setIdType(2);
			dao.update2(bean);
		} else if("reject".equals(value)) {
			bean.setIdType(1);
			dao.update2(bean);
			dao2.select(farmerId);
			dao2.delete(farmerId);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
