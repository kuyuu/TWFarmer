package model.bean;

import java.io.Serializable;

public class MiscViaBean  implements Serializable {
	
	int miscViaId;
	String miscViaWay;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof MiscViaBean)) {
			MiscViaBean temp = (MiscViaBean) obj;
			if(this.miscViaId == temp.miscViaId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{"+miscViaId+":"+ miscViaWay+":"+"}";
	}
	
	
	public int getMiscViaId() {
		return miscViaId;
	}

	public void setMiscViaId(int miscViaId) {
		this.miscViaId = miscViaId;
	}

	public String getMiscViaWay() {
		return miscViaWay;
	}

	public void setMiscViaWay(String miscViaWay) {
		this.miscViaWay = miscViaWay;
	}

}
