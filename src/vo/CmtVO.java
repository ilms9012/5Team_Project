package vo;

import java.util.Date;

public class CmtVO {
	private int cmtNum;
	private int cmtGroup;
	private int cmtStep;
	private int boardNum;
	private String content;
	private String writer;
	private Date writeDate;
///////////////////////////////////////////////////////////////////////////////
	public CmtVO() {}
	
	public CmtVO(int cmtNum, int cmtGroup, int cmtStep, int boardNum, String content, String writer, Date writeDate) {
		super();
		this.cmtNum = cmtNum;
		this.cmtGroup = cmtGroup;
		this.cmtStep = cmtStep;
		this.boardNum = boardNum;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}
///////////////////////////////////////////////////////////////////////////////

	public int getCmtNum() {
		return cmtNum;
	}

	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}

	public int getCmtGroup() {
		return cmtGroup;
	}

	public void setCmtGroup(int cmtGroup) {
		this.cmtGroup = cmtGroup;
	}

	public int getCmtStep() {
		return cmtStep;
	}

	public void setCmtStep(int cmtStep) {
		this.cmtStep = cmtStep;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
///////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "CmtVO [cmtNum=" + cmtNum + ", cmtGroup=" + cmtGroup + ", cmtStep=" + cmtStep + ", boardNum=" + boardNum
				+ ", content=" + content + ", writer=" + writer + ", writeDate=" + writeDate + "]";
	}
}
