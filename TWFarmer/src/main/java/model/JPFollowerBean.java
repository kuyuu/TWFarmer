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
import javax.persistence.Transient;

import model.dao.JPStatusDAOjdbc;
import model.dao.JointPurchaseDAOjdbc;

@Entity
@Table(name = "JPFollower")
public class JPFollowerBean implements Serializable {
	private Integer JPFollowerId;
	private Integer memberId;
	private Integer F2FId;
	private Integer JPId;
	private Integer totalPrice;
	private Integer remittanceStatus;
	private Date remittanceDate;
	private Integer remittance;
	private String remittanceBank;
	private String remittanceAcc;
	private Integer misc;
	private Integer splitFreight;
	private String notes;
	private String jpName;
	private Date initDate;
	private Date endDate;
	private Integer jpStatusId;
	private String jpStatusName;
	JointPurchaseDAOjdbc dao = new JointPurchaseDAOjdbc();
	JPStatusDAOjdbc dao2 = new JPStatusDAOjdbc();

	public JPFollowerBean() {

	}

	@Id
	@Column(name = "JPFollowerID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getJPFollowerId() {
		return JPFollowerId;
	}

	public void setJPFollowerId(Integer jPFollowerId) {
		JPFollowerId = jPFollowerId;
	}

	@Column(name = "MemberID")
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "F2FID")
	public Integer getF2FId() {
		return F2FId;
	}

	public void setF2FId(Integer f2fId) {
		F2FId = f2fId;
	}

	@Column(name = "JPID")
	public Integer getJPId() {
		return JPId;
	}

	public void setJPId(Integer jPId) {
		JPId = jPId;
	}

	@Column(name = "TotalPrice")
	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "RemittanceStatus")
	public Integer getRemittanceStatus() {
		return remittanceStatus;
	}

	public void setRemittanceStatus(Integer remittanceStatus) {
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
	public Integer getRemittance() {
		return remittance;
	}

	public void setRemittance(Integer remittance) {
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
	public Integer getMisc() {
		return misc;
	}

	public void setMisc(Integer misc) {
		this.misc = misc;
	}

	@Column(name = "SplitFreight")
	public Integer getSplitFreight() {
		return splitFreight;
	}

	public void setSplitFreight(Integer splitFreight) {
		this.splitFreight = splitFreight;
	}

	@Column(name = "Notes")
	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@Transient
	public String getJpName() {
		return dao.select(JPId).getJpName();
	}

	@Transient
	public void setJpName(String jpName) {
		this.jpName = jpName;
	}

	@Transient
	public Date getInitDate() {
		return new Date(dao.select(JPId).getInitDate().getTime());
	}

	@Transient
	public void setInitDate(Date initDate) {
		this.initDate = initDate;
	}

	@Transient
	public Date getEndDate() {
		return new Date(dao.select(JPId).getEndDate().getTime());
	}

	@Transient
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Transient
	public Integer getJpStatusId() {
		return dao.select(JPId).getJpStatusId();
	}

	@Transient
	public void setJpStatusId(Integer jpStatusId) {
		this.jpStatusId = jpStatusId;
	}

	@Transient
	public String getJpStatusName() {
		return dao2.select(dao.select(JPId).getJpStatusId()).getJpStatusName();
	}

	@Transient
	public void setJpStatusName(String jpStatusName) {
		this.jpStatusName = jpStatusName;
	}

}
