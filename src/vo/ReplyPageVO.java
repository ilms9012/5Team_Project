package vo;
 
import java.util.List;
 
public class ReplyPageVO {
    private List<ReplyVO> boardList;
    private int currentPage;
    private int startPage;
    private int endPage;
    private int totalPage;
    private int boardNum;
/////////////////////////////////////////////////////   
    public ReplyPageVO(int boardNum, List<ReplyVO> boardList, int currentPage, int startPage, int endPage, int totalPage) {
        this.boardList = boardList;
        this.currentPage = currentPage;
        this.startPage = startPage;
        this.endPage = endPage;
        this.totalPage = totalPage;
    }
    
    public ReplyPageVO(List<ReplyVO> boardList) {
    	this.boardList = boardList;
    }
    
    public ReplyPageVO() {}
/////////////////////////////////////////////////////   
    public int getBoardNum() {
		return boardNum;
	}
    public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
    
    public List<ReplyVO> getBoardList() {
        return boardList;
    }
    public void setBoardList(List<ReplyVO> boardList) {
        this.boardList = boardList;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
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
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    @Override
    public String toString() {
        return "ReplyPageVO [replyList=" + boardList + ", currentPage=" + currentPage + ", startPage=" + startPage
                + ", endPage=" + endPage + ", totalPage=" + totalPage + "]";
    }
     
}