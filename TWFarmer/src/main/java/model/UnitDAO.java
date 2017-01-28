package model;

import java.util.List;

public interface UnitDAO {
	public abstract UnitBean select(int unitId);
	public abstract List<UnitBean> select();
	public abstract UnitBean insert(UnitBean unitBean);
	public abstract UnitBean update(UnitBean unitBean);
	public abstract boolean delete(int unitId);
}
