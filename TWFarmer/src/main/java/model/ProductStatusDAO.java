package model;

import java.util.List;

public interface ProductStatusDAO {
	public abstract ProductStatusBean select(int ProductStatusID);
	public abstract List<ProductStatusBean> select();
	public abstract ProductStatusBean insert(ProductStatusBean bean);
	public abstract ProductStatusBean update(int ProductStatusID, String ProductStatusName);
	public abstract boolean delete(int ProductStatusID);
}
