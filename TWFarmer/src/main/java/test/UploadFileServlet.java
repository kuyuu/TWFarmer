package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.ProductPicBean;
import model.ProductPicService;

@WebServlet("/test/UploadFileServlet")
@MultipartConfig(location = "C:/TWFarmer/repository/TWFarmer/src/main/webapp/img/")
public class UploadFileServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 接收資料
		String temp = request.getParameter("productId");
		Part part = request.getPart("picture");
		String pictureIntro = request.getParameter("pictureIntro");
		// 轉換資料
		int productId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				productId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		// 呼叫Model
		ProductPicBean bean = new ProductPicBean();
		bean.setProductId(productId);
		bean.setPictureIntro(pictureIntro);
		ProductPicService.uploadPic(bean, part);
		

	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
