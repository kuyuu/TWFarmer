package controller.shoppingcart;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.daojdbc.ProductDAOjdbc;

@WebServlet("/shoppingCart/AddShoppingCartServlet")
public class AddShoppingCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("productId");
		int productId = Integer.parseInt(temp);
		ProductDAOjdbc dao = new ProductDAOjdbc();
		int sellerId = dao.select(productId).getSellerId();
		HttpSession session = request.getSession();
		Map<Integer, Set<Integer>> cart = (Map<Integer, Set<Integer>>) session.getAttribute("cart");

		Map<Integer, Set<Integer>> map = null;
		Set<Integer> set = null;

		if (cart == null) {
			map = new HashMap<Integer, Set<Integer>>();
			set = new HashSet<Integer>();
		} else {
			map = cart;
			if (map.get(sellerId) == null) {
				set = new HashSet<Integer>();
			} else {
				set = map.get(sellerId);
			}
		}

		set.add(productId);
		map.put(sellerId, set);

		session.setAttribute("cart", map);
//		for (Map.Entry entry : map.entrySet()) {
//			System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
