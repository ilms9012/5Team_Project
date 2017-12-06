package service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.FreeBoardDao;
import repository.FreeReplyDao;
import vo.BoardPageVO;
import vo.BoardVO;
import vo.ReplyPageVO;
import vo.ReplyVO;

@Component
public class FreeBoardService {
	@Autowired
	private FreeBoardDao dao;
	@Autowired
	private FreeReplyDao repDao;
	
	private static final int COUNT_PER_PAGE = 10;
	private static final int REPLY_COUNT_PER_PAGE = 4;

	public BoardPageVO makeBoardPage(int currentPage) {
		int totalCount = dao.selectCount();

		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		List<BoardVO> boardList = dao.selectList(startRow, COUNT_PER_PAGE);

		for(BoardVO b: boardList) {
			b.setReplyCount(repDao.totalCount(b.getBoardNum()));
		}	
		
		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}
	
	public ReplyPageVO makeReplyPage(int boardNum, int currentPage) {
		int totalCount = repDao.totalCount(boardNum);

		int totalPage = totalCount / REPLY_COUNT_PER_PAGE;
		if (totalCount % REPLY_COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * REPLY_COUNT_PER_PAGE;

		List<ReplyVO> boardList = repDao.selectList(boardNum, startRow, REPLY_COUNT_PER_PAGE);

		ReplyPageVO p= new ReplyPageVO(boardNum, boardList, currentPage, startPage, endPage, totalPage);
		System.out.println(p);
		return p;
	}
	
	
	public void write(BoardVO board, String loginId, HttpServletRequest req) {
		board.setReadCount(0);
		board.setWriteDate(new Date());
		board.setWriter(loginId);
		dao.insert(board);
	}
	
	public void reply(ReplyVO reply, String loginId) {
		reply.setWriter(loginId);
		reply.setBoardNum(reply.getBoardNum());
		reply.setReplyNum(reply.getReplyNum());
		System.out.println("service"+reply.toString());
		
		repDao.insert(reply);
	}
	
	public int replyDelete(int replyNum, String loginId) {
		ReplyVO reply = repDao.select(replyNum);
		int boardNum = reply.getBoardNum();
		
		if (loginId != null && loginId.equals(reply.getWriter())) {
			repDao.delete(replyNum);
			return boardNum;
		} else {
			return boardNum;
		}
	}
	
	public BoardVO read(int boardNum, String loginId) {
		BoardVO board = dao.select(boardNum);

		if (loginId != null && loginId.equals(board.getWriter())) {
			return board;
		} else {
			dao.updateReadCount(boardNum);
			board.setReadCount(board.getReadCount()+1);
			return board;
		}
	}
	
	public BoardVO recommend(int boardNum, String loginId) {
		BoardVO board = dao.select(boardNum);

		if (loginId != null && loginId.equals(board.getWriter())) {
			return board;
		} else {
			dao.updateRecommendCount(boardNum);
			board.setHit(board.getHit()+1);
			return board;
		}
	}


	public BoardVO readNoCount(int boardNum) {
		return dao.select(boardNum);
	}

	public boolean update(BoardVO board, String loginId) {
		BoardVO original = dao.select(board.getBoardNum());

		if (loginId != null && loginId.equals(original.getWriter())) {
			board.setWriteDate(new Date());
			dao.update(board);
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(int boardNum, String loginId) {
		BoardVO board = dao.select(boardNum);

		if (loginId != null && loginId.equals(board.getWriter())) {
				repDao.deleteAll(boardNum);
			dao.delete(boardNum);
			return true;
		} else {
			return false;
		}
	}
	
}