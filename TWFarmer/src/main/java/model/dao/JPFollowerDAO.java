package model.dao;

import java.util.List;

import model.bean.JPFollowerBean;

public interface JPFollowerDAO {
	public abstract JPFollowerBean select(int JPFollowerId);
	public abstract List<JPFollowerBean> select();
	public abstract JPFollowerBean insert(JPFollowerBean JPFollowerBean);
	public abstract JPFollowerBean update(JPFollowerBean JPFollowerBean);
	public abstract boolean delete(int JPFollowerId);
	public abstract List<JPFollowerBean> selectByBuyerId(int buyerId);
	public abstract List<JPFollowerBean> selectByJpId(int jpId);
}
