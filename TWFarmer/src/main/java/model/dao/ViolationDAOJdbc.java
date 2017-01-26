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

import model.ViolationBean;
import model.ViolationDAO;


public class ViolationDAOJdbc implements ViolationDAO {
	private DataSource dataSource;
	public ViolationDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ViolationDAO dao = new ViolationDAOJdbc();

		// 新增
//		ViolationBean violationBean1 = new ViolationBean();
//
//		violationBean1.setReportedId(1003);
//		violationBean1.setReporterId(1002);
//		violationBean1.setVioTitle("請橘子全爛掉了");
//		violationBean1.setVioContent("橘子送來時竟然全爛掉了，這是我頭一次遇到這種情形，太誇張了吧！請管理員處理一下，謝謝！");
//		violationBean1.setCreateDate(java.sql.Timestamp.valueOf("2017-01-18 19:22:35"));
//		violationBean1.setProcessDate(java.sql.Timestamp.valueOf("2017-01-19 10:10:10"));
//		violationBean1.setTicketResult("經查證屬實，已將該商品下架");
//		violationBean1.setTicketStatue(1);
//
//		ViolationBean q = dao.insert(violationBean1);
//		System.out.println(q);

		// 修改
		ViolationBean violationBean2 = new ViolationBean();

		violationBean2.setTicketId(5101);
		violationBean2.setReportedId(1003);
		violationBean2.setReporterId(1002);
		violationBean2.setVioTitle("請橘子全爛掉了");
		violationBean2.setVioContent("橘子送來時竟然全爛掉了，這是我頭一次遇到這種情形，太誇張了吧！請管理員處理一下，謝謝！ooo");
		violationBean2.setCreateDate(java.sql.Timestamp.valueOf("2017-01-18 19:22:35"));
		violationBean2.setProcessDate(java.sql.Timestamp.valueOf("2017-01-19 10:10:10"));
		violationBean2.setTicketResult("經查證屬實，已將該商品下架");
		violationBean2.setTicketStatue(1);

		ViolationBean q = dao.update(violationBean2);
		System.out.println(q);

		// 刪除
		// dao.delete(5101);

		// 查詢單筆
//		 ViolationBean violationBean3 = dao.select(5101);
//		 System.out.print(violationBean3.getTicketId() + ",");
//		 System.out.print(violationBean3.getReportedId() + ",");
//		 System.out.print(violationBean3.getReporterId() + ",");
//		 System.out.print(violationBean3.getVioTitle() + ",");
//		 System.out.print(violationBean3.getVioContent() + ",");
//		 System.out.print(violationBean3.getCreateDate() + ",");
//		 System.out.print(violationBean3.getProcessDate() + ",");
//		 System.out.print(violationBean3.getTicketResult()+ ",");
//		 System.out.println(violationBean3.getTicketStatue());

		// 查詢全部
//		List<ViolationBean> beans = dao.select();
//		System.out.println("bean=" + beans);

	}

	private static final String INSERT = "insert into Violation (ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue) values (?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public ViolationBean insert(ViolationBean violationBean) {
		ViolationBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (violationBean != null) {

				stmt.setInt(1, violationBean.getReportedId());

				stmt.setInt(2, violationBean.getReporterId());

				stmt.setString(3, violationBean.getVioTitle());

				stmt.setString(4, violationBean.getVioContent());

				java.util.Date createDate = violationBean.getCreateDate();
				if (createDate != null) {
					long time = createDate.getTime();
					stmt.setTimestamp(5, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(5, null);
				}

				java.util.Date processDate = violationBean.getProcessDate();
				if (processDate != null) {
					long time = processDate.getTime();
					stmt.setTimestamp(6, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(6, null);
				}

				stmt.setString(7, violationBean.getTicketResult());

				stmt.setInt(8, violationBean.getTicketStatue());
				
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = violationBean;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String UPDATE = "update Violation set ReportedID=?, ReporterID=?, VioTitle=?, VioContent=?, CreateDate=?, ProcessDate=?, TicketResult=?, TicketStatue=? where TicketID=?";

	@Override
	public ViolationBean update(ViolationBean violationBean) {
		ViolationBean result = null;

		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setInt(1, violationBean.getReportedId());

			stmt.setInt(2, violationBean.getReporterId());

			stmt.setString(3, violationBean.getVioTitle());

			stmt.setString(4, violationBean.getVioContent());

			java.util.Date createDate = violationBean.getCreateDate();
			if (createDate != null) {
				long time = createDate.getTime();
				stmt.setTimestamp(5, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(5, null);
			}

			java.util.Date processDate = violationBean.getProcessDate();
			if (processDate != null) {
				long time = processDate.getTime();
				stmt.setTimestamp(6, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(6, null);
			}

			stmt.setString(7, violationBean.getTicketResult());

			stmt.setInt(8, violationBean.getTicketStatue());

			stmt.setInt(9, violationBean.getTicketId());
			
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = violationBean;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from Violation where TicketID=?";

	@Override
	public boolean delete(int ticketId) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, ticketId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String SELECT_BY_ID = "select * from Violation where TicketID=?";

	@Override
	public ViolationBean select(int ticketId) {
		ViolationBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, ticketId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ViolationBean();
				result.setTicketId(rset.getInt("ticketId"));
				result.setReportedId(rset.getInt("reportedId"));
				result.setReporterId(rset.getInt("reporterId"));
				result.setVioTitle(rset.getString("vioTitle"));
				result.setVioContent(rset.getString("vioContent"));
				result.setCreateDate(rset.getTimestamp("createDate"));
				result.setProcessDate(rset.getTimestamp("processDate"));
				result.setTicketResult(rset.getString("ticketResult"));
				result.setTicketStatue(rset.getInt("ticketStatue"));
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

	private static final String SELECT_ALL = "select * from Violation";

	@Override
	public List<ViolationBean> select() {
		List<ViolationBean> result = null;
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ViolationBean>();
			while (rset.next()) {
				ViolationBean violationBean = new ViolationBean();
				violationBean.setTicketId(rset.getInt("ticketId"));
				violationBean.setReportedId(rset.getInt("reportedId"));
				violationBean.setReporterId(rset.getInt("reporterId"));
				violationBean.setVioTitle(rset.getString("vioTitle"));
				violationBean.setVioContent(rset.getString("vioContent"));
				violationBean.setCreateDate(rset.getTimestamp("createDate"));
				violationBean.setProcessDate(rset.getTimestamp("processDate"));
				violationBean.setTicketResult(rset.getString("ticketResult"));
				violationBean.setTicketStatue(rset.getInt("ticketStatue"));

				result.add(violationBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
