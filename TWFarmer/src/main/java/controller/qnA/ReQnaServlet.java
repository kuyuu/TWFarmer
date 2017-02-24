package controller.qnA;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.QnABean;
import model.daojdbc.QnADAOJdbc;

@WebServlet(urlPatterns = { "/BackStage/ReQnaServlet" })
public class ReQnaServlet extends HttpServlet {
	private QnADAOJdbc qnADAOJdbc = new QnADAOJdbc();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPut(request, response);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp1 = request.getParameter("qnAId");
		String reQnA = request.getParameter("ReQnA");
		String button = request.getParameter("button");

		int qnAId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				qnAId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		if ("delete".equals(button)){
			boolean result = qnADAOJdbc.delete(qnAId);
			if(!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
			}
			request.getRequestDispatcher("/BackStage/SelectAllQnaServlet").forward(request, response);
			return;
		}
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		if (reQnA == null || reQnA.length() == 0) {
			errors.put("QnAerror", "回覆不可為空白");
			request.getRequestDispatcher("/BackStage/SelectQnaServlet").forward(request, response);
			return;
		}

		QnABean bean = qnADAOJdbc.select(qnAId);
		bean.setReQnA(reQnA);
		java.util.Date date = new java.util.Date();
		bean.setReDate(date);

		if("submit".equals(button)){
			QnABean result = qnADAOJdbc.update(bean);
			request.setAttribute("update", result);
			request.getRequestDispatcher("/BackStage/SelectAllQnaServlet").forward(request, response);
		}
	}
}
