package controller.jpfollower;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.JointPurchaseBean;
import model.daojdbc.JointPurchaseDAOjdbc;

@WebServlet("/BackStage/FarmerCheckJPDetailServlet")
public class FarmerCheckJPDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String temp = request.getParameter("jpId");
		String value = request.getParameter("value");

		int jpId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				jpId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		JointPurchaseDAOjdbc dao = new JointPurchaseDAOjdbc();
		JointPurchaseBean bean = dao.select(jpId);
		if ("accept".equals(value)) {
			bean.setJpStatusId(4102);
			dao.update(bean);
		} else if ("reject".equals(value)) {
			bean.setJpStatusId(4105);
			dao.update(bean);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
