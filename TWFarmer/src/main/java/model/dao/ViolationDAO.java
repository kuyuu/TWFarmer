package model.dao;

import java.util.List;

import model.bean.ViolationBean;

public interface ViolationDAO {
	public abstract ViolationBean insert(ViolationBean violationBean);
	public abstract ViolationBean update(ViolationBean violationBean);
	public abstract boolean delete(int ticketId);
	public abstract ViolationBean select(int ticketId);
	public abstract List<ViolationBean> select();
	List<ViolationBean> selectTreat(int ticketStatus);
}
