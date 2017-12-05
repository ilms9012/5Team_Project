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

import service.BoardService;
import vo.BoardVO;
import vo.ReplyVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;

	
	@RequestMapping("/board.do")
	public ModelAndView board(@RequestParam(defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", service.makeBoardPage(page));
		mv.setViewName("board_list");// board_list.jsp
		return mv;
	}
	
	@RequestMapping("/writeForm.do")
	public String writeForm(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null && loginId.length() > 0) {
			return "write_form";
		} else {
			return "no_login";
		}
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView write(BoardVO board, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");

		if (loginId != null && loginId.length() > 0) {
			service.write(board, loginId, req);
			// mv.addObject("fileCount", board.getUpPic().size());
			mv.setViewName("write_result");
			return mv;
		} else {
			mv.setViewName("no_login");
			return mv;
		}
	}
	
	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView reply(ReplyVO reply, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		
		if (loginId != null && loginId.length() > 0) {
			service.reply(reply, loginId);
			mv.setViewName("reply_result");
		}
		return mv;
	}

	@RequestMapping("/replyDelete.do")
	public ModelAndView replyDelete(int replyNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		boolean replyResult = true;
		int boardNum = service.replyDelete(replyNum, loginId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("replyResult", replyResult);
		mv.addObject("boardNum", boardNum);
		mv.setViewName("reply_delete");
		return mv;
	}

	@RequestMapping("/read.do")
	public ModelAndView read(int boardNum, HttpSession session, @RequestParam(defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();

		String loginId = (String) session.getAttribute("loginId");

		BoardVO board = service.read(boardNum, loginId);

		mv.addObject("replyPage", service.makeReplyPage(boardNum, page));
		mv.addObject("board", board);
		mv.setViewName("read");
		return mv;
	}

	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(int boardNum) {
		BoardVO board = service.readNoCount(boardNum);

		ModelAndView mv = new ModelAndView();
		mv.addObject("original", board);
		mv.setViewName("update_form");
		return mv;
	}

	@RequestMapping(value = "/updatee.do", method = RequestMethod.POST)
	public ModelAndView update(BoardVO board, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.update(board, loginId);
		ModelAndView mv = new ModelAndView();

		if (result) {
			mv.addObject("boardNum", board.getBoardNum());
			mv.setViewName("update_success");
		} else {
			mv.setViewName("update_fail");
		}
		return mv;
	}

	@RequestMapping("/delete.do")
	public ModelAndView delete(int boardNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.delete(boardNum, loginId);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("delete_result");
		return mv;
	}

	
	@RequestMapping("/recommendForm.do")
	public ModelAndView recommendForm(int boardNum, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		BoardVO board = service.recommend(boardNum,loginId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("hit", board.getHit());
		mv.setViewName("recommend_result");
		return mv;
	}
	
}













