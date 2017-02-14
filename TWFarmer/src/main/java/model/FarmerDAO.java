package model;

import java.util.List;

public interface FarmerDAO {

	public abstract FarmerBean select(String farmerId);
	
	public abstract FarmerBean selectByMemberId(int memberId);

	public abstract List<FarmerBean> select();

	public abstract FarmerBean insert(FarmerBean bean);

	public abstract FarmerBean update(FarmerBean bean);

	public abstract boolean delete(String farmerId);
	
	public abstract boolean deleteByMemberId(int memberId);

}