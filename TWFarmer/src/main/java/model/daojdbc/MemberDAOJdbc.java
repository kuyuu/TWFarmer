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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.FarmerBean;
import model.bean.MemberBean;
import model.dao.MemberDAO;

public class MemberDAOJdbc implements MemberDAO {
	private DataSource dataSource;

	public MemberDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}


	public MemberDAOJdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// public static void main(String[] args) {
	// MemberDAO dao = new MemberDAOJdbc();
	// List<MemberBean> beans = dao.select();
	// System.out.println("bean=" + beans);
	//
	// System.out.println(dao.select(1001).getAccount());
	// }
	private static final String SELECT_BY_ID = "SELECT * from Member where MemberId=?";

	@Override
	public MemberBean select(int memberId) {
		MemberBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, memberId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new MemberBean();
				result.setMemberId(rset.getInt("memberId"));
				result.setAccount(rset.getString("account"));
				result.setPassword(rset.getString("password"));
				result.setName(rset.getString("name"));
				result.setPostalCode(rset.getString("postalCode"));
				result.setDistrict(rset.getString("district"));
				result.setAddress(rset.getString("address"));
				result.setPhone(rset.getString("phone"));
				result.setEmail(rset.getString("email"));
				result.setIdNumber(rset.getString("idNumber"));
				result.setBirthDate(rset.getDate("BirthDate"));
				result.setGender(rset.getString("gender"));
				result.setIdType(rset.getInt("idType"));
				result.setRating(rset.getInt("rating"));
				result.setMemberPic(rset.getString("memberPic"));
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

	private static final String SELECT_ALL = "select * from member";

	@Override
	public List<MemberBean> select() {
		List<MemberBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<MemberBean>();
			while (rset.next()) {
				MemberBean bean = new MemberBean();
				bean.setMemberId(rset.getInt("memberId"));
				bean.setAccount(rset.getString("account"));
				bean.setPassword(rset.getString("password"));
				bean.setName(rset.getString("name"));
				bean.setPostalCode(rset.getString("postalCode"));
				bean.setDistrict(rset.getString("district"));
				bean.setAddress(rset.getString("address"));
				bean.setPhone(rset.getString("phone"));
				bean.setEmail(rset.getString("email"));
				bean.setIdNumber(rset.getString("idNumber"));
				bean.setBirthDate(rset.getDate("BirthDate"));
				bean.setGender(rset.getString("gender"));
				bean.setIdType(rset.getInt("idType"));
				bean.setRating(rset.getInt("rating"));
				bean.setMemberPic(rset.getString("memberPic"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "INSERT INTO MEMBER (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IdType, Rating, MemberPic) OUTPUT INSERTED.MemberID values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public MemberBean insert(MemberBean bean) {

		MemberBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setString(1, bean.getAccount());
				stmt.setString(2, bean.getPassword());
				stmt.setString(3, bean.getName());
				stmt.setString(4, bean.getPostalCode());
				stmt.setString(5, bean.getDistrict());
				stmt.setString(6, bean.getAddress());
				stmt.setString(7, bean.getPhone());
				stmt.setString(8, bean.getEmail());
				stmt.setString(9, bean.getIdNumber());

				java.util.Date birthDate = bean.getBirthDate();
				if (birthDate != null) {
					long time = birthDate.getTime();
					stmt.setDate(10, new java.sql.Date(time));
				} else {
					stmt.setDate(10, null);
				}
				stmt.setString(11, bean.getGender());
				stmt.setInt(12, bean.getIdType());
				stmt.setInt(13, bean.getRating());
				stmt.setString(14, bean.getMemberPic());
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					result = new MemberBean();
					result = select(rs.getInt("MemberId"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "UPDATE Member " + "SET Account=?, " + "Password=?, " + "Name=?, "
			+ "PostalCode=?, " + "District=?, " + "Address=?, " + "Phone=?, " + "Email=?, " + "IdNumber=?, "
			+ "BirthDate=?, " + "Gender=?, " + "IdType=?, " + "Rating=?, " + "MemberPic=? " + "WHERE MemberId=?";

	@Override
	public MemberBean update(MemberBean bean) {
		MemberBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1, bean.getAccount());
			stmt.setString(2, bean.getPassword());
			stmt.setString(3, bean.getName());
			stmt.setString(4, bean.getPostalCode());
			stmt.setString(5, bean.getDistrict());
			stmt.setString(6, bean.getAddress());
			stmt.setString(7, bean.getPhone());
			stmt.setString(8, bean.getEmail());
			stmt.setString(9, bean.getIdNumber());

			java.util.Date birthDate = bean.getBirthDate();
			if (birthDate != null) {
				long time = birthDate.getTime();
				stmt.setDate(10, new java.sql.Date(time));
			} else {
				stmt.setDate(10, null);
			}
			stmt.setString(11, bean.getGender());
			stmt.setInt(12, bean.getIdType());
			stmt.setInt(13, bean.getRating());
			stmt.setString(14, bean.getMemberPic());
			stmt.setInt(15, bean.getMemberId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(bean.getMemberId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public MemberBean update2(MemberBean bean) {
		MemberBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1, bean.getAccount());
			stmt.setString(2, bean.getPassword());
			stmt.setString(3, bean.getName());
			stmt.setString(4, bean.getPostalCode());
			stmt.setString(5, bean.getDistrict());
			stmt.setString(6, bean.getAddress());
			stmt.setString(7, bean.getPhone());
			stmt.setString(8, bean.getEmail());
			stmt.setString(9, bean.getIdNumber());

			java.util.Date birthDate = bean.getBirthDate();
			if (birthDate != null) {
				long time = birthDate.getTime();
				stmt.setDate(10, new java.sql.Date(time));
			} else {
				stmt.setDate(10, null);
			}
			stmt.setString(11, bean.getGender());
			stmt.setInt(12, bean.getIdType());
			stmt.setInt(13, bean.getRating());
			stmt.setString(14, bean.getMemberPic());
			stmt.setInt(15, bean.getMemberId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = bean;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "DELETE FROM Member where MemberID=?";

	@Override
	public boolean delete(int memberId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
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

	private static final String SELECT_BY_TYPEID = "SELECT * from Member where IdType=?";

	@Override
	public List<MemberBean> selectByTypeId(int idType) {
		List<MemberBean> result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_TYPEID);) {
			stmt.setInt(1, idType);
			rset = stmt.executeQuery();
			result = new ArrayList<MemberBean>();
			while (rset.next()) {
				MemberBean bean = new MemberBean();
				bean.setMemberId(rset.getInt("memberId"));
				bean.setAccount(rset.getString("account"));
				bean.setPassword(rset.getString("password"));
				bean.setName(rset.getString("name"));
				bean.setPostalCode(rset.getString("postalCode"));
				bean.setDistrict(rset.getString("district"));
				bean.setAddress(rset.getString("address"));
				bean.setPhone(rset.getString("phone"));
				bean.setEmail(rset.getString("email"));
				bean.setIdNumber(rset.getString("idNumber"));
				bean.setBirthDate(rset.getDate("BirthDate"));
				bean.setGender(rset.getString("gender"));
				bean.setRating(rset.getInt("rating"));
				bean.setMemberPic(rset.getString("memberPic"));

				result.add(bean);
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

	public MemberBean findByAccountAndPassword(String account, String password) {
		MemberBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn
						.prepareStatement("SELECT * FROM Member WHERE Account = ? AND Password = ?")) {

			stmt.setString(1, account);
			stmt.setString(2, password);

			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new MemberBean();
				result.setMemberId(rset.getInt("memberId"));
				result.setAccount(rset.getString("account"));
				result.setPassword(rset.getString("password"));
				result.setName(rset.getString("name"));
				result.setPostalCode(rset.getString("postalCode"));
				result.setDistrict(rset.getString("district"));
				result.setAddress(rset.getString("address"));
				result.setPhone(rset.getString("phone"));
				result.setEmail(rset.getString("email"));
				result.setIdNumber(rset.getString("idNumber"));
				result.setBirthDate(rset.getDate("BirthDate"));
				result.setGender(rset.getString("gender"));
				result.setIdType(rset.getInt("idType"));
				result.setRating(rset.getInt("rating"));
				result.setMemberPic(rset.getString("memberPic"));
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

	// 民國106年02月15日 以下 新增一方法供站內信功能使用 --小巫
	private static final String SELECT_BY_ACCOUNT = "SELECT * from Member where Account=?";

	@Override
	public MemberBean selectByAccount(String account) {
		MemberBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ACCOUNT);) {

			stmt.setString(1, account);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new MemberBean();
				result.setMemberId(rset.getInt("memberId"));
				result.setAccount(rset.getString("account"));
				result.setPassword(rset.getString("password"));
				result.setName(rset.getString("name"));
				result.setPostalCode(rset.getString("postalCode"));
				result.setDistrict(rset.getString("district"));
				result.setAddress(rset.getString("address"));
				result.setPhone(rset.getString("phone"));
				result.setEmail(rset.getString("email"));
				result.setIdNumber(rset.getString("idNumber"));
				result.setBirthDate(rset.getDate("BirthDate"));
				result.setGender(rset.getString("gender"));
				result.setIdType(rset.getInt("idType"));
				result.setRating(rset.getInt("rating"));
				result.setMemberPic(rset.getString("memberPic"));
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
	// //民國106年02月15日 方法至以上為止
	//
	// //民國106年02月17日 以下 新增一方法供會員搜尋功能使用 --小巫
	// private static final String SELECT_BY_ACCNAME = "Select * FROM Member
	// Where account LIKE ? or name LIKE ?";
	// @Override
	// public List<MemberBean> selectByAccName(String keyword) {
	// List<MemberBean> result = null;
	// try (Connection conn = dataSource.getConnection();
	// PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ACCNAME);
	// ){
	// //stmt.setString(1, "%" + keyword + "%");
	// //stmt.setString(2, "%" + keyword + "%");
	//
	// stmt.setString(1, keyword);
	// stmt.setString(2, keyword);
	//
	// ResultSet rset = stmt.executeQuery();
	// result = new ArrayList<MemberBean>();
	// while(rset.next()) {
	// MemberBean bean = new MemberBean();
	// bean.setMemberId(rset.getInt("memberId"));
	// bean.setAccount(rset.getString("account"));
	// bean.setPassword(rset.getString("password"));
	// bean.setName(rset.getString("name"));
	// bean.setPostalCode(rset.getString("postalCode"));
	// bean.setDistrict(rset.getString("district"));
	// bean.setAddress(rset.getString("address"));
	// bean.setPhone(rset.getString("phone"));
	// bean.setEmail(rset.getString("email"));
	// bean.setIdNumber(rset.getString("idNumber"));
	// bean.setBirthDate(rset.getDate("BirthDate"));
	// bean.setGender(rset.getString("gender"));
	// bean.setIdType(rset.getInt("idType"));
	// bean.setRating(rset.getInt("rating"));
	// bean.setMemberPic(rset.getString("memberPic"));
	// result.add(bean);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// return result;
	// }
	//
	// private static final String SELECT_BY_ACCNAME_CHEAT = "Select * FROM
	// Member";
	// @Override
	// public List<MemberBean> selectByAccNameCheat() {
	// List<MemberBean> result = null;
	// try (Connection conn = dataSource.getConnection();
	// PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ACCNAME_CHEAT);
	// ){
	// //stmt.setString(1, "%" + keyword + "%");
	// //stmt.setString(2, "%" + keyword + "%");
	//
	// ResultSet rset = stmt.executeQuery();
	// result = new ArrayList<MemberBean>();
	// while(rset.next()) {
	// MemberBean bean = new MemberBean();
	// bean.setMemberId(rset.getInt("memberId"));
	// bean.setAccount(rset.getString("account"));
	// bean.setPassword(rset.getString("password"));
	// bean.setName(rset.getString("name"));
	// bean.setPostalCode(rset.getString("postalCode"));
	// bean.setDistrict(rset.getString("district"));
	// bean.setAddress(rset.getString("address"));
	// bean.setPhone(rset.getString("phone"));
	// bean.setEmail(rset.getString("email"));
	// bean.setIdNumber(rset.getString("idNumber"));
	// bean.setBirthDate(rset.getDate("BirthDate"));
	// bean.setGender(rset.getString("gender"));
	// bean.setIdType(rset.getInt("idType"));
	// bean.setRating(rset.getInt("rating"));
	// bean.setMemberPic(rset.getString("memberPic"));
	// result.add(bean);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// return result;
	// }
	//
	// private static final String SELECT_MEMBERID2 = "select * from ProductPic
	// WHERE ProductID=?";
	//
	// @Override
	// public List<MemberBean> selectById2(int memberId) {
	// List<MemberBean> result = null;
	// try (Connection conn = dataSource.getConnection();
	// PreparedStatement stmt = conn.prepareStatement(SELECT_MEMBERID2);
	// ) {
	// stmt.setInt(1, memberId);
	// ResultSet rset = stmt.executeQuery();
	// result = new ArrayList<MemberBean>();
	// while (rset.next()) {
	// MemberBean memberBean = new MemberBean();
	// memberBean.setMemberId(rset.getInt("memberId"));
	// memberBean.setAccount(rset.getString("account"));
	// memberBean.setPassword(rset.getString("password"));
	// memberBean.setName(rset.getString("name"));
	// memberBean.setPostalCode(rset.getString("postalCode"));
	// memberBean.setDistrict(rset.getString("district"));
	// memberBean.setAddress(rset.getString("address"));
	// memberBean.setPhone(rset.getString("phone"));
	// memberBean.setEmail(rset.getString("email"));
	// memberBean.setIdNumber(rset.getString("idNumber"));
	// memberBean.setBirthDate(rset.getDate("BirthDate"));
	// memberBean.setGender(rset.getString("gender"));
	// memberBean.setRating(rset.getInt("rating"));
	// memberBean.setMemberPic(rset.getString("memberPic"));
	// result.add(memberBean);
	// }
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// return result;
	// }
	//
	//
	// @Override
	// public List<MemberBean> selectByFriendId(List<FriendBean> friendList) {
	// // TODO Auto-generated method stub
	// return null;
	// }
	//
	// //民國106年02月17日 會員搜尋方法至以上為止

	@Override
	public Map<MemberBean, FarmerBean> selectByType(int idType) {
		Map<MemberBean, FarmerBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_TYPEID);) {

			stmt.setInt(1, idType);
			ResultSet rset = stmt.executeQuery();
			result = new HashMap<MemberBean, FarmerBean>();
			while (rset.next()) {
				MemberBean memberBean = new MemberBean();
				memberBean.setMemberId(rset.getInt("memberId"));
				memberBean.setAccount(rset.getString("account"));
				memberBean.setPassword(rset.getString("password"));
				memberBean.setName(rset.getString("name"));
				memberBean.setPostalCode(rset.getString("postalCode"));
				memberBean.setDistrict(rset.getString("district"));
				memberBean.setAddress(rset.getString("address"));
				memberBean.setPhone(rset.getString("phone"));
				memberBean.setEmail(rset.getString("email"));
				memberBean.setIdNumber(rset.getString("idNumber"));
				memberBean.setBirthDate(rset.getDate("BirthDate"));
				memberBean.setGender(rset.getString("gender"));
				memberBean.setIdType(rset.getInt("idType"));
				memberBean.setRating(rset.getInt("rating"));
				memberBean.setMemberPic(rset.getString("memberPic"));
				FarmerBean farmerBean = new FarmerBean();
				FarmerDAOJdbc dao = new FarmerDAOJdbc();
				farmerBean = dao.selectByMemberId(rset.getInt("memberId"));
				result.put(memberBean, farmerBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
