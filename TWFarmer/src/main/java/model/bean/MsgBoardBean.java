package model.bean;

import java.util.Date;

import model.daojdbc.MemberDAOJdbc;

public class MsgBoardBean {
	MemberDAOJdbc memberDAO = new MemberDAOJdbc();
	private int msgBoardID;
	private int WriterID;
	private int jpId;
	private String content;
	private Date msgTime;
	private MemberBean memberBean;

	public int getMsgBoardID() {
		return msgBoardID;
	}

	public void setMsgBoardID(int msgBoardID) {
		this.msgBoardID = msgBoardID;
	}

	public int getWriterID() {
		return WriterID;
	}

	public void setWriterID(int writerID) {
		WriterID = writerID;
	}

	public int getJpId() {
		return jpId;
	}

	public void setJpId(int jpId) {
		this.jpId = jpId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	public MemberBean getMemberBean() {
		return memberDAO.select(WriterID);
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

}
