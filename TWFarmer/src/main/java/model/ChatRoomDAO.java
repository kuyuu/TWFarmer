package model;

import java.util.List;

public interface ChatRoomDAO {
	public abstract ChatRoomBean insert(ChatRoomBean chatRoomBean);
	public abstract ChatRoomBean update(ChatRoomBean chatRoomBean);
	public abstract boolean delete(int chatMsgId);
	public abstract ChatRoomBean select(int chatMsgId);
	public abstract List<ChatRoomBean> select();
}
