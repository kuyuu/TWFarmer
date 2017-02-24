package controller.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.FriendBean;
import model.bean.MsgBean;
import model.daojdbc.FriendDAOJdbc;
import model.daojdbc.MsgDAOJdbc;

@Controller
@RequestMapping(path = { "/Message/ReadMessage.do" })
public class ReadMessageController {
	@Autowired
	private MsgDAOJdbc msgDAO;
	@Autowired
	private FriendDAOJdbc friendDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doGet(Integer msgId, String value, Model model) {

		MsgBean bean = msgDAO.select(msgId);
		bean.setMsgStatus(1);
		bean = msgDAO.update(bean);
		model.addAttribute("msgBean", bean);
		FriendBean fBean = new FriendBean();

		if ("reader".equals(value)) {
			model.addAttribute("value", "reader");
			fBean = friendDAO.select(bean.getMsgReaderId(), bean.getMsgWriterId());
			if (fBean != null && fBean.getFriendStatus() == 0) {
				model.addAttribute("friend", true);
			}
		} else {
			model.addAttribute("value", "writer");
			fBean = friendDAO.select(bean.getMsgWriterId(), bean.getMsgReaderId());
			if (fBean != null && fBean.getFriendStatus() == 0) {
				model.addAttribute("friend", true);
			}
		}

		return "Message/readMessage";
	}

}
