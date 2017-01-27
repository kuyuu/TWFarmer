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

import model.JPStatusBean;
import model.JPStatusDAO;

public class JPStatusDAOjdbc implements JPStatusDAO {
	
	DataSource dataSource;
	 public JPStatusDAOjdbc() {
		 try {
		 Context ctx = new InitialContext();
		 dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		 } catch (NamingException e) {
		 e.printStackTrace();
		 }
	 }

//	//測試程式
//	public static void main(String[] args) {
//		JPStatusDAO dao = new JPStatusDAOjdbc();
////		//查詢所有資料
//		List<JPStatusBean> beans = dao.select();
//		System.out.println("bean="+beans);
//		//查詢單筆資料
//		JPStatusBean jpStatusSelect = dao.select(4101);
//		 System.out.print(jpStatusSelect.getJpStatusId() + ",");
//		 System.out.print(jpStatusSelect.getJpStatusName() + ",");
		 
		 //新增
//		JPStatusBean jpStatusInsert = new JPStatusBean();
//
//		jpStatusInsert.setJpStatusName("等待匯款中");
//		
//		JPStatusBean jpStatusadd = dao.insert(jpStatusInsert);
//		System.out.println(jpStatusadd);

//		 修改
//		JPStatusBean jpStatusUpdate = new JPStatusBean();
//
//		jpStatusUpdate.setJpStatusId(4107);
//		jpStatusUpdate.setJpStatusName("出貨中");
//		
//		JPStatusBean jpStatusChange = dao.update(jpStatusUpdate);
//		System.out.println(jpStatusChange);

		// 刪除
//		dao.delete(4106);
//		System.out.println("資料已刪除");
//
//	}
	



	
	//查詢
	private static final String SELECT_BY_ID =
			"SELECT * from JPStatus where jpStatusId=?";
	@Override
	public JPStatusBean select(int jpStatusId) {
		JPStatusBean result = null;
		ResultSet rset = null;
		try(
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1,jpStatusId);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new JPStatusBean();
				result.setJpStatusId(rset.getInt("jpStatusId"));
				result.setJpStatusName(rset.getString("jpStatusName"));
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
			"SELECT * from JPStatus";
	@Override
	public List<JPStatusBean> select() {
		List<JPStatusBean> result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<JPStatusBean>();
			while(rset.next()) {
				JPStatusBean bean = new JPStatusBean();
				bean.setJpStatusId(rset.getInt("jpStatusId"));
				bean.setJpStatusName(rset.getString("jpStatusName"));
				
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//新增
	private static final String INSERT =
			"insert into JPStatus ( JPStatusName) VALUES (?)";
	@Override
	public JPStatusBean insert(JPStatusBean bean) {
		JPStatusBean result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if(bean!=null) {
				stmt.setString(1,bean.getJpStatusName());
				
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
	
	//修改
	private static final String UPDATE =
			"update JPStatus "
			+ "set JPStatusName=? "
			+ "where JPStatusId=? ";
	
	@Override
	public JPStatusBean update(JPStatusBean bean) {
		JPStatusBean result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1,bean.getJpStatusName());
			stmt.setInt(2,bean.getJpStatusId());
			int i = stmt.executeUpdate();
			if(i==1) {
				result = bean;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//刪除
	private static final String DELETE =
			"DELETE FROM JPStatus where JPStatusID=?";
	@Override
	public boolean delete(int jpStatusId) {
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setInt(1, jpStatusId);
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
