package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.ProductBean;
import model.ProductDiscountBean;
import model.ProductPicBean;
import model.ProductPicService;
import model.ProductStatusBean;
import model.ProductTypeBean;
import model.UnitBean;
import model.dao.ProductDAOjdbc;
import model.dao.ProductDiscountDAOjdbc;
import model.dao.ProductStatusDAOjdbc;

@WebServlet("/ProductMaintain/ProcessProductServlet")
@MultipartConfig(location = "C:/TWFarmer/repository/TWFarmer/src/main/webapp/img/") // 圖片存放路徑
public class ProcessProductServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 輸入資料編碼
		request.setCharacterEncoding("UTF-8");
		// 取出session物件
		HttpSession session = request.getSession();
		ProductBean productBean = new ProductBean();
		// InsertProductServlet.java 第59行setAttribute
		productBean = (ProductBean) session.getAttribute("product");
		System.out.println(productBean.getSellerId());

		ProductTypeBean productTypeBean = new ProductTypeBean();
		UnitBean unitBean = new UnitBean();
		ProductDiscountBean productDiscountBean = new ProductDiscountBean();
		ProductStatusBean productStatusBean = new ProductStatusBean();

		// 1.讀取使用者輸入的資料============================================
		String origin = request.getParameter("origin");
		String productName = request.getParameter("productName");
		String temp1 = request.getParameter("inventory");
		String temp2 = request.getParameter("price");
		String temp3 = request.getParameter("unitName");
		System.out.println(temp3);
		String temp4 = request.getParameter("type");
		String productIntro = request.getParameter("productIntro");
		String temp5 = request.getParameter("freight");
		String temp6 = request.getParameter("addDate");
		String temp7 = request.getParameter("removeEstDate");
		String temp8 = request.getParameter("removeDate");
		// String productStatusId = request.getParameter("productStatusId");
		// String discountId = request.getParameter("discountId");
		String temp9 = request.getParameter("minThreshold");
		String temp10 = request.getParameter("maxThreshold");
		String temp11 = request.getParameter("discountPrice");
		// String productPicId = request.getParameter("productPicId");
		Part part = request.getPart("picture1");
		String pictureIntro = request.getParameter("pictureIntro");

		// 存放錯誤訊息============================================
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);
		// 2.檢查使用者輸入的資料
		// if (productId == null || productId.trim().length() == 0) {
		// errorMessage.put("productId", "商品編號是必填欄位");
		// }

		// if (sellerId == null || sellerId.trim().length() == 0) {
		// errorMessage.put("sellerId", "賣家ID是必填欄位");
		// }

		if (origin == null || origin.trim().length() == 0) {
			errorMessage.put("origin", "產地是必填欄位");
		}

		if (productName == null || productName.trim().length() == 0) {
			errorMessage.put("productName", "商品名稱是必填欄位");
		}

		if (temp1 == null || temp1.trim().length() == 0) {
			errorMessage.put("inventory", "庫存是必填欄位");
		}

		if (temp2 == null || temp2.trim().length() == 0) {
			errorMessage.put("price", "單位價格是必填欄位");
		}

		if (temp3 == null || temp3.trim().length() == 0) {
			errorMessage.put("unitName", "單位是必填欄位");
		}

		if (temp4 == null || temp4.trim().length() == 0) {
			errorMessage.put("type", "類別是必填欄位");
		}

		if (productIntro == null || productIntro.trim().length() == 0) {
			errorMessage.put("productIntro", "商品介紹是必填欄位");
		}

		if (temp5 == null || temp5.trim().length() == 0) {
			errorMessage.put("freight", "運費是必填欄位");
		}

		if (temp6 == null || temp6.trim().length() == 0) {
			errorMessage.put("addDate", "上架日期是必填欄位");
		}

		if (temp7 == null || temp7.trim().length() == 0) {
			errorMessage.put("removeEstDate", "預估下架日期是必填欄位");
		}

		// if (temp8 == null || temp8.trim().length() == 0) {
		// errorMessage.put("removeDate", "下架日期是必填欄位");
		// }

		// if (productStatusId == null || productStatusId.trim().length() == 0)
		// {
		// errorMessage.put("productStatusId", "商品狀態是必填欄位");
		// }

		// if (discountId == null || discountId.trim().length() == 0) {
		// errorMessage.put("discountId", "折扣編號是必填欄位");
		// }

		if (temp9 == null || temp9.trim().length() == 0) {
			errorMessage.put("minThreshold", "最小件數是必填欄位");
		}

		if (temp10 == null || temp10.trim().length() == 0) {
			errorMessage.put("maxThreshold", "最大件數是必填欄位");
		}

		if (temp11 == null || temp11.trim().length() == 0) {
			errorMessage.put("discountPrice", "折扣後價格是必填欄位");
		}

		// if (productPicId == null || productPicId.trim().length() == 0) {
		// errorMessage.put("productPicId", "商品圖片編號是必填欄位");
		// }

		// if (picture == null || picture.trim().length() == 0) {
		// errorMessage.put("picture", "商品圖片是必填欄位");
		// }

		// if (pictureIntro == null || pictureIntro.trim().length() == 0) {
		// errorMessage.put("pictureIntro", "商品圖片介紹是必填欄位");
		// }

		// 3.轉換資料============================================
		int inventory = 0;
		if (temp1 != null && temp1.length() != 0) {
			try {
				inventory = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("inventory", "庫存必須是整數");
			}
		}

		int price = 0;
		if (temp2 != null && temp2.length() != 0) {
			try {
				inventory = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("price", "單位價格必須是整數");
			}
		}

		int unitName = 0;
		if (temp3 != null && temp3.length() != 0) {
			try {
				unitName = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("unitName", "單位必須是整數");
			}
		}

		int type = 0;
		if (temp4 != null && temp4.length() != 0) {
			try {
				type = Integer.parseInt(temp4);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("type", "類別必須是整數");
			}
		}

		int freight = 0;
		if (temp5 != null && temp5.length() != 0) {
			try {
				freight = Integer.parseInt(temp5);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("freight", "運費必須是整數");
			}
		}

		java.util.Date addDate = null;
		if (temp6 != null && temp6.length() != 0) {
			try {
				addDate = sFormat.parse(temp6);
			} catch (ParseException e) {
				e.printStackTrace();
				errorMessage.put("addDate", "上架日期必須是符合yyyy-MM-dd格式的日期");
			}
		}

		java.util.Date removeEstDate = null;
		if (temp7 != null && temp7.length() != 0) {
			try {
				removeEstDate = sFormat.parse(temp7);
			} catch (ParseException e) {
				e.printStackTrace();
				errorMessage.put("removeEstDate", "預估下架日期必須是符合yyyy-MM-dd格式的日期");
			}
		}

		// java.util.Date removeDate = null;
		// if (temp8 != null && temp8.length() != 0) {
		// try {
		// addDate = sFormat.parse(temp8);
		// } catch (ParseException e) {
		// e.printStackTrace();
		// errorMessage.put("removeDate", "下架日期必須是符合yyyy-MM-dd格式的日期");
		// }
		// }

		int minThreshold = 0;
		if (temp9 != null && temp9.length() != 0) {
			try {
				minThreshold = Integer.parseInt(temp9);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("minThreshold", "最小件數必須是整數");
			}
		}

		int maxThreshold = 0;
		if (temp10 != null && temp10.length() != 0) {
			try {
				maxThreshold = Integer.parseInt(temp10);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("maxThreshold", "最大件數必須是整數");
			}
		}

		int discountPrice = 0;
		if (temp11 != null && temp11.length() != 0) {
			try {
				discountPrice = Integer.parseInt(temp11);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("discountPrice", "折扣後價格必須是整數");
			}
		}

		// 如果有錯誤訊息，就顯示在ProductInsert.jsp(錯誤訊息顯示在欄位旁邊)
		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("ProductInsert.jsp");
			rd.forward(request, response);
			for (Object key : errorMessage.keySet()) {
				System.out.println(key + " : " + errorMessage.get(key));
			}
			System.out.println();
			return; // 在這就停止，不往下跑
		}

		// 4.呼叫Model(扮演封裝資料的角色)============================================

		// 賣家ID SellerID (FK MemberID)
		productBean = (ProductBean) session.getAttribute("product");
		// 產地
		productBean.setOrigin(origin);
		// 商品名稱
		productBean.setProductName(productName);
		// 庫存
		productBean.setInventory(inventory);
		// 單位價格
		productBean.setPrice(price);
		// 單位
		productBean.setUnitId(unitName);
		System.out.println(unitName);
		// 類別
		productBean.setProductTypeId(type);
		// 運費
		productBean.setFreight(freight);
		// 上架日期
		productBean.setAddDate(addDate);
		// 預估下架日期
		productBean.setRemoveEstDate(removeEstDate);
		// 下架日期
		// productBean.setRemoveDate(removeDate);
		// 商品狀態
		productBean.setProductStatusId(2501);
		// 最小件數
		productDiscountBean.setMinThreshold(minThreshold);
		// 最大件數
		productDiscountBean.setMaxThreshold(maxThreshold);
		// 折扣後價格
		productDiscountBean.setDiscountPrice(discountPrice);

		// 商品介紹
		if (productIntro != null && productIntro.length() != 0) {
			productBean.setProductIntro(productIntro);
		}

		// 回傳編號：參考CheckJointPurchaseServlet第114行後
		/*
		 * insert同時回傳含有流水號的Bean(productId) insert完後回傳的bean就會有流水號
		 * 可以再從這個bean裡面拿出商品編號
		 */
		ProductDAOjdbc dao1 = new ProductDAOjdbc();
		productBean = dao1.insert(productBean);
		// 商品圖片(參考UploadFileServlet)
		
		/*
		 * insert同時回傳含有流水號的Bean(productPicId) insert完後回傳的bean就會有流水號
		 * 可以再從這個bean裡面拿出商品圖片編號
		 */
		ProductPicBean productPicBean = new ProductPicBean();
		productPicBean.setProductId(productBean.getProductId());
		productPicBean.setPictureIntro(pictureIntro); // 商品圖片介紹
		ProductPicService.uploadPic(productPicBean, part);

		/*
		 * insert同時回傳含有流水號的Bean(DiscountId) insert完後回傳的bean就會有流水號
		 * 可以再從這個bean裡面拿出商品折扣編號
		 */
		ProductDiscountDAOjdbc dao3 = new ProductDiscountDAOjdbc();
		productDiscountBean.setDiscountPrice(discountPrice);
		productDiscountBean.setMaxThreshold(maxThreshold);
		productDiscountBean.setMinThreshold(maxThreshold);
		productDiscountBean.setProductId(productBean.getProductId());
		dao3.insert(productDiscountBean);
		
		ProductStatusDAOjdbc dao4 = new ProductStatusDAOjdbc();
		productStatusBean = dao4.select(productBean.getProductStatusId());

		// 5.挑選適當頁面============================================
		request.setAttribute("productBean", productBean);
		request.setAttribute("productPicBean", productPicBean);
		request.setAttribute("productStatusBean", productStatusBean);

		 request.getRequestDispatcher("ProductInsertSuccess.jsp").forward(request, response);
//		response.sendRedirect("ProductInsertSuccess.jsp"); // 網址改為新網頁
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
