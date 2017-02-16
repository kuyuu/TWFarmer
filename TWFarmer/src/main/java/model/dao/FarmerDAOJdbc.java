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

import model.FarmerBean;
import model.FarmerDAO;

public class FarmerDAOJdbc implements FarmerDAO {
	DataSource dataSource;

	public FarmerDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SELECT_BY_ID = "SELECT * FROM Farmer where FarmerId=?";

	@Override
	public FarmerBean select(String farmerId) {
		FarmerBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setString(1, farmerId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new FarmerBean();
				result.setFarmerId(rset.getString("farmerId"));
				result.setMemberId(rset.getInt("memberId"));
				result.setFarmerIntro(rset.getString("farmerIntro"));
				result.setBank(rset.getString("bank"));
				result.setBankAccount(rset.getString("bankAccount"));
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

	// SELECT BY MEMBER ID START
	private static final String SELECT_BY_MEMBER_ID = "SELECT * FROM Farmer where MemberId=?";

	@Override
	public FarmerBean selectByMemberId(int memberId) {
		FarmerBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MEMBER_ID);) {

			stmt.setInt(1, memberId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new FarmerBean();
				result.setFarmerId(rset.getString("farmerId"));
				result.setMemberId(rset.getInt("memberId"));
				result.setFarmerIntro(rset.getString("farmerIntro"));
				result.setBank(rset.getString("bank"));
				result.setBankAccount(rset.getString("bankAccount"));

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

	// SELECT BY MEMBER ID END
	private static final String SELECT_ALL = "select * from farmer";

	@Override
	public List<FarmerBean> select() {
		List<FarmerBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<FarmerBean>();
			while (rset.next()) {
				FarmerBean bean = new FarmerBean();
				bean.setFarmerId(rset.getString("farmerId"));
				bean.setMemberId(rset.getInt("memberId"));
				bean.setFarmerIntro(rset.getString("farmerIntro"));
				bean.setBank(rset.getString("bank"));
				bean.setBankAccount(rset.getString("bankAccount"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "INSERT INTO FARMER (FarmerID, MemberID,FarmerIntro, Bank, BankAccount) values (?, ?, ?, ?, ?)";

	@Override
	public FarmerBean insert(FarmerBean bean) {
		FarmerBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setString(1, bean.getFarmerId());
				stmt.setInt(2, bean.getMemberId());
				stmt.setString(3, bean.getFarmerIntro());
				stmt.setString(4, bean.getBank());
				stmt.setString(5, bean.getBankAccount());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = bean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "UPDATE Farmer SET MemberId=?, FarmerIntro=?, Bank=?, BankAccount=? WHERE FarmerId=?";

	@Override
	public FarmerBean update(FarmerBean bean) {
		FarmerBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, bean.getMemberId());
			stmt.setString(2, bean.getFarmerIntro());
			stmt.setString(3, bean.getBank());
			stmt.setString(4, bean.getBankAccount());
			stmt.setString(5, bean.getFarmerId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(bean.getFarmerId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "DELETE FROM Farmer where FarmerID=?";

	@Override
	public boolean delete(String farmerId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setString(1, farmerId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String DELETE_BY_MEMBER_ID = "DELETE FROM Farmer where MemberID=?";

	@Override
	public boolean deleteByMemberId(int memberId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_MEMBER_ID);) {
			stmt.setInt(1, memberId);
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
