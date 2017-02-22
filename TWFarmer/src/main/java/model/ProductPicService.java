package model;

import java.io.IOException;
import javax.servlet.http.Part;
import model.dao.ProductPicDAOJdbc;

public class ProductPicService {
	
	public static ProductPicBean uploadPic(ProductPicBean bean, Part part) {
		ProductPicDAOJdbc dao = new ProductPicDAOJdbc();
		bean = dao.insert(bean);
		String filename = bean.getProductPicId() + "." + getFilename(part); // 檔名為ProductPicId
		bean.setPictureName(filename); // 將檔名寫入資料庫
		bean = dao.update(bean);
		try {
			part.write(filename);
		} catch (IOException e) {
			e.printStackTrace();
		} // 將檔案寫入
		return bean;
	}
	
	private static String getFilename(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				filename = filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1)
						.substring(filename.lastIndexOf('.') + 1);
				return filename;
			}
		}
		return null;
	}
}
