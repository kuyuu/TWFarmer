package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/QnAInsertServlet")
public class QnAInsertServlet extends HttpServlet {

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
		System.out.println(temp1+temp2+qnA);
		
		int memberId = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				memberId = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				//errors
				e.printStackTrace();
			}
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

	}

}
