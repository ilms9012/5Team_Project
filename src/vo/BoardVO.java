package vo;

import java.util.Date;

public class BoardVO {
	private int boardNum;
	private int boardGroup;
	private int boardStep;
	private String title;
	private String writer;
	private String content;
	private Date writeDate;
	private int readCount;
	private int recommendCount;
///////////////////////////////////////////////////////////////////////////////	
	public BoardVO() {}
	
	public BoardVO(int boardNum, int boardGroup, int boardStep, String title, String writer, String content,
			Date writeDate, int readCount, int recommendCount) {
		this.boardNum = boardNum;
		this.boardGroup = boardGroup;
		this.boardStep = boardStep;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
		this.readCount = readCount;
		this.recommendCount = recommendCount;
	}
///////////////////////////////////////////////////////////////////////////////
	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getBoardGroup() {
		return boardGroup;
	}

	public void setBoardGroup(int boardGroup) {
		this.boardGroup = boardGroup;
	}

	public int getBoardStep() {
		return boardStep;
	}

	public void setBoardStep(int boardStep) {
		this.boardStep = boardStep;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
///////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", boardGroup=" + boardGroup + ", boardStep=" + boardStep + ", title="
				+ title + ", writer=" + writer + ", content=" + content + ", writeDate=" + writeDate + ", readCount="
				+ readCount + ", recommendCount=" + recommendCount + "]";
	}
}	
