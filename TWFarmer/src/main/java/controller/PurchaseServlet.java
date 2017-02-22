package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JPDetailBean;
import model.JointPurchaseBean;
import model.MemberBean;
import model.dao.JPDetailDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;
import model.dao.MemberDAOJdbc;

@WebServlet("/JointPurchase/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("jpId");
		int jpId = Integer.parseInt(temp);
		
		JointPurchaseDAOjdbc jpdao = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = jpdao.select(jpId);
		request.setAttribute("jpBean", jpBean);
		
		JPDetailDAOjdbc jpddao = new JPDetailDAOjdbc();
		List<JPDetailBean> jpdList = jpddao.selectByJpId(jpId);
		request.setAttribute("jpdList", jpdList);
		
		MemberDAOJdbc mdao = new MemberDAOJdbc();
		MemberBean mBean = mdao.select(jpBean.getInitId());
		request.setAttribute("mBean", mBean);
		
		request.getRequestDispatcher("JointPurchase.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
