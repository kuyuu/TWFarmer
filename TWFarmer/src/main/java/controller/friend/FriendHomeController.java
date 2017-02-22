package controller.friend;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.FriendBean;
import model.MemberBean;
import model.dao.FriendDAOJdbc;

@Controller
@RequestMapping(path = { "/Friend/FriendHome.do" })
public class FriendHomeController {
	@Autowired
	private FriendDAOJdbc friendDAOJdbc;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Model model) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<FriendBean> list = friendDAOJdbc.selectWhiteByMemberId(mb.getMemberId());
		model.addAttribute("whiteList", list);

		List<FriendBean> list2 = friendDAOJdbc.selectBlackByMemberId(mb.getMemberId());
		model.addAttribute("blackList", list2);

		return "Friend/friendHome";
	}

}
