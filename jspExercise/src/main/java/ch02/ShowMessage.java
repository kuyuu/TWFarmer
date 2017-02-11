package ch02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch02/ShowMessage")
public class ShowMessage extends HttpServlet {
	boolean noCacheData = false;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		if(noCacheData) {
			resp.setHeader("Cache-Control", "no-Cache"); //HTTP1.1
			resp.setHeader("pragma", "no-Cache"); //HTTP1.1
			resp.setDateHeader("Expires", 0); //HTTP1.0
		}
		String browser="";
		String type = req.getHeader("user-agent").toUpperCase();
		if(type.indexOf("MSIE") >= 0) {
			browser = "MISE";
		} else if(type.indexOf("FIREFOX") >= 0) {
			browser ="FIREFOX";
		} else if(type.indexOf("CHROME") >= 0) {
			browser = "CHROME";
		} else {
			browser = "其他";
		}
		String msg = "";
		if(noCacheData) {
			msg = "有通知瀏覽器不要Cache回應";
		} else {
			msg = "未通知瀏覽器不要Cache回應";
		}
		Date currentTime = new Date();
		String time = String.format("%tr", currentTime);
		String dateUS = String.format("%tD", currentTime);
		String dateTW = (Integer.parseInt(dateUS.substring(6).trim()) + 2000) + 
							"年" + dateUS.substring(0, 2) + "月" + dateUS.substring(3, 5) + "日";
		String timeTW = time.substring(9) + time.substring(0, 8);
		out.println("瀏覽器 : " + browser + "<br>" + msg + "<br>(Servlet)西元" + dateTW + " " + timeTW);
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
