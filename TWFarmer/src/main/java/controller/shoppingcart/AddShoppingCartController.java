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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.daojdbc.ProductDAOjdbc;

@Controller
@RequestMapping(path = { "/shoppingCart/AddShoppingCart.do" })
public class AddShoppingCartController {
	@Autowired
	private ProductDAOjdbc productDAO;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(HttpSession session, Integer productId)
			throws ServletException, IOException {
		int sellerId = productDAO.select(productId).getSellerId();
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
	}

}
