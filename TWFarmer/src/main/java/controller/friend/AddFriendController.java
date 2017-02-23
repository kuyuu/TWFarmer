package controller.friend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping(path = { "/Friend/AddFriend.do" })
public class AddFriendController {
	@Autowired
	private FriendDAOJdbc friendDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer whiteId, Integer blackId) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		FriendBean bean = new FriendBean();

		if (whiteId != null) {
			bean = friendDAO.select(mb.getMemberId(), whiteId);
			if (bean != null) {
				bean.setFriendStatus(0);
				friendDAO.update(bean);
			} else {
				bean = new FriendBean();
				bean.setMemberId(mb.getMemberId());
				bean.setFriendId(whiteId);
				bean.setFriendStatus(0);
				friendDAO.insert(bean);
			}
		} else if (blackId != null) {
			bean = friendDAO.select(mb.getMemberId(), blackId);
			if (bean != null) {
				bean.setFriendStatus(1);
				friendDAO.update(bean);
			} else {
				bean = new FriendBean();
				bean.setMemberId(mb.getMemberId());
				bean.setFriendId(blackId);
				bean.setFriendStatus(1);
				friendDAO.insert(bean);
			}
		}
		return null;
	}

}
