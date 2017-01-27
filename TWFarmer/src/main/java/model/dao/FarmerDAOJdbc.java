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
	public static void main(String[] whyTestWhenYouCanCast) {
//======HEAD OF TESTING METHODS 測試方法由此開始======
FarmerDAO fdao = new FarmerDAOJdbc();
System.out.println("Remove a block comment to begin testing 將各區註解移除即可測試");
// 1. SELECT BY FarmerID 以農民證號選擇
			 /*System.out.println("Our government must be sloppy as shite. Our farmers are epic, though~");
				FarmerBean farmerBean1 =fdao.select("Z000000001");
				System.out.println(farmerBean1.toString());*/
//2. SELECT ALL 全部選擇
/*System.out.println("All farmers have the right to grow!");
		List<FarmerBean> beans = fdao.select();
		System.out.println("bean="+beans);*/
	
//3. INSERT 新增 
		/* System.out.println("Velden wants to try farming. Surely no harm could come from that~");
			FarmerBean farmerBean2 = new FarmerBean();
			farmerBean2.setFarmerId("Z000000010");
			farmerBean2.setMemberId(1021);
			farmerBean2.setFarmerIntro("Velden doesn't just create songs, but crops too.");
			fdao.insert(farmerBean2);*/
		 
//4.  UPDATE 修改
			/*System.out.println("Velden decides to plant apples to keep the doctors away.");
			FarmerBean update2 = fdao.select("Z000000010");
			update2.setFarmerIntro("Velden likes apple. So he plants apples. I think.");
			FarmerBean rv = fdao.update(update2);
			System.out.println(rv);*/
	
//5. DELETE: USAGE REQUIRES "INSERT"! 刪除 需在"新增"之後測試!
			/*System.out.println("Europeans should farm in European soil, not on some tropical rock.");
			fdao.delete("Z000000010");	*/
//======END OF TESTING METHODS 測試方法至此結束======	
System.out.println("Add the block comments back when you're done 測試完畢請記得恢復註解");
	}
	private static final String SELECT_BY_ID =
			"SELECT * FROM Farmer where FarmerId=?";
	@Override
	public FarmerBean select(String farmerId) {
		FarmerBean result = null;
		ResultSet rset = null;
		try(
				Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setString(1, farmerId);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new FarmerBean();
				result.setFarmerId(rset.getString("farmerId"));
				result.setMemberId(rset.getInt("memberId"));
				result.setFarmerIntro(rset.getString("farmerIntro"));
		
				
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
			"select * from farmer";
	@Override
	public List<FarmerBean> select() {
		List<FarmerBean> result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<FarmerBean>();
			while(rset.next()) {
				FarmerBean bean = new FarmerBean();
				bean.setFarmerId(rset.getString("farmerId"));
				bean.setMemberId(rset.getInt("memberId"));
				bean.setFarmerIntro(rset.getString("farmerIntro"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String INSERT =
			"INSERT INTO FARMER (FarmerID,MemberID,FarmerIntro) values (?, ?, ?)";
	@Override
	public FarmerBean insert(FarmerBean bean) {
		FarmerBean result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if(bean!=null) {
				stmt.setString(1, bean.getFarmerId());
				stmt.setInt(2,bean.getMemberId());
				stmt.setString(3,bean.getFarmerIntro());
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
			"UPDATE Farmer "
			+ "SET MemberId=?, "
			+ "FarmerIntro=? "
			+ "WHERE FarmerId=?";
	@Override
	public FarmerBean update(FarmerBean bean) {
		FarmerBean result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, bean.getMemberId());
			stmt.setString(2, bean.getFarmerIntro());
	
			stmt.setString(3, bean.getFarmerId());
			int i = stmt.executeUpdate();
			if(i==1) {
				result = this.select(bean.getFarmerId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String DELETE =
			"DELETE FROM Farmer where FarmerID=?";
	@Override
	public boolean delete(String farmerId) {
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setString(1, farmerId);
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
