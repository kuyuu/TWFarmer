package controller.friend;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.FriendBean;
import model.bean.MemberBean;
import model.daojdbc.FriendDAOJdbc;

@Controller
@RequestMapping(path = { "/Friend/AddFriend.do" })
public class AddFriendController {
	@Autowired
	private FriendDAOJdbc friendDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(HttpSession session, Integer whiteId, Integer blackId) {
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
	}

}
