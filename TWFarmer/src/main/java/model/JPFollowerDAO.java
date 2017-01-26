package model;

import java.util.List;

public interface JPFollowerDAO {
	public abstract JPFollowerBean select(int JPFollowerId);
	public abstract List<JPFollowerBean> select();
	public abstract JPFollowerBean insert(JPFollowerBean JPFollowerBean);
	public abstract JPFollowerBean update(JPFollowerBean JPFollowerBean);
	public abstract boolean delete(int JPFollowerId);
}
