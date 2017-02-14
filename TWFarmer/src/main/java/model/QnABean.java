package model;

import java.util.Date;

public class QnABean {
	private int qnAId;
	private int queryId;
	private int productId;
	private String qnATitle;
	private String qnAContent;
	private java.util.Date queryDate;
	private String reQnA;
	private java.util.Date reDate;
	private int reStatus;
	
	@Override
	public String toString() {
		return "QnABean [qnAId=" + qnAId + ", queryId=" + queryId + ", productId=" + productId + ", qnATitle="
				+ qnATitle + ", qnAContent=" + qnAContent + ", queryDate=" + queryDate + ", reQnA=" + reQnA
				+ ", reDate=" + reDate + ", reStatus=" + reStatus + "]";
	}
	
	public QnABean(int qnAId, int queryId, int productId, String qnATitle, String qnAContent, Date queryDate,
			String reQnA, Date reDate, int reStatus) {
		super();
		this.qnAId = qnAId;
		this.queryId = queryId;
		this.productId = productId;
		this.qnATitle = qnATitle;
		this.qnAContent = qnAContent;
		this.queryDate = queryDate;
		this.reQnA = reQnA;
		this.reDate = reDate;
		this.reStatus = reStatus;
	}

	public QnABean() {
	}

	public int getQnAId() {
		return qnAId;
	}
	public void setQnAId(int qnAId) {
		this.qnAId = qnAId;
	}

	public int getQueryId() {
		return queryId;
	}
	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getQnATitle() {
		return qnATitle;
	}
	public void setQnATitle(String qnATitle) {
		this.qnATitle = qnATitle;
	}
	public String getQnAContent() {
		return qnAContent;
	}
	public void setQnAContent(String qnAContent) {
		this.qnAContent = qnAContent;
	}
	public java.util.Date getQueryDate() {
		return queryDate;
	}
	public void setQueryDate(java.util.Date queryDate) {
		this.queryDate = queryDate;
	}
	public String getReQnA() {
		return reQnA;
	}
	public void setReQnA(String reQnA) {
		this.reQnA = reQnA;
	}
	public java.util.Date getReDate() {
		return reDate;
	}
	public void setReDate(java.util.Date reDate) {
		this.reDate = reDate;
	}
	public int getReStatus() {
		return reStatus;
	}
	public void setReStatus(int reStatus) {
		this.reStatus = reStatus;
	}

}
