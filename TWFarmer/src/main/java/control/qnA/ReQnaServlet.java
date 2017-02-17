package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.QnABean;
import model.dao.QnADAOJdbc;

@WebServlet(
		urlPatterns={"/BackStage/ReQnaServlet"})
public class ReQnaServlet extends HttpServlet {
	private QnADAOJdbc qnADAOJdbc = new QnADAOJdbc();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("qnAId");
		String reQnA = request.getParameter("ReQnA");
		System.out.println(temp1+reQnA);
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if (reQnA == null || reQnA.length() == 0){
			errors.put("QnAerror", "發問需輸入問題");
			request.getRequestDispatcher("/BackStage/farmerReQnA.jsp?qnAId=" + temp1).forward(request, response);
			return;
		}
		
		int qnAId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				qnAId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
			
		QnABean bean = qnADAOJdbc.select(qnAId);
		bean.setReQnA(reQnA);
		java.util.Date date = new java.util.Date();
		bean.setReDate(date);
		
		if(bean != null){
			QnABean result = qnADAOJdbc.update(bean);
			request.setAttribute("update", result);
			request.getRequestDispatcher("/BackStage/SelectQnaServlet").forward(request, response);
		}
	}
	
}
