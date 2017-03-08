package model.dao;

import java.util.List;

import model.bean.JointPurchaseBean;

public interface JointPurchaseDAO {

	public abstract JointPurchaseBean select(int  jpId);

	public abstract List<JointPurchaseBean> select();
	
	public abstract List<JointPurchaseBean> selectByPurchaseOk();
	
	public abstract List<JointPurchaseBean> selectByKeyword(String Keyword);
	
	public abstract List<JointPurchaseBean> selectByKnL(String Keyword, String jpLocation);

	public abstract JointPurchaseBean insert(JointPurchaseBean bean);

	public abstract JointPurchaseBean update(JointPurchaseBean bean);
	
	public abstract boolean delete(int  jpId);
}
