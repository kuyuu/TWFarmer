package controller.qnA;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.QnABean;
import model.daojdbc.QnADAOJdbc;

@WebServlet(
		urlPatterns={"/BackStage/SelectQnaServlet"})
public class SelectQnAServlet extends HttpServlet{
	private QnADAOJdbc qnADAOJdbc = new QnADAOJdbc();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("qnAId");
		
		int qnAId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				qnAId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		QnABean result = qnADAOJdbc.select(qnAId);
		request.setAttribute("select", result);
		request.getRequestDispatcher("/BackStage/farmerReQnA.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	
}
