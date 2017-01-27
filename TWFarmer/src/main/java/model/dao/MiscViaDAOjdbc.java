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

import model.MiscViaBean;
import model.MiscViaDAO;

public class MiscViaDAOjdbc implements MiscViaDAO {
	
	DataSource dataSource;
	 public MiscViaDAOjdbc() {
		 try {
		 Context ctx = new InitialContext();
		 dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		 } catch (NamingException e) {
		 e.printStackTrace();
		 }
	 }

//		//測試程式
//		public static void main(String[] args) {
//			MiscViaDAO dao = new MiscViaDAOjdbc();
////			//查詢所有資料
//			List<MiscViaBean> beans = dao.select();
//			System.out.println("bean="+beans);
//			//查詢單筆資料
//			MiscViaBean miscViaSelect = dao.select(4201);
//			 System.out.print(miscViaSelect.getMiscViaId() + ",");
//			 System.out.print(miscViaSelect.getMiscViaWay() + ",");
			 
			 //新增
//			MiscViaBean miscViaInsert = new MiscViaBean();
//	
//			miscViaInsert.setMiscViaWay("自行協調");
//			
//			MiscViaBean miscViaadd = dao.insert(miscViaInsert);
//			System.out.println(miscViaadd);

//			 修改
//			MiscViaBean miscViaUpdate = new MiscViaBean();
//
//			miscViaUpdate.setMiscViaId(4203);
//			miscViaUpdate.setMiscViaWay("依比例");
//			
//			MiscViaBean miscViaChange = dao.update(miscViaUpdate);
//			System.out.println(miscViaChange);
//
//			// 刪除
//			dao.delete(4204);
//			System.out.println("資料已刪除");
//
//	}
	
	//查詢
	private static final String SELECT_BY_ID =
			"SELECT * from MiscVia where MiscViaId=?";
	@Override
	public MiscViaBean select(int miscViaId) {
		MiscViaBean result = null;
		ResultSet rset = null;
		try(
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1, miscViaId);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new MiscViaBean();
				result.setMiscViaId(rset.getInt("miscViaId"));
				result.setMiscViaWay(rset.getString("miscViaWay"));
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
			"SELECT * from MiscVia";
	@Override
	public List<MiscViaBean> select() {
		List<MiscViaBean> result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<MiscViaBean>();
			while(rset.next()) {
				MiscViaBean bean = new MiscViaBean();
				bean.setMiscViaId(rset.getInt("miscViaId"));
				bean.setMiscViaWay(rset.getString("miscViaWay"));
				
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//新增
	private static final String INSERT =
			"insert into MiscVia (MiscViaWay) VALUES (?)";
	@Override
	public MiscViaBean insert(MiscViaBean bean) {
		MiscViaBean result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if(bean!=null) {
				stmt.setString(1,bean.getMiscViaWay());

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
			"UPDATE MiscVia "
			+ "SET MiscViaWay=? "
			+ "WHERE MiscViaId=?";
	@Override
	public MiscViaBean update(MiscViaBean bean) {
		MiscViaBean result = null;
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1, bean.getMiscViaWay());
			stmt.setInt(2, bean.getMiscViaId());
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
			"DELETE FROM MiscVia where MiscViaId=?";
	@Override
	public boolean delete(int miscViaId) {
		try(
				Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setInt(1, miscViaId);
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
