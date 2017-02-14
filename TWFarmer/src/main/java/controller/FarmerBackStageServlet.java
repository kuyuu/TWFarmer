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

import model.JPFollowerBean;
import model.JointPurchaseBean;
import model.ProductBean;
import model.dao.JPFollowerDAOJdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.ProductDAOjdbc;

@WebServlet("/BackStage/FarmerBackStageServlet")
public class FarmerBackStageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("memberId");
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int memberId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				memberId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("memberId", "Id必須是整數");
			}
		}
		
		ProductDAOjdbc dao1 = new ProductDAOjdbc();
		List<ProductBean> list1 = dao1.selectBySellerId(memberId);
		
		JointPurchaseDAOjdbc dao2 = new JointPurchaseDAOjdbc();
		List<JointPurchaseBean> list2 = dao2.selectJpIdBySellerId(memberId);
		List<JointPurchaseBean> list3 = dao2.selectByInitId(memberId);
		
		JPFollowerDAOJdbc dao3 = new JPFollowerDAOJdbc();
		List<JPFollowerBean> list4 = dao3.selectByBuyerId(memberId);
		
		request.setAttribute("productList", list1);
		request.setAttribute("jpList", list2);
		request.setAttribute("initJpList", list3);
		request.setAttribute("jpFollowerList", list4);
//		request.getRequestDispatcher("/BackStage/farmerCheckJP.jsp").forward(request, response);
//		request.getRequestDispatcher("/BackStage/farmerManageProduct.jsp").forward(request, response);
//		request.getRequestDispatcher("/BackStage/memberCheckJp.jsp").forward(request, response);
		request.getRequestDispatcher("/BackStage/memberCheckJpFollower.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
