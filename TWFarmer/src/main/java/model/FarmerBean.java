package model;

public class FarmerBean {
	String farmerId;
	int memberId;
String farmerIntro;
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
	/* Referenced from SQL Server's TWFarmer database
	 * MemberID int PRIMARY KEY IDENTITY(1001,1) NOT NULL,
	Account varchar(20) NOT NULL,
	Password varchar(20) NOT NULL,
	Name nvarchar(20) NOT NULL,
	PostalCode char(3),
	District nchar(10),
	Address nvarchar(50) ,
	Phone varchar(20), 
	Email varchar(50) NOT NULL,
	IDNumber varchar(10) NOT NULL,
	BirthDate datetime,
	Gender varchar(1),
	IDType int NOT NULL DEFAULT 1,
	Rating int,*/
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
	

}
