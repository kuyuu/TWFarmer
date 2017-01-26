package model;

public class MsgBean {
	private int msgId;
	private int msgWriterId;
	private int msgReaderId;
	private String msgTitle;
	private String msgContent;
	private java.util.Date msgTime;
	private int msgStatus;
	
	@Override
	public String toString() {
		return "MsgBean [msgId=" + msgId + ", msgWriterId=" + msgWriterId + ", msgReaderId=" + msgReaderId
				+ ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", msgTime=" + msgTime + ", msgStatus="
				+ msgStatus + "]";
	}
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getMsgWriterId() {
		return msgWriterId;
	}
	public void setMsgWriterId(int msgWriterId) {
		this.msgWriterId = msgWriterId;
	}
	public int getMsgReaderId() {
		return msgReaderId;
	}
	public void setMsgReaderId(int msgReaderId) {
		this.msgReaderId = msgReaderId;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public java.util.Date getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(java.util.Date msgTime) {
		this.msgTime = msgTime;
	}
	public int getMsgStatus() {
		return msgStatus;
	}
	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
	}

}
