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

import model.bean.JPDetailBean;
import model.bean.JPFollowerBean;
import model.bean.JPFollowerDetailBean;
import model.bean.JointPurchaseBean;
import model.bean.MemberBean;
import model.daojdbc.JPDetailDAOjdbc;
import model.daojdbc.JPFollowerDAOJdbc;
import model.daojdbc.JPFollowerDetailDAOJdbc;
import model.daojdbc.JointPurchaseDAOjdbc;
import model.daojdbc.MemberDAOJdbc;
import model.daojdbc.ProductDAOjdbc;

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

		request.setAttribute("list2", list2);

		JPFollowerDetailDAOJdbc dao3 = new JPFollowerDetailDAOJdbc();
		Map<MemberBean, List<Integer>> map = new HashMap<MemberBean, List<Integer>>();
		MemberDAOJdbc dao4 = new MemberDAOJdbc();

		List<Integer> list4 = new ArrayList<>();
		int i = 0;
		for (int k = 0; k < list.size(); k++) {
			list4.add(0);
		}
		
		for (JPFollowerBean bbb : list2) {
			MemberBean mb = dao4.select(bbb.getMemberId());
			List<Integer> list3 = new ArrayList<Integer>();
			for (JPDetailBean aaa : list) {
				int productId = 0;
				productId = aaa.getProductId();
//				System.out.println(productId);
//				if (productId != 0) {
//					System.out.println(productId);
//					productId2 = productId;
//				}
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
		
		ProductDAOjdbc pDAO = new ProductDAOjdbc();
		MemberBean memberBean = dao4.select(pDAO.select(list.get(0).getProductId()).getSellerId());
		request.setAttribute("memberBean", memberBean);

		request.getRequestDispatcher("memberCheckJpDetail.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
