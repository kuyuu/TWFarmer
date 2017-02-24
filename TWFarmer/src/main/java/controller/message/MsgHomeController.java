package controller.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.MsgBean;
import model.daojdbc.MsgDAOJdbc;

@Controller
@RequestMapping(path = { "/Message/MsgHome.do" })
public class MsgHomeController{
	@Autowired
	private MsgDAOJdbc msgDAO;
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWord(HttpSession session, Model model)
			throws ServletException, IOException {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		List<MsgBean> list = msgDAO.selectByReaderId(mb.getMemberId());
		model.addAttribute("msgList", list);
		
		List<MsgBean> list2 = msgDAO.selectByWriterId(mb.getMemberId());
		model.addAttribute("msgList2", list2);
		
		return "Message/msgHome";
	}

}
