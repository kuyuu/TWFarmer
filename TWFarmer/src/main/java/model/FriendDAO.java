package model;

import java.util.List;

public interface FriendDAO {

	public abstract FriendBean select(int memberId, int friendId);
    //CRUD: Create
	public abstract FriendBean insert(FriendBean friendBean);

	//CRUD: Read
	public abstract List<FriendBean> selectByMemberId(int memberId);
	public abstract List<FriendBean> selectByFriendId(int friendId);
	public abstract List<FriendBean> select();

	//CRUD: Update
	public abstract FriendBean update(FriendBean bean);
	
	//CRUD: Delete
	public abstract boolean delete(int memberId, int friendId);
	public abstract boolean deleteByMemberId(int memberId);
	public abstract boolean deleteByFriendId(int friendId);

}