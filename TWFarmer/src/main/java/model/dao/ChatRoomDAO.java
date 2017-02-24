package model.dao;

import java.util.List;

import model.bean.ChatRoomBean;

public interface ChatRoomDAO {
	public abstract ChatRoomBean insert(ChatRoomBean chatRoomBean);
	public abstract ChatRoomBean update(ChatRoomBean chatRoomBean);
	public abstract boolean delete(int chatMsgId);
	public abstract ChatRoomBean select(int chatMsgId);
	public abstract List<ChatRoomBean> select();
}
