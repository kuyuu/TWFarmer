package controller.qnA;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;
import model.ProductBean;
import model.QnABean;
import model.dao.ProductDAOjdbc;

@WebServlet(
		urlPatterns={"/BackStage/SelectAllQnaServlet"})
public class SelectAllQnaServlet extends HttpServlet {
	private ProductDAOjdbc productDAOjdbc = new ProductDAOjdbc();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		
		Map<ProductBean, List<QnABean>> result = productDAOjdbc.selectQna(mb.getMemberId());
		request.setAttribute("Qna", result);
		request.getRequestDispatcher("/BackStage/farmerQnA.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
