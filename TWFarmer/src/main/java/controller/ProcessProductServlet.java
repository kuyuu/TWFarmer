package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.MemberBean;
import model.ProductBean;
import model.ProductDiscountBean;
import model.ProductPicBean;
import model.ProductPicService;
import model.ProductStatusBean;
import model.dao.ProductDAOjdbc;
import model.dao.ProductDiscountDAOjdbc;
import model.dao.ProductPicDAOJdbc;

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
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		ProductBean productBean = new ProductBean();
		// InsertProductServlet.java 第59行setAttribute
		productBean = (ProductBean) session.getAttribute("product");

		// ProductTypeBean productTypeBean = new ProductTypeBean();
		// UnitBean unitBean = new UnitBean();

		ProductDiscountBean productDiscountBean = new ProductDiscountBean();

		// 1.讀取使用者輸入的資料============================================
		String origin = request.getParameter("origin");
		String productName = request.getParameter("productName");
		String temp1 = request.getParameter("inventory");
		String temp2 = request.getParameter("price");

		String unit = request.getParameter("unit");
		// String temp3 = request.getParameter("unitName");
		// System.out.println(temp3);
		String productTypeName = request.getParameter("productTypeName");
		String productIntro = request.getParameter("productIntro");
		String temp5 = request.getParameter("freight");
		String temp6 = request.getParameter("addDate");
		String temp7 = request.getParameter("removeEstDate");
		String temp8 = request.getParameter("removeDate");
		String productStatusName = request.getParameter("productStatusName");
		// String discountId = request.getParameter("discountId");
		String temp9 = request.getParameter("minThreshold");
		String temp10 = request.getParameter("maxThreshold");
		String temp11 = request.getParameter("discountPrice");
		// String productPicId = request.getParameter("productPicId");
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

		if (unit == null || unit.trim().length() == 0) {
			errorMessage.put("unit", "單位是必填欄位");
		}

		if (productTypeName == null || productTypeName.trim().length() == 0) {
			errorMessage.put("productTypeName", "類別是必填欄位");
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

		if (productStatusName == null || productStatusName.trim().length() == 0) {
			errorMessage.put("productStatusName", "商品狀態是必填欄位");
		}

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
				price = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errorMessage.put("price", "單位價格必須是整數");
			}
		}

		// int unitName = 0;
		// if (temp3 != null && temp3.length() != 0) {
		// try {
		// unitName = Integer.parseInt(temp3);
		// } catch (NumberFormatException e) {
		// e.printStackTrace();
		// errorMessage.put("unitName", "單位必須是整數");
		// }
		// }

//		int type = 0;
//		if (temp4 != null && temp4.length() != 0) {
//			try {
//				type = Integer.parseInt(temp4);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				errorMessage.put("type", "類別必須是整數");
//			}
//		}

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
			return; // 在這就停止，不往下跑
		}

		// 4.呼叫Model(扮演封裝資料的角色)============================================

		// 賣家ID SellerID (FK MemberID)
		productBean.setSellerId(mb.getMemberId());
		// 產地
		productBean.setOrigin(origin);
		// 商品名稱
		productBean.setProductName(productName);
		// 庫存
		productBean.setInventory(inventory);
		// 單位價格
		productBean.setPrice(price);
		// 單位
		productBean.setUnit(unit);
		// 類別
		productBean.setProductTypeName(productTypeName);
		// 運費
		productBean.setFreight(freight);
		// 上架日期
		productBean.setAddDate(addDate);
		// 預估下架日期
		productBean.setRemoveEstDate(removeEstDate);
		// 下架日期
		// productBean.setRemoveDate(removeDate);
		// 商品狀態
		productBean.setProductStatusName(productStatusName);
		// 最小件數
		// productDiscountBean.setMinThreshold(minThreshold);
		// 最大件數
		// productDiscountBean.setMaxThreshold(maxThreshold);
		// 折扣後價格
		// productDiscountBean.setDiscountPrice(discountPrice);

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
		// if (productIntro != null && productIntro.length() != 0) {

		// } // 商品圖片介紹
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
		ProductDiscountDAOjdbc dao3 = new ProductDiscountDAOjdbc();
		productDiscountBean.setDiscountPrice(discountPrice);
		productDiscountBean.setMaxThreshold(maxThreshold);
		productDiscountBean.setMinThreshold(minThreshold);
		productDiscountBean.setProductId(productBean.getProductId());
		dao3.insert(productDiscountBean);
//		List<ProductDiscountBean> list2 = dao3.selectByProductId(productBean.getProductId());

		// 5.挑選適當頁面============================================
		request.setAttribute("productBean", productBean);
		request.setAttribute("productPicList", list);
		request.setAttribute("productDiscountBean", productDiscountBean);

		request.getRequestDispatcher("ProductInsertSuccess.jsp").forward(request, response);
		// 不能用=>這樣等於說client重新送出request 存的一堆productBean都沒了) 不然就要塞到session裡面
		// 不能塞request
		// response.sendRedirect("ProductInsertSuccess.jsp"); // 網址改為新網頁
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
