package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.F2FDetailBean;
import model.JPFollowerBean;
import model.JPFollowerDetailBean;
import model.JPFollowerDetailDAO;
import model.JointPurchaseBean;
import model.dao.F2FDetailDAOjdbc;
import model.dao.JPFollowerDAOJdbc;
import model.dao.JPFollowerDetailDAOJdbc;
import model.dao.JointPurchaseDAOjdbc;
@WebServlet("/BackStage/CheckJpFollowerDetailServlet")
public class CheckJpFollowerDetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("jpFollowerId");
		int jpFollowerId = Integer.parseInt(temp);
		
		
		JPFollowerDAOJdbc dao = new JPFollowerDAOJdbc();
		JPFollowerBean jpfBean = dao.select(jpFollowerId);
		request.setAttribute("jpFollowerBean", jpfBean);
		
		JointPurchaseDAOjdbc dao4 = new JointPurchaseDAOjdbc();
		JointPurchaseBean jpBean = dao4.select(jpfBean.getJPId());
		request.setAttribute("jpBean", jpBean);
		
		F2FDetailDAOjdbc dao2 = new F2FDetailDAOjdbc();
		F2FDetailBean f2fBean = dao2.select(jpfBean.getF2FId());
		request.setAttribute("f2f", f2fBean);
		
		JPFollowerDetailDAO dao3 = new JPFollowerDetailDAOJdbc();
		List<JPFollowerDetailBean> list = dao3.selectByJPFollowerId(jpFollowerId);
		request.setAttribute("jpFollowerDetailList", list);
		
		request.getRequestDispatcher("memberCheckJpFollowerDetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
