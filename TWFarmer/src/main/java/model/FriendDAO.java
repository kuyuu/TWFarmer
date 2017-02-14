package model;

public interface FriendDAO {
	public List<FriendBean> selectByMemberId(int memberId);
	public FriendBean insert(FreindBean friendBean);
	public boolean delete(FreindBean friendBean);
}
