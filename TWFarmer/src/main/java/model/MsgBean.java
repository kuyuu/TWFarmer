package model;

import model.dao.MemberDAOJdbc;

public class MsgBean {
	MemberDAOJdbc dao = new MemberDAOJdbc();
	private int msgId;
	private int msgWriterId;
	private int msgReaderId;
	private String msgTitle;
	private String msgContent;
	private java.util.Date msgTime;
	private int msgStatus;
	private String writerName;
	private String readerName;
	private String writerAccount;
	private String readerAccount;
	private String writerMemberPic;
	private String readerMemberPic;

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

	public String getWriterName() {
		return dao.select(msgWriterId).getName();
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getReaderName() {
		return dao.select(msgReaderId).getName();
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}

	public String getWriterAccount() {
		return dao.select(msgWriterId).getAccount();
	}

	public void setWriterAccount(String writerAccount) {
		this.writerAccount = writerAccount;
	}

	public String getReaderAccount() {
		return dao.select(msgReaderId).getAccount();
	}

	public void setReaderAccount(String readerAccount) {
		this.readerAccount = readerAccount;
	}

	public String getWriterMemberPic() {
		return dao.select(msgWriterId).getMemberPic();
	}

	public void setWriterMemberPic(String writerMemberPic) {
		this.writerMemberPic = writerMemberPic;
	}

	public String getReaderMemberPic() {
		return dao.select(msgReaderId).getMemberPic();
	}

	public void setReaderMemberPic(String readerMemberPic) {
		this.readerMemberPic = readerMemberPic;
	}

}
