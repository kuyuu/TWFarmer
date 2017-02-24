package model.dao;

import java.util.List;

import model.bean.MsgBean;

public interface MsgDAO {
	public abstract MsgBean insert(MsgBean msgBean);
	public abstract MsgBean update(MsgBean msgBean);
	public abstract boolean delete(int msgId);
	public abstract MsgBean select(int msgId);
	public abstract List<MsgBean> selectByReaderId(int msgReaderId);
	public abstract List<MsgBean> select();
	public abstract List<MsgBean> selectByWriterId(int writerId);
}
