package iii.servletjsp;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendPictureServlet
 */
@WebServlet("/ShowPicture.do")
public class SendPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String[] sa = { "fs.jpg", "m001.jpg", "m12.jpg", "m46.jpg", "m536.jpg", "snoopy.jpg" };
	List<String> list = new ArrayList(Arrays.asList(sa));

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendPictureServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		synchronized (this) {
			if (list.isEmpty()) {
				list = new ArrayList<String>(Arrays.asList(sa));
			}

			int num = (int) (Math.random() * list.size());
			String filename = list.remove(num);
			System.out.println("size=" + list.size());
			ServletContext context = request.getServletContext();
			String mimeType = context.getMimeType(filename);
			response.setContentType(mimeType);
			InputStream is = context.getResourceAsStream("/images/" + filename);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[8192];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				os.write(b, 0, len);
			}
			os.close();
			is.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
