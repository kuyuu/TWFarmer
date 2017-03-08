package controller.violation;

import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.MsgBean;
import model.bean.ProductBean;
import model.bean.ViolationBean;
import model.daojdbc.MsgDAOJdbc;
import model.daojdbc.ProductDAOjdbc;
import model.daojdbc.ViolationDAOJdbc;

@Controller
@RequestMapping(path = { "/Violation/ProcessViolation.do" })
public class ProcessViolationController {
	@Autowired
	private ViolationDAOJdbc violationDAO;
	@Autowired
	private MsgDAOJdbc msgDAO;
	@Autowired
	private ProductDAOjdbc productDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(HttpSession session, Integer ticketId, Integer processWay, String ticketResult,
			String vioTitle, Integer reporterId, Integer reportedId) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		Date d = new Date();
		TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
		ViolationBean vBean = violationDAO.select(ticketId);
		vBean.setTicketResult(ticketResult);
		vBean.setProcessDate(d);
		vBean.setTicketStatue(1);
		violationDAO.update(vBean);

		MsgBean msgBean = new MsgBean();
		msgBean.setMsgReaderId(reporterId);
		msgBean.setMsgWriterId(mb.getMemberId());
		msgBean.setMsgTitle("檢舉處理結果：" + vioTitle);
		msgBean.setMsgContent(ticketResult);
		msgBean.setMsgTime(d);
		msgBean.setMsgStatus(0);
		msgBean.setWriterDelete(0);
		msgBean.setReaderDelete(0);
		msgDAO.insert(msgBean);

		if (processWay == 1) {
			ProductBean pBean = productDAO.select(reportedId);
			MsgBean msgBean2 = new MsgBean();
			msgBean2.setMsgReaderId(pBean.getSellerId());
			msgBean2.setMsgWriterId(mb.getMemberId());
			msgBean2.setMsgTitle("商品編號" + pBean.getProductId() + "商品，因違規已被封鎖");
			msgBean2.setMsgContent("親愛的使用者您好：<br><br>經管理員審核，您的" + pBean.getProductId() + "編號商品(" + pBean.getProductName()
					+ ")，因違反本網站使用規定，已將該商品封鎖。<br>有任呵問題，請再與我們聯絡，感謝您。<br><br>管理員敬上");
			msgBean2.setMsgTime(d);
			msgBean2.setMsgStatus(0);
			msgBean2.setWriterDelete(0);
			msgBean2.setReaderDelete(0);
			msgDAO.insert(msgBean2);
			pBean.setProductStatusName("封鎖");
			productDAO.update(pBean);
		}

		return "BackStage/ShowAllViolation.do";
	}

}
