package controller.shoppingcart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = { "/shoppingCart/ClearShoppingCart.do" })
public class ClearShoppingCartController {

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void doWork(HttpSession session) {
		session.removeAttribute("cartMap");
		session.removeAttribute("cart");
	}
}
