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

import model.QnABean;
import model.QnADAO;

public class QnADAOJdbc implements QnADAO {
	private DataSource dataSource;

	public QnADAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		QnADAO dao = new QnADAOJdbc();

		// 新增
		// QnABean qnABean1 = new QnABean();
		//
		// qnABean1.setQueryId(1001);
		// qnABean1.setProductId(2001);
		// qnABean1.setQnATitle("我想問關於收據的問題...");
		// qnABean1.setQnAContent("請問收據可以開106年的嗎?");
		// qnABean1.setQueryDate(java.sql.Timestamp.valueOf("2016-12-28
		// 08:28:50"));
		// qnABean1.setReQnA("可以喔~~~");
		// qnABean1.setReDate(java.sql.Timestamp.valueOf("2016-12-28
		// 14:28:50"));
		// qnABean1.setReStatus(1);
		//
		// QnABean q = dao.insert(qnABean1);
		// System.out.println(q);

		// 修改
		QnABean qnABean2 = new QnABean();

		qnABean2.setQnAId(5001);
		qnABean2.setQueryId(1001);
		qnABean2.setProductId(2001);
		qnABean2.setQnATitle("我想問關於收據的問題...另外想再請問到貨日");
		qnABean2.setQnAContent("請問收據可以開106年的嗎? 若這星期下訂匯款完成，1月13日前可以到貨嗎?");
		qnABean2.setQueryDate(java.sql.Timestamp.valueOf("2016-12-28 15:28:50"));
		qnABean2.setReQnA("好的，幫您安排");
		qnABean2.setReDate(java.sql.Timestamp.valueOf("2016-12-28 19:38:36"));
		qnABean2.setReStatus(1);

		QnABean q = dao.update(qnABean2);
		System.out.println(q);

		// 刪除
		// dao.delete(5001);

		// 查詢單筆
		// QnABean qnABean3 = dao.select(5001);
		// System.out.print(qnABean3.getQnAId() + ",");
		// System.out.print(qnABean3.getQueryId() + ",");
		// System.out.print(qnABean3.getProductId() + ",");
		// System.out.print(qnABean3.getQnATitle() + ",");
		// System.out.print(qnABean3.getQnAContent() + ",");
		// System.out.print(qnABean3.getQueryDate() + ",");
		// System.out.print(qnABean3.getReQnA() + ",");
		// System.out.print(qnABean3.getReDate()+ ",");
		// System.out.println(qnABean3.getReStatus());

		// 查詢全部
		List<QnABean> beans = dao.select();
		System.out.println("bean=" + beans);
	}

	private static final String INSERT = "insert into QnA (QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus) values (?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public QnABean insert(QnABean qnABean) {
		QnABean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (qnABean != null) {

				stmt.setInt(1, qnABean.getQueryId());

				stmt.setInt(2, qnABean.getProductId());

				stmt.setString(3, qnABean.getQnATitle());

				stmt.setString(4, qnABean.getQnAContent());

				java.util.Date queryDate = qnABean.getQueryDate();
				if (queryDate != null) {
					long time = queryDate.getTime();
					stmt.setTimestamp(5, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(5, null);
				}

				stmt.setString(6, qnABean.getReQnA());

				java.util.Date reDate = qnABean.getReDate();
				if (reDate != null) {
					long time = reDate.getTime();
					stmt.setTimestamp(7, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(7, null);
				}

				stmt.setInt(8, qnABean.getReStatus());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = qnABean;
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String UPDATE = "update QnA set QueryID=?, ProductID=?, QnATitle=?, QnAContent=?, QueryDate=?, ReQnA=?, ReDate=?, ReStatus=? where QnAID=?";

	@Override
	public QnABean update(QnABean qnABean) {
		QnABean result = null;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setInt(1, qnABean.getQueryId());

			stmt.setInt(2, qnABean.getProductId());

			stmt.setString(3, qnABean.getQnATitle());

			stmt.setString(4, qnABean.getQnAContent());

			java.util.Date queryDate = qnABean.getQueryDate();
			if (queryDate != null) {
				long time = queryDate.getTime();
				stmt.setTimestamp(5, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(5, null);
			}

			stmt.setString(6, qnABean.getReQnA());

			java.util.Date reDate = qnABean.getReDate();
			if (reDate != null) {
				long time = reDate.getTime();
				stmt.setTimestamp(7, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(7, null);
			}

			stmt.setInt(8, qnABean.getReStatus());

			stmt.setInt(9, qnABean.getQnAId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = qnABean;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from QnA where QnAID=?";

	@Override
	public boolean delete(int qnAId) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, qnAId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String SELECT_BY_ID = "select * from QnA where QnAID=?";

	@Override
	public QnABean select(int qnAId) {
		QnABean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, qnAId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new QnABean();
				result.setQnAId(rset.getInt("qnAId"));
				result.setQueryId(rset.getInt("queryId"));
				result.setProductId(rset.getInt("productId"));
				result.setQnATitle(rset.getString("qnATitle"));
				result.setQnAContent(rset.getString("qnAContent"));
				result.setQueryDate(rset.getTimestamp("queryDate"));
				result.setReQnA(rset.getString("reQnA"));
				result.setReDate(rset.getTimestamp("reDate"));
				result.setReStatus(rset.getInt("reStatus"));
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

	private static final String SELECT_ALL = "select * from QnA";

	@Override
	public List<QnABean> select() {
		List<QnABean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<QnABean>();
			while (rset.next()) {
				QnABean qnABean = new QnABean();
				qnABean.setQnAId(rset.getInt("qnAId"));
				qnABean.setQueryId(rset.getInt("queryId"));
				qnABean.setProductId(rset.getInt("productId"));
				qnABean.setQnATitle(rset.getString("qnATitle"));
				qnABean.setQnAContent(rset.getString("qnAContent"));
				qnABean.setQueryDate(rset.getTimestamp("queryDate"));
				qnABean.setReQnA(rset.getString("reQnA"));
				qnABean.setReDate(rset.getTimestamp("reDate"));
				qnABean.setReStatus(rset.getInt("reStatus"));

				result.add(qnABean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_PRODUCTID = "select * from QnA where ProductId=?";
	@Override
	public List<QnABean> selectByProductId(int productId) {
		List<QnABean> result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {
			
			stmt.setInt(1, productId);
			rset = stmt.executeQuery();
			result = new ArrayList<QnABean>();
			while (rset.next()) {
				QnABean qnABean = new QnABean();
				qnABean.setQnAId(rset.getInt("qnAId"));
				qnABean.setQueryId(rset.getInt("queryId"));;
				qnABean.setQnATitle(rset.getString("qnATitle"));
				qnABean.setQnAContent(rset.getString("qnAContent"));
				qnABean.setQueryDate(rset.getTimestamp("queryDate"));
				qnABean.setReQnA(rset.getString("reQnA"));
				qnABean.setReDate(rset.getTimestamp("reDate"));
				qnABean.setReStatus(rset.getInt("reStatus"));

				result.add(qnABean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
