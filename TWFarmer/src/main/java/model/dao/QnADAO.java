package model.dao;

import java.util.List;

import model.bean.QnABean;

public interface QnADAO {
	public abstract QnABean insert(QnABean qnABean);
	public abstract QnABean update(QnABean qnABean);
	public abstract boolean delete(int qnAId);
	public abstract QnABean select(int qnAId);
	public abstract List<QnABean> select();
	public abstract List<QnABean> selectByProductId(int productId);
	public abstract List<QnABean> selectReQna(int productId);
}

