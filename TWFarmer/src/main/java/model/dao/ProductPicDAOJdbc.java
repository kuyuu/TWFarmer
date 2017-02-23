package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.JointPurchaseBean;
import model.ProductBean;
import model.ProductPicBean;
import model.ProductPicDAO;

public class ProductPicDAOJdbc implements ProductPicDAO {
	private DataSource dataSource;

	public ProductPicDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public ProductPicDAOJdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public static void main(String[] args) {
		ProductPicDAO ppdao = new ProductPicDAOJdbc();

		List<ProductPicBean> beans = ppdao.select();
		System.out.println("beans = " + beans);

		ProductPicBean bean = ppdao.select(2401);
		System.out.println("bean = " + bean);

		ProductPicBean insert = new ProductPicBean();
		insert.setProductId(2001);
		ppdao.insert(insert);

		ProductPicBean update = ppdao.select(2403);
		update.setPictureIntro("測試修改資料");
		ppdao.update(update);

		ppdao.delete(2404);

	}

	private static final String SELECT_BY_ID = "select* from ProductPic where ProductPicID=?";

	@Override
	public ProductPicBean select(int productPicId) {
		ProductPicBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			stmt.setInt(1, productPicId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ProductPicBean();
				result.setProductPicId(rset.getInt("ProductPicId"));
				result.setProductId(rset.getInt("ProductId"));
				result.setPictureName(rset.getString("PictureName"));
				result.setPictureIntro(rset.getString("PictureIntro"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	
	private static final String SELECT_PRODUCTID = "select * from ProductPic WHERE ProductID=?";

	@Override
	public List<ProductPicBean> selectByProductId(int productId) {
		List<ProductPicBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCTID);
				) {
			stmt.setInt(1, productId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<ProductPicBean>();
			while (rset.next()) {
				ProductPicBean bean = new ProductPicBean();
				bean.setProductPicId(rset.getInt("ProductPicID"));
				bean.setProductId(rset.getInt("ProductId"));
				bean.setPictureName(rset.getString("PictureName"));
				bean.setPictureIntro(rset.getString("PictureIntro"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_ALL = "select * from ProductPic";

	@Override
	public List<ProductPicBean> select() {
		List<ProductPicBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			result = new ArrayList<ProductPicBean>();
			while (rset.next()) {
				ProductPicBean bean = new ProductPicBean();
				bean.setProductPicId(rset.getInt("ProductPicID"));
				bean.setProductId(rset.getInt("ProductId"));
				bean.setPictureName(rset.getString("PictureName"));
				bean.setPictureIntro(rset.getString("PictureIntro"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into ProductPic (ProductID, PictureName, PictureIntro) output inserted.ProductPicID values (?, ?, ?)";

	@Override
	public ProductPicBean insert(ProductPicBean productPicBean) {
		ProductPicBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (productPicBean != null) {
				stmt.setInt(1, productPicBean.getProductId());
				stmt.setString(2, productPicBean.getPictureName());
				stmt.setString(3, productPicBean.getPictureIntro());
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					result = new ProductPicBean();
					result = select(rs.getInt("ProductPicID"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update ProductPic set ProductID=?, PictureName=?, PictureIntro=? where ProductPicID=?";

	@Override
	public ProductPicBean update(ProductPicBean productPicBean) {
		ProductPicBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, productPicBean.getProductId());
			stmt.setString(2, productPicBean.getPictureName());
			stmt.setString(3, productPicBean.getPictureIntro());
			stmt.setInt(4, productPicBean.getProductPicId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = productPicBean;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from ProductPic where ProductPicId=?";

	@Override
	public boolean delete(int productPicId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, productPicId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private static final String DELETE_BY_PRODUCTID = "delete from ProductPic where ProductPic.ProductID=?";

	@Override
	public boolean deleteByProductId(int productId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PRODUCTID);) {
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
