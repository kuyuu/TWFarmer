package model;

import java.util.List;

public interface TrackProductDAO {
	public abstract TrackProductBean selectByMemberId(int memberId);
	public abstract TrackProductBean selectByProductId(int productId);
	public abstract List<TrackProductBean> select();
	public abstract TrackProductBean insert(TrackProductBean trackProductBean);
	public abstract TrackProductBean updateByMemberId(TrackProductBean trackProductBean);
	public abstract boolean deleteByMemberId(int memberId);
	public abstract boolean deleteByProductId(int productId);
	
}
