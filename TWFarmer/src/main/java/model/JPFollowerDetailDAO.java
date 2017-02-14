package model;

import java.util.List;

public interface JPFollowerDetailDAO {
	public abstract JPFollowerDetailBean select(int JPFollowerId, int productId);
	public abstract List<JPFollowerDetailBean> select();
	public abstract JPFollowerDetailBean insert(JPFollowerDetailBean JPFollowerDetailBean);
	public abstract JPFollowerDetailBean update(JPFollowerDetailBean JPFollowerDetailBean);
	public abstract boolean delete(int JPFollowerId, int productId);
	public abstract List<JPFollowerDetailBean> selectByJPFollowerId(int jpFollowerId);
}
