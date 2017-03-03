package model.daojdbc;

import java.io.Serializable;
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

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import model.bean.JPFollowerDetailBean;
import model.bean.ProductPicBean;
import model.dao.JPFollowerDetailDAO;

public class JPFollowerDetailDAOJdbc implements JPFollowerDetailDAO {

	DataSource dataSource;

	public JPFollowerDetailDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public JPFollowerDetailDAOJdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private static final String SELECT_BY_PK = "SELECT * from JPFollowerDetail where JPFollowerID=? and ProductID=?";

	@Override
	public JPFollowerDetailBean select(int JPFollowerId, int productId) {
		JPFollowerDetailBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PK);) {
			stmt.setInt(1, JPFollowerId);
			stmt.setInt(2, productId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new JPFollowerDetailBean();
				result.setJPFollowerId(rset.getInt("JPFollowerId"));
				result.setProductId(rset.getInt("ProductId"));
				result.setQuantity(rset.getInt("Quantity"));
				result.setPrice(rset.getInt("Price"));
				result.setFreight(rset.getInt("Freight"));
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

	// @Override
	// public JPFollowerDetailBean select(int JPFollowerId, int productId) {
	// JPFollowerDetailBean result = null;
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// Query query = session.createQuery(SELECT_BY_PK);
	// query.setParameter(0, JPFollowerId);
	// query.setParameter(1, productId);
	// // result = session.createQuery(SELECT_JPFId).setParameter(0,
	// // productId).list();
	// // for (JPFollowerDetailBean aaa : list) {
	// // System.out.println(aaa.getJPFollowerId() + ":" +
	// // aaa.getProductId());
	// // }
	// // result = list.get(0);
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	// return result;
	// }

	private static final String SELECT_JPFId = "from JPFollowerDetailBean where JPFollowerId=?";

	@Override
	public List<JPFollowerDetailBean> selectByJPFollowerId(int jpFollowerId) {
		List<JPFollowerDetailBean> result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			result = session.createQuery(SELECT_JPFId).setParameter(0, jpFollowerId).list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}
	
	private static final String SELECT_BY_JPID = "SELECT a.JPFollowerID, ProductID, Quantity, Price, Freight FROM (SELECT JPFollowerID FROM JPFollower WHERE JPID=?)a JOIN JPFollowerDetail jpfd ON a.JPFollowerID=jpfd.JPFollowerID ";

	public List<JPFollowerDetailBean> selectByJpId(int jpId) {
		List<JPFollowerDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_JPID);
				) {
			stmt.setInt(1, jpId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<JPFollowerDetailBean>();
			while (rset.next()) {
				JPFollowerDetailBean bean = new JPFollowerDetailBean();
				bean.setJPFollowerId(rset.getInt("JPFollowerId"));;
				bean.setProductId(rset.getInt("ProductId"));
				bean.setQuantity(rset.getInt("Quantity"));
				bean.setPrice(rset.getInt("Price"));
				bean.setFreight(rset.getInt("Freight"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_ALL = "from JPFollowerDetailBean order by JPFollowerId";

	@Override
	public List<JPFollowerDetailBean> select() {
		List<JPFollowerDetailBean> result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT_ALL);
			result = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

	@Override
	public JPFollowerDetailBean insert(JPFollowerDetailBean JPFollowerDetailBean) {
		JPFollowerDetailBean result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(JPFollowerDetailBean);
			Serializable i = session.save(JPFollowerDetailBean);
			result = (JPFollowerDetailBean) session.get(JPFollowerDetailBean.class, i);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

	@Override
	public JPFollowerDetailBean update(JPFollowerDetailBean JPFollowerDetailBean) {
		JPFollowerDetailBean result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(JPFollowerDetailBean);
			session.getTransaction().commit();
			result = JPFollowerDetailBean;
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

	@Override
	public boolean delete(int JPFollowerId, int productId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		boolean result = false;
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete JPFollowerDetailBean where JPFollowerId=? and productId=?");
			query.setParameter(0, JPFollowerId);
			query.setParameter(1, productId);
			int i = query.executeUpdate();
			if (i == 1) {
				result = true;
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

}
