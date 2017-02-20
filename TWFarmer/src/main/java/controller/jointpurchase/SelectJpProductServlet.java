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
import javax.servlet.http.HttpSession;

import model.JPDetailBean;
import model.ProductBean;
import model.ProductPicBean;
import model.dao.ProductDAOjdbc;
import model.dao.ProductPicDAOJdbc;

@WebServlet("/JointPurchase/SelectJpProductServlet")
public class SelectJpProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String temp = request.getParameter("sellerId");
		int sellerId = Integer.parseInt(temp);
		ProductDAOjdbc dao = new ProductDAOjdbc();
		List<ProductBean> list = dao.selectBySellerId(sellerId);

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		String tempJpPrice = "jpPrice";
		String tempJpFreight = "jpFreight";
		String tempJpPopulationMin = "jpPopulationMin";
		String tempJpPopulationMax = "jpPopulationMax";
		String tempJpUnit = "jpUnit";
		String tempJpPrice2;
		String tempJpFreight2;
		String tempJpPopulationMin2;
		String tempJpPopulationMax2;
		String jpUnit;
		Map<JPDetailBean, Map<ProductBean, List<ProductPicBean>>> map = new HashMap<JPDetailBean, Map<ProductBean, List<ProductPicBean>>>();
		List<ProductPicBean> list2 = new ArrayList<ProductPicBean>();
		ProductPicDAOJdbc dao2 = new ProductPicDAOJdbc();

		for (ProductBean pBean : list) {
			JPDetailBean jpdBean = new JPDetailBean();
			int productId = pBean.getProductId();
			tempJpPrice = tempJpPrice + productId;
			tempJpFreight = tempJpFreight + productId;
			tempJpPopulationMin = tempJpPopulationMin + productId;
			tempJpPopulationMax = tempJpPopulationMax + productId;
			tempJpUnit = tempJpUnit + productId;

			tempJpPrice2 = request.getParameter(tempJpPrice);
			tempJpFreight2 = request.getParameter(tempJpFreight);
			tempJpPopulationMin2 = request.getParameter(tempJpPopulationMin);
			tempJpPopulationMax2 = request.getParameter(tempJpPopulationMax);
			jpUnit = request.getParameter(tempJpUnit);

			int jpPrice = 0;
			if (tempJpPrice2 != null && tempJpPrice2.trim().length() != 0) {
				try {
					jpPrice = Integer.parseInt(tempJpPrice2);
				} catch (NumberFormatException e) {
					errors.put(tempJpPrice, "請輸入整數");
					e.printStackTrace();
				}
			}
			int jpFreight = 0;
			if (tempJpFreight2 != null && tempJpFreight2.trim().length() != 0) {
				try {
					jpFreight = Integer.parseInt(tempJpFreight2);
				} catch (NumberFormatException e) {
					errors.put(tempJpFreight, "請輸入整數");
					e.printStackTrace();
				}
			}
			int jpPopulationMin = 0;
			if (tempJpPopulationMin2 != null && tempJpPopulationMin2.trim().length() != 0) {
				try {
					jpPopulationMin = Integer.parseInt(tempJpPopulationMin2);
				} catch (NumberFormatException e) {
					errors.put(tempJpPopulationMin, "請輸入整數");
					e.printStackTrace();
				}
			}
			int jpPopulationMax = 0;
			if (tempJpPopulationMax2 != null && tempJpPopulationMax2.trim().length() != 0) {
				try {
					jpPopulationMax = Integer.parseInt(tempJpPopulationMax2);
				} catch (NumberFormatException e) {
					errors.put(tempJpPopulationMax, "請輸入整數");
					e.printStackTrace();
				}
			}

			if (jpPopulationMin > jpPopulationMax) {
				errors.put(tempJpPopulationMin, "最大購買量須大於最小購買量");
			}

			if (jpPopulationMin > 0 && jpPopulationMax > 0) {
				Map<ProductBean, List<ProductPicBean>> map2 = new HashMap<ProductBean, List<ProductPicBean>>();
				list2 = dao2.selectByProductId(productId);
				map2.put(pBean, list2);
				jpdBean.setProductId(productId);
				jpdBean.setJpPrice(jpPrice);
				jpdBean.setJpFreight(jpFreight);
				jpdBean.setJpPopulationMax(jpPopulationMax);
				jpdBean.setJpPopulationMin(jpPopulationMin);
				jpdBean.setJpUnit(jpUnit);
				map.put(jpdBean, map2);
			}

			tempJpPrice = "jpPrice";
			tempJpFreight = "jpFreight";
			tempJpPopulationMin = "jpPopulationMin";
			tempJpPopulationMax = "jpPopulationMax";
			tempJpUnit = "jpUnit";
		}

		if (!errors.isEmpty()) {
			for (Object key : errors.keySet()) {
				System.out.println(key + " : " + errors.get(key));
			}
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute("jpdBeanMap", map);
		request.getRequestDispatcher("newJp.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
