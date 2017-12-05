package vo;

import java.util.Date;
import java.util.List;

public class BoardVO {
	private int boardNum;
	private String title;
	private String writer;
	private String content;
	private int readCount;
	private Date writeDate;
	private int hit;
	private List<ReplyVO> reply;
	private int replyCount;

	//////////////////////////////////////////////////////
	public BoardVO() {
		
	}

	public BoardVO(int boardNum, String title, String writer, String content, int readCount, Date writeDate, int hit,
			List<ReplyVO> reply, int replyCount) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.readCount = readCount;
		this.writeDate = writeDate;
		this.hit = hit;
		this.reply = reply;
		this.replyCount = replyCount;
	}
//////////////////////////////////////////////////////
	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public List<ReplyVO> getReply() {
		return reply;
	}

	public void setReply(List<ReplyVO> reply) {
		this.reply = reply;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	////////////////////////////////////////////////////////////////////////////
	

}
