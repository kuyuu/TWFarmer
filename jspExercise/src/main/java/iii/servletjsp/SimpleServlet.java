package iii.servletjsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/abc/xyz/*")
public class SimpleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<html><head><title>用Servlet來產生文字性的回應很累人</title></head>");
		out.println("<body><h1>");
		out.println("這是doGet()方法印出的訊息(11/24)</h1>");
		out.println("一年有" + 365 * 86400 + "秒<br />");
		out.println("一年有" + 365 * 86400 * 1000L + "豪秒<br />");
		out.println("requestURL()=" + req.getRequestURL() + "<br />");
		out.println("requestURI()=" + req.getRequestURI() + "<br />");
		out.println("contextPath()=" + req.getContextPath() + "<br />");
		out.println("servletPath()=" + req.getServletPath() + "<br />");
		out.println("pathInfo()=" + req.getPathInfo() + "<br />");
		out.println("您的IP為=" + req.getRemoteAddr() + "<br />");
		out.println("瀏覽器送來的請求標頭:<br />");
		Enumeration<String> en = req.getHeaderNames();
		while (en.hasMoreElements()) {
			String header = en.nextElement();
			String value = req.getHeader(header);
			out.println(header + "==>" + value + "<br />");
		}
		out.println("</body></html>");
		out.close();
		// super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("這是doPost()方法印出的訊息");
		// super.doPost(req, resp);
	}

}
