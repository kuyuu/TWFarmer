package model;

import java.io.Serializable;
import java.util.Date;

public class TrackProductBean implements Serializable {
	private int memberId;
	private int productId;
	private Date trackDate;

	public TrackProductBean() {

	}

	public TrackProductBean(int memberId, int productId, Date trackDate) {
		super();
		this.memberId = memberId;
		this.productId = productId;
		this.trackDate = trackDate;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null && (obj instanceof TrackProductBean)) {
			TrackProductBean temp = (TrackProductBean) obj;
			if (this.memberId == temp.memberId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{" + memberId + ":" + productId + ":" + trackDate + "}";
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Date getTrackDate() {
		return trackDate;
	}

	public void setTrackDate(Date trackDate) {
		this.trackDate = trackDate;
	}

}
