package controller.friend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.FriendBean;
import model.MemberBean;
import model.dao.FriendDAOJdbc;

@Controller
@RequestMapping(path = { "/Friend/AddFriend.do" })
public class AddFriendController {

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer whiteId, Integer blackId) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		FriendDAOJdbc dao = new FriendDAOJdbc();
		FriendBean bean = new FriendBean();

		if (whiteId != null) {
			bean = dao.select(mb.getMemberId(), whiteId);
			if (bean != null) {
				bean.setFriendStatus(0);
				dao.update(bean);
			} else {
				bean = new FriendBean();
				bean.setMemberId(mb.getMemberId());
				bean.setFriendId(whiteId);
				bean.setFriendStatus(0);
				dao.insert(bean);
			}
		} else if (blackId != null) {
			bean = dao.select(mb.getMemberId(), blackId);
			if (bean != null) {
				bean.setFriendStatus(1);
				dao.update(bean);
			} else {
				bean = new FriendBean();
				bean.setMemberId(mb.getMemberId());
				bean.setFriendId(blackId);
				bean.setFriendStatus(1);
				dao.insert(bean);
			}
		}
		return null;
	}

}
