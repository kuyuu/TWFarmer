package controller.message;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.MsgBean;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.MsgBoardDAOJdbc;

@Controller
@RequestMapping(path = { "/MessageBoard/NewMessage.do" })
public class NewMessageController {
	@Autowired
	private MsgBoardDAOJdbc msgDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWord() {
		return "";
	}

}
