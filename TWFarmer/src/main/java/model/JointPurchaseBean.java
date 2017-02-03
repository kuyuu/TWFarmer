package model;

import java.io.Serializable;
import java.util.Date;

public class JointPurchaseBean implements Serializable {

	int jpId;
	int initId;
	String jpName;
	String jpIntro;
	Date initDate;
	Date endDate;
	String jpLocation;
	int jpStatusId;
	int jpFreight;
	int miscViaId;
	int misc;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof JointPurchaseBean)) {
			JointPurchaseBean temp = (JointPurchaseBean) obj;
			if(this.jpId == temp.jpId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{"+jpId+":"+initId+":"+jpIntro+":"+initDate+":"+endDate+":"+jpLocation+":"+jpStatusId+":"+jpFreight+":"+miscViaId+":"+misc+"}";
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



	
}
