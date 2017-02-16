package model;

import java.util.List;

public interface MemberDAO {

	public abstract MemberBean select(int memberId);
	
	////此功能供站內信使用
	public abstract MemberBean selectByAccount(String account);
	//此功能供站內信使用
	
	public abstract List<MemberBean> selectByTypeId(int idType);
	
	public abstract List<MemberBean> select();

	public abstract MemberBean insert(MemberBean bean);
	
	public abstract MemberBean update(
			int memberId,
			String account,
			String password,
			String name,
			String postalCode,
			String district,
			String address,
			String phone,
			String email,
			String idNumber,
			java.util.Date birthDate,
			String gender,
			int idType,
			int rating,
			String memberPic);

	public abstract boolean delete(int memberId);


}