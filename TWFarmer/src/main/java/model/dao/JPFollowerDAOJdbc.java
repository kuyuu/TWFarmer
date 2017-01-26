package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import model.JPFollowerBean;
import model.JPFollowerDAO;
import model.MemberBean;

public class JPFollowerDAOJdbc implements JPFollowerDAO {

	public static void main(String[] args) {
		JPFollowerDAO jdao = new JPFollowerDAOJdbc();
		JPFollowerBean select = jdao.select(4402);
		System.out.println(select.getRemittanceDate());

		List<JPFollowerBean> selects = jdao.select();
		for (JPFollowerBean select1 : selects) {
			System.out.println(select1.getNotes());
		}

		JPFollowerBean insert = new JPFollowerBean();
		insert.setMemberId(1007);
		insert.setF2FId(4303);
		insert.setJPId(4001);
		jdao.insert(insert);

		JPFollowerBean update = jdao.select(4403);
		update.setTotalPrice(999);
		jdao.update(update);
		
		jdao.delete(4404);

	}

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

}
