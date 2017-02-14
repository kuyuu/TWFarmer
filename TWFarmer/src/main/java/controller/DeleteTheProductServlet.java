package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductDiscountBean;
import model.ProductPicBean;
import model.dao.ProductDAOjdbc;
import model.dao.ProductDiscountDAOjdbc;
import model.dao.ProductPicDAOJdbc;

@WebServlet("/BackStage/DeleteTheProductServlet")
public class DeleteTheProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DeleteTheProductServlet hahahahah");
		request.setCharacterEncoding("UTF-8");
		// 接收資料
		String temp = request.getParameter("productId");
		String origin = request.getParameter("origin");
		String productName = request.getParameter("productName");
		String temp2 = request.getParameter("inventory");
		String temp3 = request.getParameter("price");
		String unit = request.getParameter("unit");
		String productTypeName = request.getParameter("productTypeName");
		String productIntro = request.getParameter("productIntro");
		String temp4 = request.getParameter("freight");
		String prodaction = request.getParameter("prodaction");
		// 轉換資料
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
			}
		}

		int price = 0;
		if (temp3 != null && temp3.length() != 0) {
			try {
				price = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		int freight = 0;
		if (temp4 != null && temp4.length() != 0) {
			try {
				freight = Integer.parseInt(temp4);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		// 呼叫Model，根據Model執行結果，決定需要顯示的View元件
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

			request.getRequestDispatcher("../ProductMaintain/ProductDeleteSuccess.jsp").forward(request, response);
		} else if ("修改".equals(prodaction)) {
			// ProductDAOjdbc dao = new ProductDAOjdbc();
			// ProductBean bean1 = dao.select(productId);
			// bean1.setProductStatusName("刪除");
			// ProductBean bean = dao.update(bean1); //將Product的狀態改為"刪除"
			// 管理商品的搜尋應加入條件排除"刪除"的商品
			// request.setAttribute("productBean", bean);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
