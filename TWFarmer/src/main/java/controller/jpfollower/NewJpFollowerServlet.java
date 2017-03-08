package controller.jpfollower;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.JPDetailBean;
import model.bean.JPFollowerBean;
import model.bean.JPFollowerDetailBean;
import model.bean.JointPurchaseBean;
import model.bean.MemberBean;
import model.dao.JPFollowerDetailDAO;
import model.daojdbc.F2FDetailDAOjdbc;
import model.daojdbc.JPDetailDAOjdbc;
import model.daojdbc.JPFollowerDAOJdbc;
import model.daojdbc.JPFollowerDetailDAOJdbc;
import model.daojdbc.JointPurchaseDAOjdbc;
import model.daojdbc.MemberDAOJdbc;

@WebServlet("/JointPurchase/NewJpFollowerServlet")
public class NewJpFollowerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
		String temp2 = request.getParameter("jpId");
		String temp3 = request.getParameter("f2fId");
//		String notes = request.getParameter("notes");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int jpId = 0;
		if (temp2 != null && temp2.trim().length() != 0) {
			try {
				jpId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		JointPurchaseDAOjdbc dao2 = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = dao2.select(jpId);
		request.setAttribute("jpBean", jpBean);
		JPDetailDAOjdbc dao3 = new JPDetailDAOjdbc();
		List<JPDetailBean> list = dao3.selectByJpId(jpId);
		F2FDetailDAOjdbc dao4 = new F2FDetailDAOjdbc();

		int f2fId = 0;
		if (temp3 != null && temp3.trim().length() != 0) {
			try {
				f2fId = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		String[] templist = request.getParameterValues("jpCount");
		boolean x = true;
		for (String a : templist) {
			if (!"0".equals(a)) {
				x = false;
			}
		}
		if (x) {
			errors.put("jpCount", "需至少購買一項商品");
		}

		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("newJpFollower.jsp").forward(request, response);
			return;
		}
		int totalPrice = 0;
		for (int i = 0; i < list.size(); i++) {
			int a = Integer.parseInt(templist[i]);
			totalPrice = list.get(i).getJpPrice() * a + list.get(i).getJpFreight() * a+ totalPrice;
		}

		try {
			JPFollowerDAOJdbc dao5 = new JPFollowerDAOJdbc();
			JPFollowerBean bean = new JPFollowerBean();
			bean.setMemberId(mb.getMemberId());
			bean.setF2FId(f2fId);
			bean.setJPId(jpId);
//			bean.setNotes(notes);
			bean.setTotalPrice(totalPrice);
			bean.setRemittanceStatus(0);
			bean.setMisc(0);
			if (jpBean.getMiscViaId() == 4202) {
				bean.setMisc(jpBean.getMisc());
			} 
			bean = dao5.insert(bean);
			request.setAttribute("jpFollowerBean", bean);
			request.setAttribute("f2f", dao4.select(bean.getF2FId()));

			JPFollowerDetailDAO dao6 = new JPFollowerDetailDAOJdbc();
			JPFollowerDetailBean bean2 = new JPFollowerDetailBean();

			for (int i = 0; i < list.size(); i++) {
				bean2.setProductId(list.get(i).getProductId());
				bean2.setJPFollowerId(bean.getJPFollowerId());
				bean2.setPrice(list.get(i).getJpPrice());
				bean2.setFreight(list.get(i).getJpFreight());
				int a = Integer.parseInt(templist[i]);
				bean2.setQuantity(a);
				dao6.insert(bean2);
			}

			List<JPFollowerDetailBean> list3 = dao6.selectByJPFollowerId(bean.getJPFollowerId());
			request.setAttribute("jpFollowerDetailList", list3);

			request.getRequestDispatcher("jpFollowerSuccess.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
