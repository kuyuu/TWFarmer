package model;

import java.util.List;

public interface FriendDAO {
	public abstract List<FriendBean> selectWhiteByMemberId(int memberId);
	public abstract List<FriendBean> selectBlackByMemberId(int memberId);
	public abstract FriendBean insert(FriendBean friendBean);
	public abstract FriendBean select(int memberId, int friendId);
	public abstract FriendBean update(FriendBean bean);
}