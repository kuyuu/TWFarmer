package controller.jpfollower;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JPFollowerBean;
import model.dao.JPFollowerDAOJdbc;

@WebServlet("/BackStage/ToRemittanceFormServlet")
public class ToFormRemittanceServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("jpFollowerId");
		int jpFollowerId = Integer.parseInt(temp);
		JPFollowerDAOJdbc dao = new JPFollowerDAOJdbc();
		JPFollowerBean jpfBean = dao.select(jpFollowerId);
		request.setAttribute("jpfBean", jpfBean);
		request.getRequestDispatcher("jpFollowerRemittanceForm.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
