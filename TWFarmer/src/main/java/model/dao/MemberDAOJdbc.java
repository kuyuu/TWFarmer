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

import model.MemberBean;
import model.MemberDAO;


public class MemberDAOJdbc implements MemberDAO {

	DataSource dataSource;
	
	public MemberDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
//	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAOJdbc();
//		List<MemberBean> beans = dao.select();
//		System.out.println("bean="+beans);
//		
//		System.out.println(dao.select(1001).getAccount());
//	}
	private static final String SELECT_BY_ID =
			"SELECT * from Member where MemberId=?";
	@Override
	public MemberBean select(int memberId) {
		MemberBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1, memberId);
			rset = stmt.executeQuery();
			if(rset.next()) {
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
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	private static final String SELECT_ALL =
			"select * from member";
	@Override
	public List<MemberBean> select() {
		List<MemberBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<MemberBean>();
			while(rset.next()) {
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
				
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String INSERT =
			"INSERT INTO MEMBER (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IdType, Rating) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	@Override
	public MemberBean insert(MemberBean bean) {
		
		MemberBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if(bean!=null) {
				stmt.setString(1,bean.getAccount());
				stmt.setString(2,bean.getPassword());
				stmt.setString(3,bean.getName());
				stmt.setString(4,bean.getPostalCode());
				stmt.setString(5,bean.getDistrict());
				stmt.setString(6,bean.getAddress());
				stmt.setString(7,bean.getPhone());
				stmt.setString(8,bean.getEmail());
				stmt.setString(9,bean.getIdNumber());

				java.util.Date birthDate = bean.getBirthDate();
				if(birthDate!=null) {
					long time = birthDate.getTime();
					stmt.setDate(10, new java.sql.Date(time));
				} else {
					stmt.setDate(10, null);				
				}
				stmt.setString(11, bean.getGender());
				stmt.setInt(12, bean.getIdType());
				stmt.setInt(13, bean.getRating());
				
				int i = stmt.executeUpdate();
				if(i==1) {
					result = bean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String UPDATE =
			"UPDATE Member "
			+ "SET Account=?, "
			+ "Password=?, "
			+ "Name=?, "
			+ "PostalCode=?, "
			+ "District=?, "
			+ "Address=?, "
			+ "Phone=?, "
			+ "Email=?, "
			+ "IdNumber=?, "
			+ "BirthDate=?, "
			+ "Gender=?, "
			+ "IdType=?, "
			+ "Rating=? "
			+ "WHERE MemberId=?";
	@Override
	public MemberBean update(
			int memberId,
			String account,
			String password,
			String name,
			String postalCode,
			String district,
			String address,
			String phone,
			String email,
			String idNumber,
			java.util.Date birthDate,
			String gender,
			int idType,
			int rating) {
		MemberBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1, account);
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4, postalCode);
			stmt.setString(5,district);
			stmt.setString(6, address);
			stmt.setString(7, phone);
			stmt.setString(8, email);
			stmt.setString(9,idNumber);
			if(birthDate!=null) {
				long time = birthDate.getTime();
				stmt.setDate(10, new java.sql.Date(time));
			} else {
				stmt.setDate(10, null);				
			}
			stmt.setString(11, gender);
			stmt.setInt(12, idType);
			stmt.setInt(13,rating);
			stmt.setInt(14, memberId);
			int i = stmt.executeUpdate();
			if(i==1) {
				result = this.select(memberId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String DELETE =
			"DELETE FROM Member where MemberID=?";
	@Override
	public boolean delete(int memberId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setInt(1, memberId);
			int i = stmt.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
