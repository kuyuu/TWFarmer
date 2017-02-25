package controller.trackproduct;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.TrackProductBean;
import model.dao.TrackProductDAO;

@Controller
@RequestMapping(path = { "TrackProduct/AddTrackProduct.do" })
public class AddTrackProductController {
	@Autowired
	private TrackProductDAO trackProductDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(HttpSession session, Integer productId) {
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		TrackProductBean tBean = new TrackProductBean();
		tBean.setProductId(productId);
		tBean.setMemberId(mb.getMemberId());
		tBean.setTrackDate(new Date());
		trackProductDAO.insert(tBean);
		
	}
}
