package model;

import model.dao.MemberDAOJdbc;
import model.dao.ProductDAOjdbc;

public class ViolationBean {
	ProductDAOjdbc pdao = new ProductDAOjdbc();
	MemberDAOJdbc mdao = new MemberDAOJdbc();
	private int ticketId;
	private int reportedId;
	private int reporterId;
	private String vioTitle;
	private String vioContent;
	private java.util.Date createDate;
	private java.util.Date processDate;
	private String ticketResult;
	private int ticketStatue;
	private ProductBean productBean;
	private MemberBean memberBean;
	
	@Override
	public String toString() {
		return "ViolationBean [ticketId=" + ticketId + ", reportedId=" + reportedId + ", reporterId=" + reporterId
				+ ", vioTitle=" + vioTitle + ", vioContent=" + vioContent + ", createDate=" + createDate
				+ ", processDate=" + processDate + ", ticketResult=" + ticketResult + ", ticketStatue=" + ticketStatue
				+ "]";
	}
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public int getReportedId() {
		return reportedId;
	}
	public void setReportedId(int reportedId) {
		this.reportedId = reportedId;
	}
	public int getReporterId() {
		return reporterId;
	}
	public void setReporterId(int reporterId) {
		this.reporterId = reporterId;
	}
	public String getVioTitle() {
		return vioTitle;
	}
	public void setVioTitle(String vioTitle) {
		this.vioTitle = vioTitle;
	}
	public String getVioContent() {
		return vioContent;
	}
	public void setVioContent(String vioContent) {
		this.vioContent = vioContent;
	}
	public java.util.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}
	public java.util.Date getProcessDate() {
		return processDate;
	}
	public void setProcessDate(java.util.Date processDate) {
		this.processDate = processDate;
	}
	public String getTicketResult() {
		return ticketResult;
	}
	public void setTicketResult(String ticketResult) {
		this.ticketResult = ticketResult;
	}
	public int getTicketStatue() {
		return ticketStatue;
	}
	public void setTicketStatue(int ticketStatue) {
		this.ticketStatue = ticketStatue;
	}
	public ProductBean getProductBean() {
		return pdao.select(reportedId);
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	public MemberBean getMemberBean() {
		return mdao.select(reporterId);
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}


}
