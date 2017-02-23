package controller.friend;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.MemberBean;
import model.dao.FriendDAOJdbc;

@Controller
@RequestMapping(path = { "/Friend/DeleteFriend.do" })
public class DeleteFriendController extends HttpServlet {
	@Autowired
	private FriendDAOJdbc friendDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer friendId, Model model) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		friendDAO.delete(mb.getMemberId(), friendId);
		
		return null;
	}

}
