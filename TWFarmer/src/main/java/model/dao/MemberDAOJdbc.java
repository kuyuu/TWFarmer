package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.FarmerBean;
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

	 public static void main(String[] testingIsAChore) {
//======HEAD OF TESTING METHODS 測試方法由此開始======
MemberDAO mdao = new MemberDAOJdbc();
System.out.println("Remove a block comment to begin testing 將各區註解移除即可測試");
// 1. SELECT BY MemberID 以會員編號選擇
		 /*System.out.println("Member going by number 1002 does not imply we have 1002 members~");
			MemberBean memberBean1 =mdao.select(1001);
			System.out.println(memberBean1.toString());*/
		
 //2. SELECT ALL 全部選擇
		/*System.out.println("Ctrl+A is so overrated.Let's select it all with~~codes that are even more overrated.");
		List<MemberBean> beans = mdao.select();
		System.out.println("bean="+beans);*/
			
				
//3. INSERT 新增
	/* System.out.println("Roald Velden is my favorite EDM composer. Maybe he likes Taiwanese vegs too~");
		MemberBean memberBean1 = new MemberBean();
	 	
		memberBean1.setAccount("NetherlandsStyle");
		memberBean1.setPassword("Progressive");
		memberBean1.setName("RoaldOtherVelden");
		memberBean1.setPostalCode("105");
		memberBean1.setDistrict("臺北市松山區");
		memberBean1.setAddress("南京東路4段2號");
		memberBean1.setPhone("0935648167");
		memberBean1.setEmail("PurestHouse@gmail.com");
		memberBean1.setIdNumber("C191245911");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			memberBean1.setBirthDate(sdf.parse("1987-11-11"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		memberBean1.setGender("M");
		memberBean1.setIdType(1);
		memberBean1.setRating(500);
		MemberBean madd = mdao.insert(memberBean1);
		System.out.println(madd);	*/
	 
//4.  UPDATE 修改
		/*System.out.println("Velden thinks it's dangerous to use his own name. There goes modification~");
		MemberBean update = mdao.select(1011);
		update.setAccount("NetherlandsStyle");
		update.setPassword("PHIsMine");
		update.setName("NotRoaldVeldenAtAll");
		update.setPostalCode("105");
		update.setDistrict("臺北市松山區");
		update.setAddress("南京東路4段2號");
		update.setPhone("0935648167");
		update.setEmail("PurestHouse@gmail.com");
		update.setIdNumber("C191245911");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			update.setBirthDate(sdf.parse("1987-11-11"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		update.setGender("M");
		update.setIdType(1);
		update.setRating(500);
		MemberBean rv = mdao.update(update);
		System.out.println(rv);
*/
//5. DELETE: USAGE REQUIRES "INSERT" OR "UPDATE"! 刪除 需在"新增"或"修改"之後測試!
	/*	System.out.println("Velden decides he should delete his own acc and go back to Europe~Asia is dangerous.");
		mdao.delete(1011);	*/
//======END OF TESTING METHODS 測試方法至此結束======
System.out.println("Add the block comments back when you're done 測試完畢請記得恢復註解");
}
	 
	private static final String SELECT_BY_PK = "SELECT * from Member where MemberId=?";
	
@Override
public MemberBean select(int memberId) {
		MemberBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PK);) {
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
				result.setBirthDate(rset.getDate("birthDate"));
				result.setGender(rset.getString("gender"));
				result.setIdType(rset.getInt("idType"));
				result.setRating(rset.getInt("rating"));
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

	
	private static final String SELECT_ALL = "select * from Member";
	@Override
	public List<MemberBean> select() {
		List<MemberBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<MemberBean>();
			while (rset.next()) {
				MemberBean bean = new MemberBean();
				bean.setMemberId(rset.getInt("MemberID"));
				bean.setAccount(rset.getString("account"));
				bean.setPassword(rset.getString("password"));
				bean.setName(rset.getString("name"));
				bean.setPostalCode(rset.getString("postalCode"));
				bean.setDistrict(rset.getString("district"));
				bean.setAddress(rset.getString("address"));
				bean.setPhone(rset.getString("phone"));
				bean.setEmail(rset.getString("email"));
				bean.setIdNumber(rset.getString("idNumber"));
				bean.setBirthDate(rset.getDate("birthDate"));
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

	private static final String INSERT = "INSERT INTO MEMBER (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	@Override
	public MemberBean insert(MemberBean bean) {
		MemberBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				//stmt.setInt(1,bean.getMemberId());
				stmt.setString(1,bean.getAccount());
				stmt.setString(2,bean.getPassword());
				stmt.setString(3,bean.getName());
				stmt.setString(4,bean.getPostalCode());
				stmt.setString(5,bean.getDistrict());
				stmt.setString(6,bean.getAddress());
				stmt.setString(7,bean.getPhone());
				stmt.setString(8,bean.getEmail());
				stmt.setString(9,bean.getIdNumber());
				java.sql.Date d = new java.sql.Date(bean.getBirthDate().getTime());
				stmt.setDate(10, d);
				stmt.setString(11, bean.getGender());
				stmt.setInt(12,bean.getIdType());
				stmt.setInt(13,bean.getRating());
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

	private static final String UPDATE = "UPDATE Member "
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
	public MemberBean update (MemberBean bean) {
		MemberBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			java.sql.Date date = new java.sql.Date(bean.getBirthDate().getTime());
			stmt.setString(1, bean.getAccount());
			stmt.setString(2, bean.getPassword());
			stmt.setString(3, bean.getName());
			stmt.setString(4, bean.getPostalCode());
			stmt.setString(5,bean.getDistrict());
			stmt.setString(6, bean.getAddress());
			stmt.setString(7, bean.getPhone());
			stmt.setString(8, bean.getEmail());
			stmt.setString(9,bean.getIdNumber());
			stmt.setDate(10, date);
			stmt.setString(11, bean.getGender());
			stmt.setInt(12, bean.getIdType());
			stmt.setInt(13,bean.getRating());
			stmt.setInt(14, bean.getMemberId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(bean.getMemberId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_MEMBERID = "delete from Member where MemberId=?";

	@Override
	public boolean delete (int memberId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_MEMBERID);) {
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
