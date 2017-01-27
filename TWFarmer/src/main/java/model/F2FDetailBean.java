package model;

import java.io.Serializable;
import java.util.Date;

public class F2FDetailBean implements Serializable {
	
	int f2fId;
	int jpId;
	String f2fPlace;
	Date f2fTime;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof F2FDetailBean)) {
			F2FDetailBean temp = (F2FDetailBean) obj;
			if(this.f2fId == temp.f2fId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{"+f2fId+":"+jpId+":"+f2fPlace+":"+f2fTime+"}";
	}
	
	public int getF2fId() {
		return f2fId;
	}

	public void setF2fId(int f2fId) {
		this.f2fId = f2fId;
	}

	public int getJpId() {
		return jpId;
	}

	public void setJpId(int jpId) {
		this.jpId = jpId;
	}

	public String getF2fPlace() {
		return f2fPlace;
	}

	public void setF2fPlace(String f2fPlace) {
		this.f2fPlace = f2fPlace;
	}

	public Date getF2fTime() {
		return f2fTime;
	}

	public void setF2fTime(Date f2fTime) {
		this.f2fTime = f2fTime;
	}

}
