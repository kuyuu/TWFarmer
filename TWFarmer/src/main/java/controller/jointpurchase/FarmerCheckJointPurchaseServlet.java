package controller.jointpurchase;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.JPDetailBean;
import model.bean.JointPurchaseBean;
import model.bean.ProductBean;
import model.daojdbc.JPDetailDAOjdbc;
import model.daojdbc.JointPurchaseDAOjdbc;
import model.daojdbc.ProductDAOjdbc;
@WebServlet("/BackStage/FarmerCheckJointPurchaseServlet")
public class FarmerCheckJointPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("jointPurchaseId");
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		int jointPurchaseId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				jointPurchaseId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("jointPurchaseId", "Id必須是整數");
			}
		}
		
		JointPurchaseDAOjdbc dao = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = dao.select(jointPurchaseId);
		
		ProductDAOjdbc dao3 = new ProductDAOjdbc();
		Map<JPDetailBean, ProductBean> map = dao3.selectByJpId(jpBean.getJpId());
		request.setAttribute("jpBean", jpBean);
		request.setAttribute("map", map);
		
		request.getRequestDispatcher("farmerCheckJpDetail.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
