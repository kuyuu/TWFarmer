package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.JPDetailBean;
import model.JPDetailDAO;

public class JPDetailDAOjdbc implements JPDetailDAO {

	DataSource dataSource;

	public JPDetailDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public JPDetailDAOjdbc(DataSource dataSource) {
			this.dataSource = dataSource;
		}

	private static final String SELECT_BY_PK = "select * from JPDetail where JPId=? and ProductId=?";

	@Override
	public JPDetailBean select(int jpId, int productId) {
		JPDetailBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PK);) {

			stmt.setInt(1, jpId);
			stmt.setInt(2, productId);

			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new JPDetailBean();
				result.setJpId(rset.getInt("JpID"));
				result.setProductId(rset.getInt("ProductID"));
				result.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				result.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				result.setJpMinQEach(rset.getInt("JpMinQEach"));
				result.setJpPrice(rset.getInt("JpPrice"));
				result.setJpFreight(rset.getInt("JpFreight"));
				result.setJpUnit(rset.getString("JpUnit"));

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

	private static final String SELECT_BY_JPID = "select * from JPDetail where JPId=?";

	@Override
	public List<JPDetailBean> selectByJpId(int jpId) {
		List<JPDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_JPID);) {

			stmt.setInt(1, jpId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<JPDetailBean>();
			while (rset.next()) {
				JPDetailBean bean = new JPDetailBean();
				bean.setJpId(rset.getInt("JpID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				bean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				bean.setJpMinQEach(rset.getInt("JpMinQEach"));
				bean.setJpPrice(rset.getInt("JpPrice"));
				bean.setJpFreight(rset.getInt("JpFreight"));
				bean.setJpUnit(rset.getString("JpUnit"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_PRODUCTID = "select * from JPDetail where ProductID=?";

	@Override
	public List<JPDetailBean> selectByProductId(int productId) {
		List<JPDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {

			stmt.setInt(1, productId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<JPDetailBean>();
			while (rset.next()) {
				JPDetailBean bean = new JPDetailBean();

				bean.setJpId(rset.getInt("JpID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				bean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				bean.setJpMinQEach(rset.getInt("JpMinQEach"));
				bean.setJpPrice(rset.getInt("JpPrice"));
				bean.setJpFreight(rset.getInt("JpFreight"));
				bean.setJpUnit(rset.getString("JpUnit"));
				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_ALL = "select * from JPDetail";

	@Override
	public List<JPDetailBean> select() {
		List<JPDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<JPDetailBean>();
			while (rset.next()) {
				JPDetailBean bean = new JPDetailBean();
				bean.setJpId(rset.getInt("JpID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				bean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				bean.setJpMinQEach(rset.getInt("JpMinQEach"));
				bean.setJpPrice(rset.getInt("JpPrice"));
				bean.setJpFreight(rset.getInt("JpFreight"));
				bean.setJpUnit(rset.getString("JpUnit"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight, JPUnit)  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public JPDetailBean insert(JPDetailBean JPDetailBean) {
		JPDetailBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (JPDetailBean != null) {
				stmt.setInt(1, JPDetailBean.getJpId());
				stmt.setInt(2, JPDetailBean.getProductId());
				stmt.setInt(3, JPDetailBean.getJpPopulationMin());
				stmt.setInt(4, JPDetailBean.getJpPopulationMax());
				stmt.setInt(5, JPDetailBean.getJpMinQEach());
				stmt.setInt(6, JPDetailBean.getJpPrice());
				stmt.setInt(7, JPDetailBean.getJpFreight());
				stmt.setString(8, JPDetailBean.getJpUnit());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = JPDetailBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update JPDetail " + "set JPPopulationMin=?, " + "JPPopulationMax=?, "
			+ "JPMinQEach=?, " + "JPPrice=?, " + "JPFreight=?, " + "JPUnit=? " + "WHERE JPId=? AND ProductId=?";

	@Override
	public JPDetailBean update(JPDetailBean JPDetailBean) {
		JPDetailBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, JPDetailBean.getJpPopulationMin());
			stmt.setInt(2, JPDetailBean.getJpPopulationMax());
			stmt.setInt(3, JPDetailBean.getJpMinQEach());
			stmt.setInt(4, JPDetailBean.getJpPrice());
			stmt.setInt(5, JPDetailBean.getJpFreight());
			stmt.setString(6, JPDetailBean.getJpUnit());
			stmt.setInt(7, JPDetailBean.getJpId());
			stmt.setInt(8, JPDetailBean.getProductId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(JPDetailBean.getJpId(), JPDetailBean.getProductId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_JPID = "delete from JPDetail where JpID=?";

	@Override
	public boolean deleteByJpId(int jpId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_JPID);) {
			stmt.setInt(1, jpId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String DELETE_BY_PRODUCTID = "delete from JPDetail where ProductID=?";

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

	private static final String DELETE_BY_PK = "delete from JPDetail where JPID=? and ProductID=?";

	@Override
	public boolean delete(int jpId, int productId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PK);) {
			stmt.setInt(1, jpId);
			stmt.setInt(2, productId);
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
