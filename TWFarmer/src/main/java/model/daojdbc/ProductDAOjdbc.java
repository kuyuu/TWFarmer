package model.daojdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.JPDetailBean;
import model.bean.ProductBean;
import model.bean.ProductPicBean;
import model.bean.QnABean;
import model.dao.ProductDAO;

public class ProductDAOjdbc implements ProductDAO {
	private DataSource dataSource;

	public ProductDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public ProductDAOjdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public static void main(String[] args) {
//		ProductDAO dao = new ProductDAOjdbc();

		// select all OK
		// List<ProductBean> beans= dao.select();
		// System.out.println("bean="+beans);

		// 查詢單筆 OK
		// ProductBean productBean3 = dao.select(2001);
		// System.out.print(productBean3.getSellerId() + ",");
		// System.out.print(productBean3.getOrigin() + ",");
		// System.out.print(productBean3.getProductName() + ",");
		// System.out.print(productBean3.getInventory() + ",");
		// System.out.print(productBean3.getPrice() + ",");
		// System.out.print(productBean3.getUnitId() + ",");
		// System.out.print(productBean3.getProductTypeId() + ",");
		// System.out.print(productBean3.getProductIntro() + ",");
		// System.out.print(productBean3.getFreight() + ",");
		// System.out.print(productBean3.getAddDate() + ",");
		// System.out.print(productBean3.getRemoveEstDate() + ",");
		// System.out.print(productBean3.getRemoveDate() + ",");
		// System.out.println(productBean3.getProductStatusName() );

		// 新增 OK
		// ProductBean productBean1 = new ProductBean();
		// productBean1.setSellerId(1004);
		// productBean1.setOrigin("台北市南港區");
		// productBean1.setProductName("草莓");
		// productBean1.setInventory(500);
		// productBean1.setPrice(1000);
		// productBean1.setUnitId(2201);
		// productBean1.setProductTypeId(2104);
		// productBean1.setProductIntro("草莓草莓");
		// productBean1.setFreight(50);
		// productBean1.setAddDate(java.sql.Date.valueOf("2016-06-05"));
		// productBean1.setRemoveEstDate(java.sql.Date.valueOf("2016-06-05"));
		// productBean1.setRemoveDate(java.sql.Date.valueOf("2016-06-05"));
		// productBean1.setProductStatusName("上架");
		//
		// ProductBean q = dao.insert(productBean1);
		// System.out.println(q);

		// update. ok
		// ProductBean productBean2 = dao.select(3007);
		//
		// productBean2.setSellerId(1004);
		// productBean2.setOrigin("屏東縣九如鄉");
		// productBean2.setProductName("草莓牛奶");
		// productBean2.setInventory(500);
		// productBean2.setPrice(50000);
		// productBean2.setUnitId(2201);
		// productBean2.setProductTypeId(2101);
		// productBean2.setProductIntro("草莓草莓草莓");
		// productBean2.setFreight(50);
		// productBean2.setAddDate(java.sql.Date.valueOf("2016-06-05"));
		// productBean2.setRemoveEstDate(java.sql.Date.valueOf("2016-06-05"));
		// productBean2.setRemoveDate(java.sql.Date.valueOf("2016-06-05"));
		// productBean2.setProductStatusName("下架");
		// dao.update(productBean2);
		// System.out.println(productBean2);

		// 刪除. ok
		// dao.delete(3007);
		// System.out.println("delete it");
		//

	}

	private static final String SELECT_BY_ID = "select * from Product where productId=? ";

	@Override
	public ProductBean select(int productId) {
		ProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, productId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ProductBean();
				result.setProductId(rset.getInt("productId"));
				result.setSellerId(rset.getInt("sellerId"));
				result.setOrigin(rset.getString("origin"));
				result.setProductName(rset.getString("productName"));
				result.setInventory(rset.getInt("inventory"));
				result.setPrice(rset.getInt("price"));
				result.setUnit(rset.getString("unit"));
				result.setProductTypeName(rset.getString("productTypeName"));
				result.setProductIntro(rset.getString("productIntro"));
				result.setFreight(rset.getInt("freight"));
				result.setAddDate(rset.getDate("addDate"));
				result.setRemoveEstDate(rset.getDate("removeEstDate"));
				result.setRemoveDate(rset.getDate("removeDate"));
				// result.setProductStatusId(rset.getInt("productStatusId"));
				result.setAddDate(rset.getDate("addDate"));
				result.setRemoveEstDate(rset.getDate("removeEstDate"));
				result.setRemoveDate(rset.getDate("removeDate"));
				result.setProductStatusName(rset.getString("productStatusName"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	private static final String SELECT_BY_SELLERID_WITH_PIC = "Select * FROM Product Where SellerId=?";
	@Override
	public Map<ProductBean, List<ProductPicBean>> selectBySellerIdWithPic(int sellerId) {
		Map<ProductBean, List<ProductPicBean>> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_SELLERID_WITH_PIC);) {

			stmt.setInt(1, sellerId);
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<ProductBean, List<ProductPicBean>>();
			ProductPicDAOJdbc dao = new ProductPicDAOJdbc();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));
				List<ProductPicBean> list = new ArrayList<ProductPicBean>();
				list = dao.selectByProductId(rset.getInt("productId"));
				result.put(productBean, list);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_PRODUCTNAME = "Select * FROM Product Where  ProductStatusName='上架'and (origin LIKE ? or ProductName like ?) Order By ProductID";
	@Override
	public Map<ProductBean, List<ProductPicBean>> selectByName(String keyword) {
		Map<ProductBean, List<ProductPicBean>> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTNAME);) {

			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<ProductBean, List<ProductPicBean>>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));
				List<ProductPicBean> list = new ArrayList<ProductPicBean>();
				ProductPicDAOJdbc dao = new ProductPicDAOJdbc();
				list = dao.selectByProductId(rset.getInt("productId"));
				result.put(productBean, list);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

//	private static final String SELECT_BY_PRODUCTNAME = "Select * FROM Product Where  ProductStatusName='上架'and origin LIKE ?";
//
//	@Override
//	public List<ProductBean> selectByName(String name) {
//		List<ProductBean> result = null;
//		try (Connection conn = dataSource.getConnection();
//				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTNAME);) {
//
//			stmt.setString(1, "%" + name + "%");
//			ResultSet rset = stmt.executeQuery();
//			result = new ArrayList<ProductBean>();
//			while (rset.next()) {
//				ProductBean productBean = new ProductBean();
//
//				productBean.setProductId(rset.getInt("productId"));
//				productBean.setSellerId(rset.getInt("sellerId"));
//				productBean.setOrigin(rset.getString("origin"));
//				productBean.setProductName(rset.getString("productName"));
//				productBean.setInventory(rset.getInt("inventory"));
//				productBean.setPrice(rset.getInt("price"));
//				productBean.setUnit(rset.getString("unit"));
//				productBean.setProductTypeName(rset.getString("productTypeName"));
//				productBean.setProductIntro(rset.getString("productIntro"));
//				productBean.setFreight(rset.getInt("freight"));
//				productBean.setAddDate(rset.getDate("addDate"));
//				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
//				productBean.setRemoveDate(rset.getDate("removeDate"));
//				// productBean.setProductStatusId(rset.getInt("productStatusId"));
//				productBean.setAddDate(rset.getDate("addDate"));
//				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
//				productBean.setRemoveDate(rset.getDate("removeDate"));
//				productBean.setProductStatusName(rset.getString("productStatusName"));
//
//				result.add(productBean);
//
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return result;
//	}

	private static final String SELECT_BY_PRODUCTTYPENAME = "Select * FROM Product where ProductStatusName='上架'and productTypeName=? Order By ProductID";
	@Override
	public Map<ProductBean, List<ProductPicBean>> selectByType(String type) {
		Map<ProductBean, List<ProductPicBean>> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTTYPENAME);) {

			stmt.setString(1, type);
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<ProductBean, List<ProductPicBean>>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));
				List<ProductPicBean> list = new ArrayList<ProductPicBean>();
				ProductPicDAOJdbc dao = new ProductPicDAOJdbc();
				list = dao.selectByProductId(rset.getInt("productId"));
				result.put(productBean, list);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String SELECT_BY_TYPEANDNAME = "Select * FROM Product where ProductStatusName='上架'and productTypeName=?  and (origin LIKE ? or ProductName like ?) Order By ProductID";
	@Override
	public Map<ProductBean, List<ProductPicBean>> selectByTypeAndName(String type , String keyword) {
		Map<ProductBean, List<ProductPicBean>> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_TYPEANDNAME);) {

			stmt.setString(1, type);
			stmt.setString(2, "%" + keyword + "%");
			stmt.setString(3, "%" + keyword + "%");
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<ProductBean, List<ProductPicBean>>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));
				List<ProductPicBean> list = new ArrayList<ProductPicBean>();
				ProductPicDAOJdbc dao = new ProductPicDAOJdbc();
				list = dao.selectByProductId(rset.getInt("productId"));
				result.put(productBean, list);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String SELECT_BY_SELLER = "select * from Product where ProductStatusName='上架' and SellerID=?";
	@Override
	public Map<ProductBean, List<QnABean>> selectQna(int sellerId) {
		Map<ProductBean, List<QnABean>> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_SELLER);) {

			stmt.setInt(1, sellerId);
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<ProductBean, List<QnABean>>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));
				List<QnABean> list = new ArrayList<QnABean>();
				QnADAOJdbc dao = new QnADAOJdbc();
				list = dao.selectReQna(rset.getInt("productId"));
				result.put(productBean, list);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_SELLERID = "select * from Product where SellerID=?";

	@Override
	public List<ProductBean> selectBySellerId(int sellerId) {
		List<ProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_SELLERID);) {
			stmt.setInt(1, sellerId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<ProductBean>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));

				result.add(productBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_JPID = "SELECT * FROM Product JOIN JPDetail ON Product.ProductID = JPDetail.ProductID WHERE JPID=?";

	@Override
	public Map<JPDetailBean, ProductBean> selectByJpId(int jpId) {
		Map<JPDetailBean, ProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_JPID);) {
			stmt.setInt(1, jpId);
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<JPDetailBean, ProductBean>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				JPDetailBean jpdBean = new JPDetailBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));

				jpdBean.setJpId(rset.getInt("JpID"));
				jpdBean.setProductId(rset.getInt("ProductID"));
				jpdBean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				jpdBean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				jpdBean.setJpMinQEach(rset.getInt("JpMinQEach"));
				jpdBean.setJpPrice(rset.getInt("JpPrice"));
				jpdBean.setJpFreight(rset.getInt("JpFreight"));

				result.put(jpdBean, productBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_ALL = "select * from Product";

	@Override
	public List<ProductBean> select() {
		List<ProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ProductBean>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnit(rset.getString("unit"));
				productBean.setProductTypeName(rset.getString("productTypeName"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				// productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusName(rset.getString("productStatusName"));

				result.add(productBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into Product (sellerId,origin,productName,inventory,price,unit,productTypeName,productIntro,freight,addDate,removeEstDate,removeDate,productStatusName) output inserted.productid values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public ProductBean insert(ProductBean bean) {
		ProductBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (bean != null) {

				stmt.setInt(1, bean.getSellerId());
				stmt.setString(2, bean.getOrigin());
				stmt.setString(3, bean.getProductName());
				stmt.setInt(4, bean.getInventory());
				stmt.setInt(5, bean.getPrice());
				stmt.setString(6, bean.getUnit());
				stmt.setString(7, bean.getProductTypeName());
				stmt.setString(8, bean.getProductIntro());
				stmt.setInt(9, bean.getFreight());

				java.util.Date AddDate = bean.getAddDate();
				if (AddDate != null) {
					long time = AddDate.getTime();
					stmt.setDate(10, new java.sql.Date(time));
				} else {
					stmt.setDate(10, null);
				}

				java.util.Date removeEstDate = bean.getRemoveEstDate();
				if (removeEstDate != null) {
					long time = removeEstDate.getTime();
					stmt.setDate(11, new java.sql.Date(time));
				} else {
					stmt.setDate(11, null);
				}

				java.util.Date removeDate = bean.getRemoveDate();
				if (removeDate != null) {
					long time = removeDate.getTime();
					stmt.setDate(12, new java.sql.Date(time));
				} else {
					stmt.setDate(12, null);
				}
				System.out.println(INSERT);
				// stmt.setInt(13, bean.getProductStatusId());
				stmt.setString(13, bean.getProductStatusName());
				// 新增===========
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					result = new ProductBean();
					result = select(rs.getInt("ProductID"));
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String UPDATE = "update Product set sellerId=?, origin=?, productName=?, inventory=?, price=?, unit=?, productTypeName=?, productIntro=?, freight=?, addDate=?, removeEstDate=?, removeDate=?, productStatusName=? where productId=?";

	@Override
	public ProductBean update(ProductBean bean) {
		ProductBean result = null;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setInt(1, bean.getSellerId());
			stmt.setString(2, bean.getOrigin());
			stmt.setString(3, bean.getProductName());
			stmt.setInt(4, bean.getInventory());
			stmt.setInt(5, bean.getPrice());
			stmt.setString(6, bean.getUnit());
			stmt.setString(7, bean.getProductTypeName());
			stmt.setString(8, bean.getProductIntro());
			stmt.setInt(9, bean.getFreight());

			java.util.Date AddDate = bean.getAddDate();
			if (AddDate != null) {
				long time = AddDate.getTime();
				stmt.setDate(10, new java.sql.Date(time));
			} else {
				stmt.setDate(10, null);
			}

			java.util.Date removeEstDate = bean.getRemoveEstDate();
			if (removeEstDate != null) {
				long time = removeEstDate.getTime();
				stmt.setDate(11, new java.sql.Date(time));
			} else {
				stmt.setDate(11, null);
			}

			java.util.Date removeDate = bean.getRemoveDate();
			if (removeDate != null) {
				long time = removeDate.getTime();
				stmt.setDate(12, new java.sql.Date(time));
			} else {
				stmt.setDate(12, null);
			}
			// System.out.println(INSERT);
			// stmt.setInt(13, bean.getProductStatusId());
			stmt.setString(13, bean.getProductStatusName());
			stmt.setInt(14, bean.getProductId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = bean;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from Product where productId=?";

	@Override
	public boolean delete(int productId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, productId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
