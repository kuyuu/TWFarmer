package model;

import java.io.Serializable;
import java.util.Date;

import model.dao.MemberDAOJdbc;

public class FriendBean implements Serializable {
	MemberDAOJdbc dao = new MemberDAOJdbc();
	private int memberId;
	private int friendId;
	private int friendStatus;
	private String friendAccount;
	private String friendName;

	public FriendBean() {

	}
	@Override
	public String toString() {
		return "{" + memberId + ":" + friendId + ":" + friendStatus + "}";
	}

	public int getFriendId() {
		return friendId;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}

	public int getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(int friendStatus) {
		this.friendStatus = friendStatus;
	}

	public FriendBean(int memberId, int friendId, int friendStatus) {
		super();
		this.memberId = memberId;
		this.friendId = friendId;
		this.friendStatus = friendStatus;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null && (obj instanceof FriendBean)) {
			FriendBean temp = (FriendBean) obj;
			if (this.memberId == temp.memberId) {
				return true;
			}
		}
		return false;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getFriendName() {
		return dao.select(friendId).getName();
	}
	
	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
public String getFriendAccount(){
	return dao.select(friendId).getAccount();
			}
	public void setFriendAccount(){
		this.friendAccount = friendAccount;
	}
	
	

}
