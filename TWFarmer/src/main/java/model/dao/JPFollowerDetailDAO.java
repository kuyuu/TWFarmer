package model.dao;

import java.util.List;

import model.bean.JPFollowerDetailBean;

public interface JPFollowerDetailDAO {
	public abstract JPFollowerDetailBean select(int JPFollowerId, int productId);
	public abstract List<JPFollowerDetailBean> select();
	public abstract JPFollowerDetailBean insert(JPFollowerDetailBean JPFollowerDetailBean);
	public abstract JPFollowerDetailBean update(JPFollowerDetailBean JPFollowerDetailBean);
	public abstract boolean delete(int JPFollowerId, int productId);
	public abstract List<JPFollowerDetailBean> selectByJPFollowerId(int jpFollowerId);
}
