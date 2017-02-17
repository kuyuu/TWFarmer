package controller.shoppingcart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.ProductBean;
import model.dao.MemberDAOJdbc;
import model.dao.ProductDAOjdbc;

@WebServlet("/shoppingCart/ShowShoppingCartServlet")
public class ShowShoppingCartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<Integer, Set<Integer>> cart = (Map<Integer, Set<Integer>>) session.getAttribute("cart");

		if (cart != null) {
			Map<MemberBean, List<ProductBean>> cartMap = new HashMap<MemberBean, List<ProductBean>>();
			MemberDAOJdbc mdao = new MemberDAOJdbc();
			ProductDAOjdbc pdao = new ProductDAOjdbc();
			for (Map.Entry entry : cart.entrySet()) {
				MemberBean mb = mdao.select((Integer) entry.getKey());
				List<ProductBean> list = new ArrayList<ProductBean>();
				Set<Integer> set = (Set) entry.getValue();
				Iterator it = set.iterator();
				while (it.hasNext()) {
					list.add(pdao.select((Integer) it.next()));
				}
				cartMap.put(mb, list);
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
