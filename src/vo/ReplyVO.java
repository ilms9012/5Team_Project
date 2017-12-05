package vo;

public class ReplyVO {
	private int replyNum;
	private int boardNum;
    private String writer;
    private String content;
	
    public ReplyVO(int replyNum, int boardNum, String writer, String content) {
		super();
		this.replyNum = replyNum;
		this.boardNum = boardNum;
		this.writer = writer;
		this.content = content;
	}
	
	public ReplyVO() {
		
	}
	
	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", boardNum=" + boardNum + ", writer=" + writer + ", content="
				+ content + "]";
	}
	
}
