package model;

public class MemberBean {
	int memberId;
	String account;
	String password;
	String name;
	String postalCode;
	String district;
	String address;
	String phone;
	String email;
	String idNumber;
	java.util.Date birthDate;
	String gender;
	int idType;
	int rating;
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof MemberBean)) {
			MemberBean temp = (MemberBean) obj;
			if(this.memberId == temp.memberId) {
				return true;
			}
		}
		return false;
	}
	@Override
	public String toString() {
		return memberId+","+email+","+birthDate;
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

	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public java.util.Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(java.util.Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getIdType() {
		return idType;
	}
	public void setIdType(int idType) {
		this.idType = idType;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
}
