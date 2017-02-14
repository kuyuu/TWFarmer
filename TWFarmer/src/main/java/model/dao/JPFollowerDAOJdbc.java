package model.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;
import model.JPFollowerBean;
import model.JPFollowerDAO;
import model.JointPurchaseBean;

public class JPFollowerDAOJdbc implements JPFollowerDAO {

	@Override
	public JPFollowerBean select(int JPFollowerId) {
		JPFollowerBean result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			result = (JPFollowerBean) session.get(JPFollowerBean.class, JPFollowerId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

	private static final String SELECT_ALL = "from JPFollowerBean order by JPFollowerId";

	@Override
	public List<JPFollowerBean> select() {
		List<JPFollowerBean> result = null;
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
	public JPFollowerBean insert(JPFollowerBean JPFollowerBean) {
		JPFollowerBean result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Serializable i = session.save(JPFollowerBean);
			result = (JPFollowerBean) session.get(JPFollowerBean.class, i);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

	@Override
	public JPFollowerBean update(JPFollowerBean JPFollowerBean) {
		JPFollowerBean result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(JPFollowerBean);
			session.getTransaction().commit();
			result = JPFollowerBean;
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}

	@Override
	public boolean delete(int JPFollowerId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		boolean result = false;
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete JPFollowerBean where JPFollowerId=?");
			query.setParameter(0, JPFollowerId);
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

	private static final String SELECT_BY_BUYERID = "from JPFollowerBean jp order by JPFollowerId where jp.MemberId=:id";

	@Override
	public List<JPFollowerBean> selectByBuyerId(int buyerId) {
		List<JPFollowerBean> result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			result = session.createQuery(SELECT_BY_BUYERID).setParameter("id", buyerId).list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return result;
	}
	
	public static void main(String[] args) {
		JPFollowerDAOJdbc dao = new JPFollowerDAOJdbc();
		dao.selectByBuyerId(1030);
	}

}
