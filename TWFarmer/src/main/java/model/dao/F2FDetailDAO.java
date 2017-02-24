package model.dao;

import java.util.List;

import model.bean.F2FDetailBean;

public interface F2FDetailDAO {

	public abstract F2FDetailBean select(int f2fId);

	public abstract List<F2FDetailBean> select();

	public abstract F2FDetailBean insert(F2FDetailBean bean);

	public abstract F2FDetailBean update(F2FDetailBean bean);

	public abstract boolean delete(int f2fId);

	List<F2FDetailBean> selectByJpId(int jpId);



}
