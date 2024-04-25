package edu.poly.domain;

import java.util.Date;

public class ShareReport {
	private String senderName;
	private String senderEmail;
	private String receiverEmail;
	private Date sendDate;

	public ShareReport(String senderName, String senderEmail, String receiverEmail, Date sendDate) {

		this.senderName = senderName;
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
		this.sendDate = sendDate;
	}

	public ShareReport() {

	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderEmail() {
		return senderEmail;
	}

	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}

	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

}
