package model.dao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;
import model.JPFollowerBean;
import model.JPFollowerDetailBean;
import model.JPFollowerDetailDAO;

public class JPFollowerDetailDAOJdbc implements JPFollowerDetailDAO {
	
	public static void main(String[] args) {
		JPFollowerDetailDAO dao = new JPFollowerDetailDAOJdbc();
		JPFollowerDetailBean select = dao.select(4401, 2001);
		System.out.println(select.getPrice());
		
		List<JPFollowerDetailBean> selects = dao.select();
		for(JPFollowerDetailBean select1 : selects) {
			System.out.println(select1.getQuantity());
		}
		
		JPFollowerDetailBean insert = new JPFollowerDetailBean();
		insert.setJPFollowerId(4402);
		insert.setProductId(2002);
		dao.insert(insert);
		
		dao.delete(4402, 2002);
	}
	
	private static final String SELECT_BY_PK = "from JPFollowerDetailBean where JPFollowerId=? and productId=?";

	@Override
	public JPFollowerDetailBean select(int JPFollowerId, int productId) {
		JPFollowerDetailBean result = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT_BY_PK);
			query.setParameter(0, JPFollowerId);
			query.setParameter(1, productId);
			List<JPFollowerDetailBean> list  = query.list();
			result = list.get(0);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
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
