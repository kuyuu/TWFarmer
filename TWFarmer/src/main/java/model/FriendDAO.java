package model;

import java.util.List;

public interface FriendDAO {
	public abstract List<FriendBean> selectWhiteByMemberId(int memberId);

	List<FriendBean> selectBlackByMemberId(int memberId);

	FriendBean insert(FriendBean friendBean);
}