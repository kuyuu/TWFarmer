package model;

import java.util.List;

public interface JointPurchaseDAO {

	public abstract JointPurchaseBean select(int  jpId);

	public abstract List<JointPurchaseBean> select();

	public abstract JointPurchaseBean insert(JointPurchaseBean bean);

	public abstract JointPurchaseBean update(JointPurchaseBean bean);
	
	public abstract boolean delete(int  jpId);

	
}
