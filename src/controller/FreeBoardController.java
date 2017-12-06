package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.FreeBoardService;
import vo.BoardVO;
import vo.ReplyVO;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;
	
	@RequestMapping("/freeBoard.do")
	public ModelAndView board(@RequestParam(defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", service.makeBoardPage(page));
		mv.setViewName("free_board_list");// board_list.jsp
		return mv;
	}
	
	@RequestMapping("/freeWriteForm.do")
	public String writeForm(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null && loginId.length() > 0) {
			return "free_write_form";
		} else {
			return "no_login";
		}
	}

	@RequestMapping(value = "/freeWrite.do", method = RequestMethod.POST)
	public ModelAndView write(BoardVO board, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.write(board, loginId, req);
			// mv.addObject("fileCount", board.getUpPic().size());
			mv.setViewName("free_write_result");
			return mv;
		} else {
			mv.setViewName("no_login");
			return mv;
		}
	}
	
	@RequestMapping(value = "/freeReply.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView reply(ReplyVO reply, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		
		if (loginId != null && loginId.length() > 0) {
			service.reply(reply, loginId);
			mv.setViewName("free_reply_result");
		}
		return mv;
	}

	@RequestMapping("/freeReplyDelete.do")
	public ModelAndView replyDelete(int replyNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		boolean replyResult = true;
		int boardNum = service.replyDelete(replyNum, loginId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("freeReplyResult", replyResult);
		mv.addObject("boardNum", boardNum);
		mv.setViewName("free_reply_delete");
		return mv;
	}

	@RequestMapping("/freeRead.do")
	public ModelAndView read(int boardNum, HttpSession session, @RequestParam(defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		BoardVO board = service.read(boardNum, loginId);

		mv.addObject("freeReplyPage", service.makeReplyPage(boardNum, page));
		mv.addObject("board", board);
		mv.setViewName("free_read");
		return mv;
	}

	@RequestMapping("/freeUpdateForm.do")
	public ModelAndView updateForm(int boardNum) {
		BoardVO board = service.readNoCount(boardNum);

		ModelAndView mv = new ModelAndView();
		mv.addObject("original", board);
		mv.setViewName("free_update_form");
		return mv;
	}

	@RequestMapping(value = "/freeUpdate.do", method = RequestMethod.POST)
	public ModelAndView update(BoardVO board, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.update(board, loginId);
		ModelAndView mv = new ModelAndView();

		if (result) {
			mv.addObject("boardNum", board.getBoardNum());
			mv.setViewName("free_update_success");
		} else {
			mv.setViewName("free_update_fail");
		}
		return mv;
	}

	@RequestMapping("/freeDelete.do")
	public ModelAndView delete(int boardNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.delete(boardNum, loginId);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("free_delete_result");
		return mv;
	}

	
	@RequestMapping("/freeRecommendForm.do")
	public ModelAndView recommendForm(int boardNum, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		BoardVO board = service.recommend(boardNum,loginId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("hit", board.getHit());
		mv.setViewName("free_recommend_result");
		return mv;
	}
	
}













