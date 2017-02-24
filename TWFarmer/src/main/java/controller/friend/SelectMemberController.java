package controller.friend;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.FriendBean;
import model.bean.MemberBean;
import model.daojdbc.FriendDAOJdbc;
import model.daojdbc.MemberDAOJdbc;

@Controller
@RequestMapping(path = { "/Friend/SelectMember.do" })
public class SelectMemberController {
	@Autowired
	private FriendDAOJdbc friendDAO;
	@Autowired
	private MemberDAOJdbc memberDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, String account, Model model) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if (account == null) {
			errors.put("account", "請輸入帳號");
		}
		MemberBean bean = memberDAO.selectByAccount(account);
		if (bean == null) {
			errors.put("account", "無此會員");
		}

		if (errors != null && !errors.isEmpty()) {
			return "Friend/FriendHome.do";
		}
		model.addAttribute("memberBean", bean);

		FriendBean fBean = friendDAO.select(mb.getMemberId(), bean.getMemberId());
		if (fBean != null) {
			model.addAttribute("friend", fBean.getFriendStatus());
		}

		return "Friend/showMember";
	}

}
