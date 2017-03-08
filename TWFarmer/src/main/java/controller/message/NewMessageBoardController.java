package controller.message;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.MsgBoardBean;
import model.daojdbc.MsgBoardDAOJdbc;

@Controller
@RequestMapping(path = { "/MessageBoard/NewMessage.do" })
public class NewMessageBoardController {
	@Autowired
	private MsgBoardDAOJdbc msgBoardDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(HttpSession session, Integer jpId, String content, Model model) {

//		System.out.println("start");
//		System.out.println(jpId + ":" + content);
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (errors != null && !errors.isEmpty()) {
			// return "";
		}

		MsgBoardBean bean = new MsgBoardBean();
		bean.setWriterID(mb.getMemberId());
		bean.setContent(content);
		bean.setJpId(jpId);
		Date date = new Date();
		TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
		bean.setMsgTime(date);
		msgBoardDAO.insert(bean);

		// return "JointPurchase.do?jpId=" + jpId;

	}
}
