package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.ProductBean;
import model.ProductDiscountBean;
import model.ProductPicBean;
import model.ProductPicService;
import model.dao.ProductDAOjdbc;
import model.dao.ProductDiscountDAOjdbc;
import model.dao.ProductPicDAOJdbc;

@WebServlet("/BackStage/DeleteTheProductServlet")
@MultipartConfig(location = "C:/TWFarmer/repository/TWFarmer/src/main/webapp/img/") // 圖片存放路徑
public class DeleteTheProductServlet extends HttpServlet {
	Date today = new Date();
	SimpleDateFormat removeDate = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DeleteTheProductServlet hahahahah");
		// 輸入資料編碼
		request.setCharacterEncoding("UTF-8");
		// 1.接收資料===========================================
		String temp = request.getParameter("productId"); // 改變商品狀態用
		String origin = request.getParameter("origin");
		String productName = request.getParameter("productName");
		String temp2 = request.getParameter("inventory");
		String temp3 = request.getParameter("price");
		String unit = request.getParameter("unit");
		String productTypeName = request.getParameter("productTypeName");
		String productIntro = request.getParameter("productIntro");
		String temp4 = request.getParameter("freight");
		String temp5 = request.getParameter("addDate");
		String temp6 = request.getParameter("removeEstDate");
		// String temp7 = request.getParameter("removeDate");
		String productStatusName = request.getParameter("productStatusName");
		String temp8 = request.getParameter("minThreshold");
		String temp9 = request.getParameter("maxThreshold");
		String temp10 = request.getParameter("discountPrice");
		Part part = request.getPart("picture1");
		Part part2 = request.getPart("picture2");
		Part part3 = request.getPart("picture3");
		Part part4 = request.getPart("picture4");
		Part part5 = request.getPart("picture5");
		String pictureIntro1 = request.getParameter("pictureIntro1");
		String pictureIntro2 = request.getParameter("pictureIntro2");
		String pictureIntro3 = request.getParameter("pictureIntro3");
		String pictureIntro4 = request.getParameter("pictureIntro4");
		String pictureIntro5 = request.getParameter("pictureIntro5");
		String prodaction = request.getParameter("prodaction"); // 按鈕

		// 存放錯誤訊息============================================
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);

		// 2.檢查使用者輸入的資料
		if (origin == null || origin.trim().length() == 0) {
			errorMessage.put("origin", "產地是必填欄位");
		}

		if (productName == null || productName.trim().length() == 0) {
			errorMessage.put("productName", "商品名稱是必填欄位");
		}

		if (temp2 == null || temp2.trim().length() == 0) {
			errorMessage.put("inventory", "庫存是必填欄位");
		}

		if (temp3 == null || temp3.trim().length() == 0) {
			errorMessage.put("price", "單位價格是必填欄位");
		}

		if (unit == null || unit.trim().length() == 0) {
			errorMessage.put("unit", "單位是必填欄位");
		}

		if (productTypeName == null || productTypeName.trim().length() == 0) {
			errorMessage.put("productTypeName", "類別是必填欄位");
		}

		if (productIntro == null || productIntro.trim().length() == 0) {
			errorMessage.put("productIntro", "商品介紹是必填欄位");
		}

		if (temp4 == null || temp4.trim().length() == 0) {
			errorMessage.put("freight", "運費是必填欄位");
		}

		if (temp5 == null || temp5.trim().length() == 0) {
			errorMessage.put("addDate", "上架日期是必填欄位");
		}

		if (temp6 == null || temp6.trim().length() == 0) {
			errorMessage.put("removeEstDate", "預估下架日期是必填欄位");
		}

		if (productStatusName == null || productStatusName.trim().length() == 0) {
			errorMessage.put("productStatusName", "商品狀態是必填欄位");
		}

		if (temp8 == null || temp8.trim().length() == 0) {
			errorMessage.put("minThreshold", "最小件數是必填欄位");
		}

		if (temp9 == null || temp9.trim().length() == 0) {
			errorMessage.put("maxThreshold", "最大件數是必填欄位");
		}

		if (temp10 == null || temp10.trim().length() == 0) {
			errorMessage.put("discountPrice", "折扣後價格是必填欄位");
		}

		// 3.轉換資料===========================================

		// 改變商品狀態
		int productId = 0;
		if (temp != null && temp.length() != 0) {
			try {
				productId = Integer.parseInt(temp);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		int inventory = 0;
		if (temp2 != null && temp2.length() != 0) {
			try {
				inventory = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("inventory", "庫存必須是整數");
			}
		}

		int price = 0;
		if (temp3 != null && temp3.length() != 0) {
			try {
				price = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("price", "單位價格必須是整數");
			}
		}

		int freight = 0;
		if (temp4 != null && temp4.length() != 0) {
			try {
				freight = Integer.parseInt(temp4);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("freight", "運費必須是整數");
			}
		}

		java.util.Date addDate = null;
		if (temp5 != null && temp5.length() != 0) {
			try {
				addDate = sFormat.parse(temp5);
			} catch (ParseException e) {
				e.printStackTrace();
				errorMessage.put("addDate", "上架日期必須是符合yyyy-MM-dd格式的日期");
			}
		}

		java.util.Date removeEstDate = null;
		if (temp6 != null && temp6.length() != 0) {
			try {
				removeEstDate = sFormat.parse(temp6);
			} catch (ParseException e) {
				e.printStackTrace();
				errorMessage.put("removeEstDate", "預估下架日期必須是符合yyyy-MM-dd格式的日期");
			}
		}

		int minThreshold = 0;
		if (temp8 != null && temp8.length() != 0) {
			try {
				minThreshold = Integer.parseInt(temp8);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("minThreshold", "最小件數必須是整數");
			}
		}

		int maxThreshold = 0;
		if (temp9 != null && temp9.length() != 0) {
			try {
				maxThreshold = Integer.parseInt(temp9);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("maxThreshold", "最大件數必須是整數");
			}
		}

		int discountPrice = 0;
		if (temp10 != null && temp10.length() != 0) {
			try {
				discountPrice = Integer.parseInt(temp10);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("discountPrice", "折扣後價格必須是整數");
			}
		}

		// 如果有錯誤訊息，就顯示在ProductDelete.jsp(錯誤訊息顯示在欄位旁邊)
		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("ProductDelete.jsp");
			rd.forward(request, response);
			for (Object key : errorMessage.keySet()) {
				System.out.println(key + " : " + errorMessage.get(key));
			}
			return; // 在這就停止，不往下跑
		}

		// 4.呼叫Model，根據Model執行結果，決定需要顯示的View元件=============
		if ("刪除".equals(prodaction)) {
			ProductDAOjdbc dao = new ProductDAOjdbc();
			ProductBean bean1 = dao.select(productId);
			bean1.setProductStatusName("刪除");
			ProductBean bean = dao.update(bean1); // 將Product的狀態改為"刪除"
													// 管理商品的搜尋應加入條件排除"刪除"的商品
			request.setAttribute("productBean", bean);

			// 下面跟商品做同樣的處理
			// ProductDiscountDAOjdbc dao2 = new ProductDiscountDAOjdbc();
			// ProductDiscountBean bean2 = dao2.select(discountId);
			// bean1.setProductStatusName("刪除");
			// ProductBean bean2 = dao.update(bean1); //將Product的狀態改為"刪除"
			// 管理商品的搜尋應加入條件排除"刪除"的商品
			// request.setAttribute("productDiscountList", bean);
			// boolean list = dao2.delete(productId);
			// request.setAttribute("productDiscountList", list);
			//
			// ProductPicDAOJdbc dao3 = new ProductPicDAOJdbc();
			// ProductPicBean bean3 = dao3.select(productPicId);
			// bean1.setProductStatusName("刪除");
			// ProductBean bean = dao.update(bean1); //將Product的狀態改為"刪除"
			// 管理商品的搜尋應加入條件排除"刪除"的商品
			// request.setAttribute("productBean", bean);
			// ProductPicDAOJdbc dao3 = new ProductPicDAOJdbc();
			// boolean list2 = dao3.delete(productId);
			// request.setAttribute("productPicList", list2);

			// 5.挑選適當頁面=>按下刪除鈕，導向ProductDeleteSuccess.jsp頁面
			request.getRequestDispatcher("../ProductMaintain/ProductDeleteSuccess.jsp").forward(request, response);
		} else if ("下架".equals(prodaction)) {
			ProductDAOjdbc dao = new ProductDAOjdbc();
			ProductBean bean1 = dao.select(productId);
			bean1.setProductStatusName("下架");
			// bean1.setRemoveDate(removeDate.format(today));
			ProductBean bean = dao.update(bean1); // 將Product的狀態改為"下架"

			request.setAttribute("productBean", bean);
			
			// 5.挑選適當頁面=>按下刪除鈕，導向ProductDiscontinueSuccess頁面
			request.getRequestDispatcher("../ProductMaintain/ProductDiscontinueSuccess.jsp").forward(request, response);
		} else if ("修改".equals(prodaction)) {
			// ProductDAOjdbc dao = new ProductDAOjdbc();
			// ProductBean bean1 = dao.select(productId);
			// bean1.setProductStatusName("刪除");
			// ProductBean bean = dao.update(bean1); //將Product的狀態改為"刪除"
			// 管理商品的搜尋應加入條件排除"刪除"的商品
			// request.setAttribute("productBean", bean);

			// 4.呼叫Model
			ProductBean productBean = new ProductBean();
			ProductDAOjdbc dao1 = new ProductDAOjdbc();
			productBean = dao1.update(productBean);

			ProductPicBean productPicBean = new ProductPicBean();
			productPicBean.setProductId(productBean.getProductId());
			// 商品圖片介紹
			if (part.getSize() != 0) {
				productPicBean.setPictureIntro(pictureIntro1);
				ProductPicService.uploadPic(productPicBean, part);
			}
			if (part2.getSize() != 0) {
				productPicBean.setPictureIntro(pictureIntro2);
				ProductPicService.uploadPic(productPicBean, part2);
			}
			if (part3.getSize() != 0) {
				productPicBean.setPictureIntro(pictureIntro3);
				ProductPicService.uploadPic(productPicBean, part3);
			}
			if (part4.getSize() != 0) {
				productPicBean.setPictureIntro(pictureIntro4);
				ProductPicService.uploadPic(productPicBean, part4);
			}
			if (part5.getSize() != 0) {
				productPicBean.setPictureIntro(pictureIntro5);
				ProductPicService.uploadPic(productPicBean, part5);
			}
			ProductPicDAOJdbc dao2 = new ProductPicDAOJdbc();
			List<ProductPicBean> list = dao2.selectByProductId(productBean.getProductId());

			/*
			 * insert同時回傳含有流水號的Bean(DiscountId) insert完後回傳的bean就會有流水號
			 * 可以再從這個bean裡面拿出商品折扣編號
			 */
			ProductDiscountBean productDiscountBean = new ProductDiscountBean();
			ProductDiscountDAOjdbc dao3 = new ProductDiscountDAOjdbc();
			productDiscountBean.setDiscountPrice(discountPrice);
			productDiscountBean.setMaxThreshold(maxThreshold);
			productDiscountBean.setMinThreshold(minThreshold);
			List<ProductDiscountBean> list2 = dao3.selectByProductId(productBean.getProductId());
			// productDiscountBean.setProductId(productBean.getProductId());
			dao3.update(productDiscountBean);

			// 5.挑選適當頁面============================================
			request.setAttribute("productBean", productBean);
			request.setAttribute("productPicList", list);
			request.setAttribute("productDiscountList", list2);

			request.getRequestDispatcher("ProductUpdateSuccess.jsp").forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
