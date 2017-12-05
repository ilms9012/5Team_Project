package controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("chap13.spring")
public class ControllerAdviceHandler {
	@ExceptionHandler(RuntimeException.class)
	public ModelAndView handleRuntimeException(RuntimeException e) {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", e.getMessage());
		
		return mv;
	}
}
