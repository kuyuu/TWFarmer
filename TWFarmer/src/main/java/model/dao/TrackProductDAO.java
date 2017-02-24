package model.dao;

import java.util.List;

import model.bean.TrackProductBean;

public interface TrackProductDAO {
	public abstract TrackProductBean select(int memberId, int productId);
	public abstract List<TrackProductBean> selectByMemberId(int memberId);
	public abstract List<TrackProductBean> selectByProductId(int productId);
	public abstract List<TrackProductBean> select();
	public abstract TrackProductBean insert(TrackProductBean trackProductBean);
	public abstract TrackProductBean update(TrackProductBean bean);
	public abstract boolean delete(int memberId, int productId);
	public abstract boolean deleteByMemberId(int memberId);
	public abstract boolean deleteByProductId(int productId);
	
}
