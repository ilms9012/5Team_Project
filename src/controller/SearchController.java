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
		if(result==null) {
			mv.addObject("statInfo","사용자 정보가 없습니다.");
			mv.setViewName("search_result");
		}else {
			
			mv.addObject("statInfo",result);
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
	public ModelAndView compare(String nickname1, String nickname2) {
		ModelAndView mv = new ModelAndView();
		List<StatVO> result1 = service.statSearch(nickname1);
		List<StatVO> result2 = service.statSearch(nickname2);
		
		if(result1 == null || result2 == null) {
			// 같이 비교할 모드가 없으면
			mv.setViewName("compare_result_fail");
		}else {
			mv.addObject("statInfo1",result1);
			mv.addObject("statInfo2",result2);
			mv.setViewName("compare_result_success");
		}
		return mv;
	}
		
}
