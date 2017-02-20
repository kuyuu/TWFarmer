package controller.jointpurchase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FarmerBean;
import model.ProductBean;
import model.ProductPicBean;
import model.dao.FarmerDAOJdbc;
import model.dao.ProductDAOjdbc;
import model.dao.ProductPicDAOJdbc;

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

		HttpSession session = request.getSession();

		Map<ProductBean, List<ProductPicBean>> farmerProductMap = dao.selectBySellerIdWithPic(fBean.getMemberId());
		List<ProductBean> list = new ArrayList<ProductBean>();
		for (ProductBean key : farmerProductMap.keySet()) {
			list.add(key);
		}
		Map<Integer, Set<Integer>> cart = (Map<Integer, Set<Integer>>) session.getAttribute("cart");

		if (cart != null && cart.get(fBean.getMemberId()) != null) {
			ProductPicDAOJdbc dao1 = new ProductPicDAOJdbc();
			Map<ProductBean, List<ProductPicBean>> cartProductMap = new HashMap<ProductBean, List<ProductPicBean>>();
			for (int x : cart.get(fBean.getMemberId())) {
				ProductBean pBean = dao.select(x);
				cartProductMap.put(pBean, dao1.selectByProductId(x));
				for (ProductBean key2 : list) {
					if (key2.equals(pBean)) {
						farmerProductMap.remove(key2);
					}
				}
			}
			request.setAttribute("cartProductMap", cartProductMap);
		}
		request.setAttribute("productId", productId);
		request.setAttribute("farmerProductMap", farmerProductMap);
		request.getRequestDispatcher("selectJpProduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
