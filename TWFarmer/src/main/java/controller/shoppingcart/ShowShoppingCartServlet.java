package controller.shoppingcart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.ProductBean;
import model.ProductPicBean;
import model.dao.MemberDAOJdbc;
import model.dao.ProductDAOjdbc;
import model.dao.ProductPicDAOJdbc;

@WebServlet("/shoppingCart/ShowShoppingCartServlet")
public class ShowShoppingCartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<Integer, Set<Integer>> cart = (Map<Integer, Set<Integer>>) session.getAttribute("cart");

		if (cart != null) {
			Map<MemberBean, Map<ProductBean, List<ProductPicBean>>> cartMap = new HashMap<MemberBean, Map<ProductBean, List<ProductPicBean>>>();
			MemberDAOJdbc mdao = new MemberDAOJdbc();
			ProductDAOjdbc pdao = new ProductDAOjdbc();
			ProductPicDAOJdbc ppdao = new ProductPicDAOJdbc();
			for (Map.Entry entry : cart.entrySet()) {
				MemberBean mb = mdao.select((Integer) entry.getKey());
				Map<ProductBean, List<ProductPicBean>> map = new HashMap<ProductBean, List<ProductPicBean>>();
				Set<Integer> set = (Set) entry.getValue();
				Iterator it = set.iterator();
				List<ProductPicBean> list = new ArrayList<ProductPicBean>();
				while (it.hasNext()) {
					int productId = (Integer) it.next();
					list = ppdao.selectByProductId(productId);
					map.put(pdao.select(productId), list);
				}
				cartMap.put(mb, map);
			}
			request.setAttribute("cartMap", cartMap);
		}

		request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
