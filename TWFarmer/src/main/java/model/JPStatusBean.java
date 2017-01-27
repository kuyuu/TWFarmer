package model;

import java.io.Serializable;

public class JPStatusBean  implements Serializable  {
	
	int jpStatusId;
	String jpStatusName;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof JPStatusBean)) {
			JPStatusBean temp = (JPStatusBean) obj;
			if(this.jpStatusId == temp.jpStatusId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{"+jpStatusId+":"+ jpStatusName+"}";
	}

	public int getJpStatusId() {
		return jpStatusId;
	}

	public void setJpStatusId(int jpStatusId) {
		this.jpStatusId = jpStatusId;
	}

	public String getJpStatusName() {
		return jpStatusName;
	}

	public void setJpStatusName(String jpStatusName) {
		this.jpStatusName = jpStatusName;
	}


}
