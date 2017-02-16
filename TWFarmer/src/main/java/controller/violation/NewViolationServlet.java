package controller.violation;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.ViolationBean;
import model.dao.ViolationDAOJdbc;

@WebServlet("/Violation/NewViolationServlet")
public class NewViolationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("productId");
		int productId = Integer.parseInt(temp);
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		String vioTitle = request.getParameter("vioTitle");
		String vioContent = request.getParameter("vioContent");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		if (vioTitle == null || vioTitle.trim().length() == 0) {
			errors.put("vioTitle", "主旨不可為空");
		}
		if (vioContent == null || vioContent.trim().length() == 0) {
			errors.put("vioContent", "內容不可為空");
		}
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("violationForm.jsp").forward(request, response);
			return;
		}

		ViolationDAOJdbc dao = new ViolationDAOJdbc();
		ViolationBean vb = new ViolationBean();
		vb.setReporterId(mb.getMemberId());
		vb.setReportedId(productId);
		vb.setVioTitle(vioTitle);
		vb.setVioContent(vioContent);
		vb.setTicketStatue(0);
		Date date = new Date();
		vb.setCreateDate(date);
		dao.insert(vb);
		session.removeAttribute("reportedId");
		
		request.getRequestDispatcher("success.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
