package model.bean;

public class ChatRoomBean {
	private int chatMsgId;
	private int writerId;
	private int readerId;
	private String chatMsgContent;
	private java.util.Date chatMsgTime;
	
	@Override
	public String toString() {
		return "ChatRoomBean [chatMsgId=" + chatMsgId + ", writerId=" + writerId + ", readerId=" + readerId
				+ ", chatMsgContent=" + chatMsgContent + ", chatMsgTime=" + chatMsgTime + "]";
	}
	public int getChatMsgId() {
		return chatMsgId;
	}
	public void setChatMsgId(int chatMsgId) {
		this.chatMsgId = chatMsgId;
	}
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public int getReaderId() {
		return readerId;
	}
	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}
	public String getChatMsgContent() {
		return chatMsgContent;
	}
	public void setChatMsgContent(String chatMsgContent) {
		this.chatMsgContent = chatMsgContent;
	}
	public java.util.Date getChatMsgTime() {
		return chatMsgTime;
	}
	public void setChatMsgTime(java.util.Date chatMsgTime) {
		this.chatMsgTime = chatMsgTime;
	}
	
}
