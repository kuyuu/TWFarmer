package controller.jointpurchase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JPDetailBean;
import model.JPFollowerBean;
import model.JPFollowerDetailBean;
import model.JointPurchaseBean;
import model.MemberBean;
import model.dao.JPDetailDAOjdbc;
import model.dao.JPFollowerDAOJdbc;
import model.dao.JPFollowerDetailDAOJdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;

@WebServlet("/BackStage/MemberCheckJpDetailServlet")
public class MemberCheckJpDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("jpId");
		int jpId = Integer.parseInt(temp);

		JPDetailDAOjdbc dao = new JPDetailDAOjdbc();
		List<JPDetailBean> list = dao.selectByJpId(jpId);
		request.setAttribute("list", list);

		JPFollowerDAOJdbc dao2 = new JPFollowerDAOJdbc();
		List<JPFollowerBean> list2 = dao2.selectByJpId(jpId);

		JPFollowerDetailDAOJdbc dao3 = new JPFollowerDetailDAOJdbc();
		Map<MemberBean, List<Integer>> map = new HashMap<MemberBean, List<Integer>>();
		MemberDAOJdbc dao4 = new MemberDAOJdbc();

		List<Integer> list4 = new ArrayList<>();
		int i = 0;
		for(int k = 0; k < list.size(); k++){
			list4.add(0);
		}

		for (JPFollowerBean bbb : list2) {
			MemberBean mb = dao4.select(bbb.getMemberId());
			List<Integer> list3 = new ArrayList<Integer>();
			for (JPDetailBean aaa : list) {
				int productId = aaa.getProductId();
				int jpFollowerId = bbb.getJPFollowerId();
				JPFollowerDetailBean bean = dao3.select(jpFollowerId, productId);
				if (bean != null) {
					list3.add(bean.getQuantity());
					int count = list4.get(i);
					count = count + bean.getQuantity();
					list4.remove(i);
					list4.add(i, count);
				} else {
					list3.add(0);
				}
				i++;
			}
			map.put(mb, list3);
			i = 0;
		}

		request.setAttribute("map", map);
		request.setAttribute("list4", list4);

		JointPurchaseDAOjdbc dao5 = new JointPurchaseDAOjdbc();
		JointPurchaseBean bean = dao5.select(jpId);
		request.setAttribute("jpBean", bean);

		request.getRequestDispatcher("memberCheckJpDetail.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
