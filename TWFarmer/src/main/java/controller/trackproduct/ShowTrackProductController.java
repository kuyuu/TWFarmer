package controller.trackproduct;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.MemberBean;
import model.bean.TrackProductBean;
import model.daojdbc.TrackProductDAOJdbc;

@Controller
@RequestMapping(path={"/BackStage/ShowTrackProduct.do"})
public class ShowTrackProductController {
	@Autowired
	private TrackProductDAOJdbc trackProductDAO;
	
	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String doWork(HttpSession session, Model model){
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
		
		List<TrackProductBean> list = trackProductDAO.selectByMemberId(mb.getMemberId());
		model.addAttribute("trackProductList", list);
		
		return "BackStage/showTrackProduct";
	}

}
