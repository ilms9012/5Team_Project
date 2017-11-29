package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		if(result==null) {
			mv.addObject("statInfo","사용자 정보가 없습니다.");
			mv.setViewName("search_result");
		}else {
			mv.addObject("statInfo",result);
			mv.setViewName("search_result");
		}
		return mv;
	}
	
}
