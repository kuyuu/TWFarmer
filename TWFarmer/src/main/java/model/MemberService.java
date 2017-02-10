package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.dao.MemberDAOJdbc;

public class MemberService {
	
	private DataSource ds = null;
	
	private MemberDAO memberDao = new MemberDAOJdbc();
	public static void main(String[] args) {
		MemberService service = new MemberService();
		List<MemberBean> beans = service.select(null);
		System.out.println("beans="+beans);
	}
	
	public MemberBean login(String account, String password) {
		MemberBean result = null;
		ResultSet rset = null;
		try (Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Member WHERE Account = ? AND Password = ?")) {
			
			stmt.setString(1, account);
			stmt.setString(2, password);
			
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


	public List<MemberBean> select(MemberBean bean) {
		List<MemberBean> result = null;
		if(bean!=null && bean.getMemberId()!=0) {
			MemberBean temp = memberDao.select(bean.getMemberId());
			if(temp!=null) {
				result = new ArrayList<MemberBean>();
				result.add(temp);
			}
		} else {
			result = memberDao.select(); 
		}
		return result;
	}
	public MemberBean insert(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDao.insert(bean);
		}
		return result;
	}
//	public MemberBean update(MemberBean bean) {
//		MemberBean result = null;
//		if(bean!=null) {
//			result = memberDao.update(bean);
//		}
//		return result;
//	}

	public boolean delete(MemberBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = memberDao.delete(bean.getMemberId());
		}
		return result;
	}

}
