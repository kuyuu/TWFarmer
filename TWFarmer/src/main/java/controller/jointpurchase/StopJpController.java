package controller.jointpurchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.JointPurchaseBean;
import model.daojdbc.JointPurchaseDAOjdbc;

@Controller
@RequestMapping(path = { "/BackStage/StopJp.do" })
public class StopJpController {
	@Autowired
	private JointPurchaseDAOjdbc jpDAO;

	@RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
	public void doWork(Integer jpId) {
		JointPurchaseBean jpBean = jpDAO.select(jpId);
		jpBean.setJpStatusId(4104);
		jpDAO.update(jpBean);
	}

}
