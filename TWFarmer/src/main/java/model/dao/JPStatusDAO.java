package model.dao;

import java.util.List;

import model.bean.JPStatusBean;

public interface JPStatusDAO {
	
	public abstract JPStatusBean select(int  jpStatusId);

	public abstract List<JPStatusBean> select();

	public abstract JPStatusBean insert(JPStatusBean bean);

	public abstract JPStatusBean update(JPStatusBean bean);

	public abstract boolean delete(int jpStatusId);


}
