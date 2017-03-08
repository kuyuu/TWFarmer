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
import model.bean.MsgBean;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.MsgDAOJdbc;

@Controller
@RequestMapping(path = { "/Message/NewMessage.do" })
public class NewMessageController {
	@Autowired
	private MsgDAOJdbc msgDAO;
	@Autowired
	private MemberDAOJdbc memberDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWord(HttpSession session, String readerAccount, String msgTitle, String msgContent, Model model) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");

		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (readerAccount == null || readerAccount.trim().length() == 0) {
			errors.put("readerAccount", "請輸入收件人帳號");
		}
		if (msgTitle == null || msgTitle.trim().length() == 0) {
			errors.put("msgTitle", "請輸入信件主旨");
		}
		if (msgContent == null || msgContent.trim().length() == 0) {
			errors.put("msgContent", "請輸入內容");
		}

		if (memberDAO.selectByAccount(readerAccount) == null) {
			errors.put("readerAccount", "帳號不存在");
		}

		if (errors != null && !errors.isEmpty()) {
			return "Message/newMessage";
		}

		MsgBean msgBean = new MsgBean();
		msgBean.setMsgWriterId(mb.getMemberId());
		msgBean.setMsgReaderId(memberDAO.selectByAccount(readerAccount).getMemberId());
		msgBean.setMsgTitle(msgTitle);
		msgBean.setMsgContent(msgContent);
		Date date = new Date();
		TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
		msgBean.setMsgTime(date);
		msgBean.setMsgStatus(0);
		msgBean.setWriterDelete(0);
		msgBean.setReaderDelete(0);
		msgDAO.insert(msgBean);

		return "Message/MsgHome.do";

	}

}
