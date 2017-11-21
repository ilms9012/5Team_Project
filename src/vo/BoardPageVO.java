package vo;

import java.util.List;

public class BoardPageVO {
	private int startPage;
	private int endPage;
	private int currentPage;
	private int totalPage;
	private List<BoardVO> boardList;
///////////////////////////////////////////////////////////////////////////////
	public BoardPageVO() {}
	
	public BoardPageVO(int startPage, int endPage, int currentPage, int totalPage, List<BoardVO> boardList) {
		this.startPage = startPage;
		this.endPage = endPage;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.boardList = boardList;
	}
///////////////////////////////////////////////////////////////////////////////
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<BoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}
///////////////////////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "BoardPageVO [startPage=" + startPage + ", endPage=" + endPage + ", currentPage=" + currentPage
				+ ", totalPage=" + totalPage + ", boardList=" + boardList + "]";
	}
}
