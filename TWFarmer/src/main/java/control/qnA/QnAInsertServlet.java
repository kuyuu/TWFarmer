package control.qnA;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QnABean;
import model.dao.QnADAOJdbc;

@WebServlet("/QnAInsertServlet")
public class QnAInsertServlet extends HttpServlet {
	private QnADAOJdbc qnADAOJdbc = new QnADAOJdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收資料
		String temp1 = request.getParameter("memberId");
		String temp2 = request.getParameter("productId");
		String qnA = request.getParameter("QnA");
		
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if (qnA == null || qnA.length() == 0){
			errors.put("QnAerror", "發問需輸入問題");
			request.getRequestDispatcher("ProductServlet?productId="+ temp2 ).forward(request, response);
			return;
		}
		
		int memberId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				memberId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				//errors
				e.printStackTrace();
			}
		} else {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
		int productId =0 ;
		if (temp2 != null && temp2.length() != 0) {
			try {
				productId = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		QnABean bean = new QnABean();
		bean.setQueryId(memberId);
		bean.setProductId(productId);
		bean.setQnAContent(qnA);
		java.util.Date date = new java.util.Date();
		bean.setQueryDate(date);;

		if(bean != null){
			QnABean result = qnADAOJdbc.insert(bean);
			request.setAttribute("insert", result);
			request.getRequestDispatcher("ProductServlet?productId="+ temp2 ).forward(request, response);
		}
	}

}
