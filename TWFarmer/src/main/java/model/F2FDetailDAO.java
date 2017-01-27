package model;

import java.util.List;

public interface F2FDetailDAO {

	public abstract F2FDetailBean select(int f2fId);

	public abstract List<F2FDetailBean> select();

	public abstract F2FDetailBean insert(F2FDetailBean bean);

	public abstract F2FDetailBean update(F2FDetailBean bean);

	public abstract boolean delete(int f2fId);



}
