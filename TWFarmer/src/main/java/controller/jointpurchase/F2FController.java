package controller.jointpurchase;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.F2FDetailBean;
import model.daojdbc.F2FDetailDAOjdbc;

@Controller
@RequestMapping(path = { "/JointPurchase/F2F.do" })
public class F2FController {
	@Autowired
	private F2FDetailDAOjdbc f2fDetailDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String doWork(Integer jpId, String[] f2fTime, String[] f2fPlace) {

		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for (int i = 0; i < f2fTime.length; i++) {
			if (f2fTime[i] != null && f2fTime[i].trim().length() != 0 &&f2fPlace[i]!=null&&f2fPlace[i].trim().length()!=0) {
				F2FDetailBean f2fBean = new F2FDetailBean();
				f2fBean.setJpId(jpId);
				try {
//					System.out.println(f2fTime[i]);
					f2fBean.setF2fTime(sdFormat.parse(f2fTime[i]));

				} catch (ParseException e) {
					System.out.println("時間轉換ERROR");
				}
				f2fBean.setF2fPlace(f2fPlace[i]);
				f2fDetailDAO.insert(f2fBean);
			}
		}

		return "BackStage/MemberCheckJpServlet";

	}

}
