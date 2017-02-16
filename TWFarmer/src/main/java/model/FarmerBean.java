package model;

public class FarmerBean {
	private String farmerId;
	private int memberId;
	private String farmerIntro;
	private String bank;
	private String bankAccount;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof FarmerBean)) {
			FarmerBean temp = (FarmerBean) obj;
			if(this.farmerId == temp.farmerId) {
				return true;
			}
		}
		return false;
	}
	@Override
	public String toString() {
		return farmerId+","+ memberId +","+farmerIntro;
	}

	public String getFarmerId() {
		return farmerId;
	}
	public void setFarmerId(String farmerId) {
		this.farmerId = farmerId;
	}
	

	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getFarmerIntro() {
		return farmerIntro;
	}
	public void setFarmerIntro(String farmerIntro) {
		this.farmerIntro = farmerIntro;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	

}
