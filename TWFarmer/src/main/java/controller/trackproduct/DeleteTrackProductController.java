package controller.trackproduct;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.daojdbc.TrackProductDAOJdbc;

@Controller
@RequestMapping(path = { "/BackStage/DeleteTrackProduct.do" })
public class DeleteTrackProductController {
	@Autowired
	private TrackProductDAOJdbc trackProductDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(HttpSession session, Integer productId) {
//		System.out.println("111");
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		trackProductDAO.delete(mb.getMemberId(), productId);

	}

}
