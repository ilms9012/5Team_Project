package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;

	
}
