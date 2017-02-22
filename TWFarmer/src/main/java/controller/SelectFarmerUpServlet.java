package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FarmerBean;
import model.MemberBean;
import model.dao.MemberDAOJdbc;

@WebServlet(urlPatterns="/BackStage/SelectFarmerUpServlet")
public class SelectFarmerUpServlet extends HttpServlet {
	private MemberDAOJdbc memberDAOJdbc = new MemberDAOJdbc();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<MemberBean, FarmerBean> result = memberDAOJdbc.selectByType(4);
		request.setAttribute("select", result);
		request.getRequestDispatcher("/BackStage/administratorCheckFarmer.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
