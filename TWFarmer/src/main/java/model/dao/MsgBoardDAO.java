package model.dao;

import java.util.List;

import model.bean.MsgBoardBean;

public interface MsgBoardDAO {

	public abstract List<MsgBoardBean> selectByJpId(int jpId);
	public abstract MsgBoardBean insert(MsgBoardBean msgBoardBean);

}
