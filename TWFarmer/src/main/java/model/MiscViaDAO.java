package model;

import java.util.List;

public interface MiscViaDAO {
	
	public abstract MiscViaBean select(int miscViaId);

	public abstract List<MiscViaBean> select();

	public abstract MiscViaBean insert(MiscViaBean bean);

	public abstract MiscViaBean update(MiscViaBean bean);

	public abstract boolean delete(int  miscViaId);


}
