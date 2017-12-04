package controller;

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
		List<StatVO> result = service.statSearch(nickname);
		int asMatches = 0;
		int krjpMatches = 0;
		int serverMode1 = 0;
		int serverMode2 = 3;
		for(int i = 0; i<3 ; i++) {
			int sum = result.get(i).getWins()+result.get(i).getLosses();
			int sum2 = result.get(i+3).getWins()+result.get(i+3).getLosses();
			asMatches = asMatches+sum;
			krjpMatches = krjpMatches+sum2;
		}
		if(asMatches+krjpMatches==0) {
			mv.addObject("statInfo","사용자 정보가 없습니다.");
			mv.setViewName("search_result_fail");
		}else if(asMatches>krjpMatches){
			mv.addObject("statInfo",result);
			mv.addObject("serverMode",serverMode1);
			mv.setViewName("search_result");
		}else if(asMatches<krjpMatches) {
			mv.addObject("statInfo",result);
			mv.addObject("serverMode",serverMode2);
		}else {
			mv.addObject("statInfo",result);
			mv.addObject("serverMode",serverMode1);
			mv.setViewName("search_result");
		}
		return mv;
	}
	
	@RequestMapping("/compareForm.do")
	public String compareForm() {
		return "compare_form";
	}
	
	@RequestMapping("/searchAvatar.do")
	@ResponseBody
	public String searchAvatar(String nickname) {
		return service.searchAvatar(nickname);
	}
	
	@RequestMapping("/compare.do")
	public ModelAndView compare(int gameServer, String nickname1, String nickname2) {
		ModelAndView mv = new ModelAndView();
		
		List<StatVO> result1 = service.searchServerStat(gameServer, nickname1);
		List<StatVO> result2 = service.searchServerStat(gameServer, nickname2);
		
		for(StatVO a : result1) {
			System.out.println(a);
		}
		
		mv.addObject("gameServer", gameServer);
		mv.addObject("statInfo1", result1);
		mv.addObject("statInfo2", result2);
		mv.setViewName("compare_result");
		
		return mv;
	}
	@RequestMapping("/DBSearch.do")
	public ModelAndView DBSearch(String nickname,int serverMode) {
		ModelAndView mv = new ModelAndView();
		List<StatVO> result = service.DBSearch(nickname,serverMode);
	}
}
