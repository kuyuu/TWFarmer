package controller.violation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.ViolationBean;
import model.daojdbc.ViolationDAOJdbc;

@Controller
@RequestMapping(path = { "/BackStage/ShowAllViolation.do" })
public class ShowAllViolationController {
	@Autowired
	private ViolationDAOJdbc violationDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(Model model) {

		List<ViolationBean> list = violationDAO.selectTreat(0);
		model.addAttribute("untreated", list);
		List<ViolationBean> list2 = violationDAO.selectTreat(1);
		model.addAttribute("treated", list2);

		return "BackStage/managerViolation";
	}

}
