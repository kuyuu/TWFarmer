package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ProductBean;
import model.ProductPicBean;
import model.ProductPicDAO;

public class ProductPicDAOJdbc implements ProductPicDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";

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
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);
			{
				stmt.setInt(1, productPicId);
				rset = stmt.executeQuery();
				if (rset.next()) {
					result = new ProductPicBean();
					result.setProductPicId(rset.getInt("ProductPicId"));
					result.setProductId(rset.getInt("ProductId"));
					result.setPicture(rset.getBytes(("Picture")));
					result.setPictureIntro(rset.getString("PictureIntro"));
				}

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

	private static final String SELECT_ALL = "select * from ProductPic";

	@Override
	public List<ProductPicBean> select() {
		List<ProductPicBean> result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			result = new ArrayList<ProductPicBean>();
			while (rset.next()) {
				ProductPicBean bean = new ProductPicBean();
				bean.setProductPicId(rset.getInt("ProductPicID"));
				bean.setProductId(rset.getInt("ProductId"));
				bean.setPicture(rset.getBytes(("Picture")));
				bean.setPictureIntro(rset.getString("PictureIntro"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into ProductPic (ProductID, Picture, PictureIntro) values (?, ?, ?)";

	@Override
	public ProductPicBean insert(ProductPicBean productPicBean) {
		ProductPicBean result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (productPicBean != null) {
				stmt.setInt(1, productPicBean.getProductId());
				stmt.setBytes(2, productPicBean.getPicture());
				stmt.setString(3, productPicBean.getPictureIntro());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = productPicBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update ProductPic set ProductID=?, Picture=?, PictureIntro=? where ProductPicID=?";

	@Override
	public ProductPicBean update(ProductPicBean productPicBean) {
		ProductPicBean result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, productPicBean.getProductId());
			stmt.setBytes(2, productPicBean.getPicture());
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
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
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

}
