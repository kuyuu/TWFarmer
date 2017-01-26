package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "JPFollower")
public class JPFollowerBean implements Serializable {
	private int JPFollowerId;
	private int memberId;
	private int F2FId;
	private int JPId;
	private int totalPrice;
	private int remittanceStatus;
	private Date remittanceDate;
	private int remittance;
	private String remittanceBank;
	private String remittanceAcc;
	private int misc;
	private int splitFreight;
	private String notes;
	
	public JPFollowerBean() {
		
	}
	
	public JPFollowerBean(int jPFollowerId, int memberId, int f2fId, int jPId, int totalPrice, int remittanceStatus,
			Date remittanceDate, int remittance, String remittanceBank, String remittanceAcc, int misc,
			int splitFreight, String notes) {
		super();
		JPFollowerId = jPFollowerId;
		this.memberId = memberId;
		F2FId = f2fId;
		JPId = jPId;
		this.totalPrice = totalPrice;
		this.remittanceStatus = remittanceStatus;
		this.remittanceDate = remittanceDate;
		this.remittance = remittance;
		this.remittanceBank = remittanceBank;
		this.remittanceAcc = remittanceAcc;
		this.misc = misc;
		this.splitFreight = splitFreight;
		this.notes = notes;
	}
	@Id 
	@Column(name = "JPFollowerID") 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	public int getJPFollowerId() {
		return JPFollowerId;
	}
	public void setJPFollowerId(int jPFollowerId) {
		JPFollowerId = jPFollowerId;
	}
	@Column(name = "MemberID")
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	@Column(name = "F2FID")
	public int getF2FId() {
		return F2FId;
	}
	public void setF2FId(int f2fId) {
		F2FId = f2fId;
	}
	@Column(name = "JPID")
	public int getJPId() {
		return JPId;
	}
	public void setJPId(int jPId) {
		JPId = jPId;
	}
	@Column(name = "TotalPrice")
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Column(name = "RemittanceStatus")
	public int getRemittanceStatus() {
		return remittanceStatus;
	}
	public void setRemittanceStatus(int remittanceStatus) {
		this.remittanceStatus = remittanceStatus;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "RemittanceDate")
	public Date getRemittanceDate() {
		return remittanceDate;
	}
	public void setRemittanceDate(Date remittanceDate) {
		this.remittanceDate = remittanceDate;
	}
	@Column(name = "Remittance")
	public int getRemittance() {
		return remittance;
	}
	public void setRemittance(int remittance) {
		this.remittance = remittance;
	}
	@Column(name = "RemittanceBank")
	public String getRemittanceBank() {
		return remittanceBank;
	}
	public void setRemittanceBank(String remittanceBank) {
		this.remittanceBank = remittanceBank;
	}
	@Column(name = "RemittanceAcc")
	public String getRemittanceAcc() {
		return remittanceAcc;
	}
	public void setRemittanceAcc(String remittanceAcc) {
		this.remittanceAcc = remittanceAcc;
	}
	@Column(name = "Misc")
	public int getMisc() {
		return misc;
	}
	public void setMisc(int misc) {
		this.misc = misc;
	}
	@Column(name = "SplitFreight")
	public int getSplitFreight() {
		return splitFreight;
	}
	public void setSplitFreight(int splitFreight) {
		this.splitFreight = splitFreight;
	}
	@Column(name = "Notes")
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
