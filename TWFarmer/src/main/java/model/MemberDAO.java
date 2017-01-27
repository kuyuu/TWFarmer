package model;

import java.util.List;

public interface MemberDAO {

	public abstract MemberBean select(int memberId);

	public abstract List<MemberBean> select();

	public abstract MemberBean insert(MemberBean bean);

	public abstract MemberBean update(MemberBean bean);

	public abstract boolean delete(int memberId);

}