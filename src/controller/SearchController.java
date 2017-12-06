package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.SearchService;
import vo.StatVO;

@Controller
public class SearchController {
	@Autowired
	private SearchService service;

	@RequestMapping("/search.do")
	public ModelAndView search(String nickname) {
		ModelAndView mv = new ModelAndView();
		System.out.println(nickname);
		List<StatVO> result = new ArrayList<>();
		List<StatVO> result2 = new ArrayList<>();
		result2 = service.DBSearch(nickname);
		if (result2.get(0).getGame_Mode() !=0) {
			int asMatches = 0;
			int krjpMatches = 0;
			int serverMode1 = 0;
			int serverMode2 = 3;
			for (int i = 0; i < 3; i++) {
				int sum = result2.get(i).getWins() + result2.get(i).getLosses();
				int sum2 = result2.get(i + 3).getWins() + result2.get(i + 3).getLosses();
				asMatches = asMatches + sum;
				krjpMatches = krjpMatches + sum2;
			}
			if (asMatches + krjpMatches == 0) {
				mv.addObject("statInfo", "사용자 정보가 없습니다.");
				mv.setViewName("search_result_fail");
			} else if (asMatches > krjpMatches) {
				mv.addObject("statInfo", result2);
				mv.addObject("serverMode", serverMode1);
				mv.setViewName("search_result");
			} else if (asMatches < krjpMatches) {
				mv.addObject("statInfo", result2);
				mv.addObject("serverMode", serverMode2);
			} else {
				mv.addObject("statInfo", result2);
				mv.addObject("serverMode", serverMode1);
				mv.setViewName("search_result");
			}
		} else {
			result = service.statSearch(nickname);
			System.out.println(result);
			int asMatches = 0;
			int krjpMatches = 0;
			int serverMode1 = 0;
			int serverMode2 = 3;
			for (int i = 0; i < 3; i++) {
				int sum = result.get(i).getWins() + result.get(i).getLosses();
				int sum2 = result.get(i + 3).getWins() + result.get(i + 3).getLosses();
				asMatches = asMatches + sum;
				krjpMatches = krjpMatches + sum2;
			}
			if (asMatches + krjpMatches == 0) {
				mv.addObject("statInfo", "사용자 정보가 없습니다.");
				mv.setViewName("search_result_fail");
			} else if (asMatches > krjpMatches) {
				mv.addObject("statInfo", result);
				mv.addObject("serverMode", serverMode1);
				mv.setViewName("search_result");
			} else if (asMatches < krjpMatches) {
				mv.addObject("statInfo", result);
				mv.addObject("serverMode", serverMode2);
			} else {
				mv.addObject("statInfo", result);
				mv.addObject("serverMode", serverMode1);
				mv.setViewName("search_result");
			}
		}

		return mv;
	}

	// 전적갱신
	@RequestMapping("/update.do")
	public ModelAndView update(String nickname) {
		ModelAndView mv = new ModelAndView();
		List<StatVO> result = new ArrayList<>();
		result = service.update(nickname);
		int asMatches = 0;
		int krjpMatches = 0;
		int serverMode1 = 0;
		int serverMode2 = 3;
		for (int i = 0; i < 3; i++) {
			int sum = result.get(i).getWins() + result.get(i).getLosses();
			int sum2 = result.get(i + 3).getWins() + result.get(i + 3).getLosses();
			asMatches = asMatches + sum;
			krjpMatches = krjpMatches + sum2;
		}
		if (asMatches + krjpMatches == 0) {
			mv.addObject("statInfo", "사용자 정보가 없습니다.");
			mv.setViewName("search_result_fail");
		} else if (asMatches > krjpMatches) {
			mv.addObject("statInfo", result);
			mv.addObject("serverMode", serverMode1);
			mv.setViewName("search_result");
		} else if (asMatches < krjpMatches) {
			mv.addObject("statInfo", result);
			mv.addObject("serverMode", serverMode2);
		} else {
			mv.addObject("statInfo", result);
			mv.addObject("serverMode", serverMode1);
			mv.setViewName("search_result");
		}
		mv.setViewName("search_result");
		return mv;
	}

	@RequestMapping("/compareForm.do")
	public String compareForm() {
		return "compare_form";
	}

	@RequestMapping("/searchAvatar.do")
	@ResponseBody
	public String searchAvatar(String nickname) {
		System.out.println(nickname);
		return service.searchAvatar(nickname);
	}

	// 처음 검색할 때는 api에서 다 가져오고 그 후에 서버 바꿀 때는 DBSearch로 가져오고 
	// 전적갱신하면 그 때 api에서 다시 가져오기
	// 첫 게임 서버는 무조건 아시아로 세팅
	@RequestMapping("/compare.do")
	public ModelAndView compare(String nickname1, String nickname2) {
		ModelAndView mv = new ModelAndView();

		List<StatVO> result1 = service.statSearch(nickname1);
		List<StatVO> result2 = service.statSearch(nickname2);

		mv.addObject("serverMode", 0);
		mv.addObject("statInfo1", result1);
		mv.addObject("statInfo2", result2);
		mv.setViewName("compare_result");

		return mv;
	}
	
	@RequestMapping("/compareDB.do")
	public ModelAndView compareDB(String nickname1, String nickname2, int serverMode) {
		ModelAndView mv = new ModelAndView();

		List<StatVO> result1 = service.DBSearch(nickname1);
		List<StatVO> result2 = service.DBSearch(nickname2);

		mv.addObject("serverMode", serverMode);
		mv.addObject("statInfo1", result1);
		mv.addObject("statInfo2", result2);
		mv.setViewName("compare_result");

		return mv;
	}
	
	@RequestMapping("/compareUpdate.do")
	public ModelAndView compareUpdate(String nickname1, String nickname2, int serverMode) {
		ModelAndView mv = new ModelAndView();
		
		List<StatVO> result1 = service.update(nickname1);
		List<StatVO> result2 = service.update(nickname2);

		mv.addObject("serverMode", serverMode);
		mv.addObject("statInfo1", result1);
		mv.addObject("statInfo2", result2);
		mv.setViewName("compare_result");
		
		return mv;
	}

	@RequestMapping("/DBSearch.do")
	public ModelAndView DBSearch(String nickname, int serverMode) {
		ModelAndView mv = new ModelAndView();
		List<StatVO> result = service.DBSearch(nickname);
		mv.addObject("statInfo", result);
		mv.addObject("serverMode", serverMode);
		mv.setViewName("search_result");

		return mv;
	}
}
