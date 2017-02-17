package controller.jointpurchase;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FarmerBean;
import model.ProductBean;
import model.ProductPicBean;
import model.dao.FarmerDAOJdbc;
import model.dao.ProductDAOjdbc;

@WebServlet(urlPatterns = "/JointPurchase/NewJointPurchaseServlet")
public class NewJointPurchaseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp2 = request.getParameter("productId");

		int productId = 0;
		if (temp2 != null && temp2.length() != 0) {
			try {
				productId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		ProductDAOjdbc dao = new ProductDAOjdbc();
		FarmerDAOJdbc dao2 = new FarmerDAOJdbc();
		FarmerBean fBean = dao2.selectByMemberId(dao.select(productId).getSellerId());
		request.setAttribute("fBean", fBean);

		Map<ProductBean, List<ProductPicBean>> map = dao.selectBySellerIdWithPic(fBean.getMemberId());
		request.setAttribute("productMap", map);
		request.getRequestDispatcher("selectJpProduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
