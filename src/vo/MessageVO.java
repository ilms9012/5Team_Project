package vo;

import java.util.Date;

public class MessageVO {
	private String sender;
	private String receiver;
	private String content;
	private Date writeDate;
	private String readCheck;
///////////////////////////////////////////////////////////////////////////////
	public MessageVO() {}
	
	public MessageVO(String sender, String receiver, String content, Date writeDate, String readCheck) {
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.writeDate = writeDate;
		this.readCheck = readCheck;
	}
	///////////////////////////////////////////////////////////////////////////////
	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	public String getReadCheck() {
		return readCheck;
	}
	
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}
///////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "MessageVO [sender=" + sender + ", receiver=" + receiver + ", content=" + content + ", writeDate="
				+ writeDate + ", readCheck=" + readCheck + "]";
	}
}
