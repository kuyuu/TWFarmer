package controller.jpfollower;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.F2FDetailBean;
import model.bean.JPDetailBean;
import model.bean.JointPurchaseBean;
import model.daojdbc.F2FDetailDAOjdbc;
import model.daojdbc.JPDetailDAOjdbc;
import model.daojdbc.JointPurchaseDAOjdbc;

@Controller
@RequestMapping(path = { "/JointPurchase/StarJpFollower.do" })
public class StarJpFollowerController {
	@Autowired
	private JointPurchaseDAOjdbc jpDAO;
	@Autowired
	private F2FDetailDAOjdbc f2fDAO;
	@Autowired
	private JPDetailDAOjdbc jpdDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(Integer jpId, Model model) {
		
		JointPurchaseBean jpBean = jpDAO.select(jpId);
		model.addAttribute("jpBean", jpBean);
		
		List<F2FDetailBean> f2fList = f2fDAO.selectByJpId(jpId);
		model.addAttribute("f2fList", f2fList);
		
		List<JPDetailBean> list = jpdDAO.selectByJpId(jpId);
		model.addAttribute("jpDetailList", list);

		return "JointPurchase/newJpFollower";
	}

}
