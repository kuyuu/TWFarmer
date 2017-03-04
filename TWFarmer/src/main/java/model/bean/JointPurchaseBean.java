package model.bean;

import java.io.Serializable;
import java.util.Date;

import model.daojdbc.JPStatusDAOjdbc;
import model.daojdbc.MemberDAOJdbc;

public class JointPurchaseBean implements Serializable {
	JPStatusDAOjdbc dao = new JPStatusDAOjdbc();
	MemberDAOJdbc dao2 = new MemberDAOJdbc();

	private int jpId;
	private int initId;
	private String jpName;
	private String jpIntro;
	private Date initDate;
	private Date endDate;
	private String jpLocation;
	private int jpStatusId;
	private int jpFreight;
	private int miscViaId;
	private int misc;
	private String bankAccount;
	private String bankName;
	private String pictureName;
	private String jpStatusName;
	private MemberBean memberBean;

	@Override
	public boolean equals(Object obj) {
		if (obj != null && (obj instanceof JointPurchaseBean)) {
			JointPurchaseBean temp = (JointPurchaseBean) obj;
			if (this.jpId == temp.jpId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{" + jpId + ":" + initId + ":" + jpIntro + ":" + initDate + ":" + endDate + ":" + jpLocation + ":"
				+ jpStatusId + ":" + jpFreight + ":" + miscViaId + ":" + misc + ":" + bankAccount + ":" + bankName
				+ "}";
	}

	public int getJpId() {
		return jpId;
	}

	public void setJpId(int jpId) {
		this.jpId = jpId;
	}

	public int getInitId() {
		return initId;
	}

	public void setInitId(int initId) {
		this.initId = initId;
	}

	public String getJpName() {
		return jpName;
	}

	public void setJpName(String jpName) {
		this.jpName = jpName;
	}

	public String getJpIntro() {
		return jpIntro;
	}

	public void setJpIntro(String jpIntro) {
		this.jpIntro = jpIntro;
	}

	public Date getInitDate() {
		return initDate;
	}

	public void setInitDate(Date initDate) {
		this.initDate = initDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getJpLocation() {
		return jpLocation;
	}

	public void setJpLocation(String jpLocation) {
		this.jpLocation = jpLocation;
	}

	public int getJpStatusId() {
		return jpStatusId;
	}

	public void setJpStatusId(int jpStatusId) {
		this.jpStatusId = jpStatusId;
	}

	public int getJpFreight() {
		return jpFreight;
	}

	public void setJpFreight(int jpFreight) {
		this.jpFreight = jpFreight;
	}

	public int getMiscViaId() {
		return miscViaId;
	}

	public void setMiscViaId(int miscViaId) {
		this.miscViaId = miscViaId;
	}

	public int getMisc() {
		return misc;
	}

	public void setMisc(int misc) {
		this.misc = misc;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getJpStatusName() {
		return dao.select(jpStatusId).getJpStatusName();
	}

	public void setJpStatusName(String jpStatusName) {
		this.jpStatusName = jpStatusName;
	}

	public MemberBean getMemberBean() {
		return dao2.select(initId);
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

}
