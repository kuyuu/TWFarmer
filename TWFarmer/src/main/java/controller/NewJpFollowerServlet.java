package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.F2FDetailBean;
import model.JPDetailBean;
import model.JPFollowerBean;
import model.JPFollowerDetailBean;
import model.JPFollowerDetailDAO;
import model.JointPurchaseBean;
import model.MemberBean;
import model.dao.F2FDetailDAOjdbc;
import model.dao.JPDetailDAOjdbc;
import model.dao.JPFollowerDAOJdbc;
import model.dao.JPFollowerDetailDAOJdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;

@WebServlet("/JointPurchase/NewJpFollowerServlet")
public class NewJpFollowerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("memberId");
		String temp2 = request.getParameter("jpId");
		String temp3 = request.getParameter("f2fId");
		String notes = request.getParameter("notes");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int memberId = 0;
		if (temp != null && temp.trim().length() != 0) {
			try {
				memberId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		MemberDAOJdbc dao = new MemberDAOJdbc();
		MemberBean memberBean = dao.select(memberId);
		request.setAttribute("memberBean", memberBean);

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
		JPDetailDAOjdbc dao3 = new JPDetailDAOjdbc();
		List<JPDetailBean> list = dao3.selectByJpId(jpId);
		F2FDetailDAOjdbc dao4 = new F2FDetailDAOjdbc();
		List<F2FDetailBean> list2 = dao4.selectByJpId(jpId);
		request.setAttribute("jpBean", jpBean);
		request.setAttribute("jpDetailList", list);
		request.setAttribute("f2fList", list2);

		int f2fId = 0;
		if (temp3 != null && temp3.trim().length() != 0) {
			try {
				f2fId = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		String[] templist = request.getParameterValues("jpCount");
		for (String a : templist) {
			boolean x = true;
			if (!"0".equals(a)) {
				x = false;
			}
			if (x) {
				errors.put("jpCount", "需至少購買一項商品");
			}
		}
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("newJpFollower.jsp").forward(request, response);
			return;
		}
		int totalPrice = 0;
		for (int i = 0; i < list.size(); i++) {
			int a = Integer.parseInt(templist[i]);
			totalPrice = list.get(0).getJpPrice() * a + totalPrice;
		}

		JPFollowerDAOJdbc dao5 = new JPFollowerDAOJdbc();
		JPFollowerBean bean = new JPFollowerBean();
		bean.setMemberId(memberId);
		bean.setF2FId(f2fId);
		bean.setJPId(jpId);
		bean.setNotes(notes);
		bean.setTotalPrice(totalPrice);
		bean = dao5.insert(bean);
		
		JPFollowerDetailDAO dao6 = new JPFollowerDetailDAOJdbc();
		JPFollowerDetailBean bean2 = new JPFollowerDetailBean();

		for (int i = 0; i < list.size(); i++) {
			bean2.setProductId(list.get(i).getProductId());
			bean2.setJPFollowerId(bean.getJPFollowerId());
			bean2.setPrice(list.get(i).getJpPrice());
			int a = Integer.parseInt(templist[i]);
			bean2.setQuantity(a);
			dao6.insert(bean2);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
