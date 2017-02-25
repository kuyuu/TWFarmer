package controller.violation;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.ViolationBean;
import model.daojdbc.ViolationDAOJdbc;

@Controller
@RequestMapping(path = { "/Violation/NewViolation.do" })
public class NewViolationController {
	@Autowired
	private ViolationDAOJdbc violationDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer productId, String vioTitle, String vioContent, Model model)
			throws ServletException, IOException {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		if (vioTitle == null || vioTitle.trim().length() == 0) {
			errors.put("vioTitle", "主旨不可為空");
		}
		if (vioContent == null || vioContent.trim().length() == 0) {
			errors.put("vioContent", "內容不可為空");
		}
		if (errors != null && !errors.isEmpty()) {
			return "Violation/violationForm";
		}

		ViolationBean vb = new ViolationBean();
		vb.setReporterId(mb.getMemberId());
		vb.setReportedId(productId);
		vb.setVioTitle(vioTitle);
		vb.setVioContent(vioContent);
		vb.setTicketStatue(0);
		Date date = new Date();
		vb.setCreateDate(date);
		violationDAO.insert(vb);
		session.removeAttribute("reportedId");

		return "Violation/success";
	}

}
