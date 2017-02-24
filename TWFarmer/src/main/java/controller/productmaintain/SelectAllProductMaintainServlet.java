package controller.productmaintain;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MemberBean;
import model.bean.ProductBean;
import model.daojdbc.ProductDAOjdbc;

@WebServlet("/BackStage/SelectAllProductMaintainServlet")
public class SelectAllProductMaintainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
		ProductDAOjdbc dao = new ProductDAOjdbc();
		List<ProductBean> list = dao.selectBySellerId(mb.getMemberId());
		request.setAttribute("productList", list);
		request.getRequestDispatcher("/BackStage/farmerManageProduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
