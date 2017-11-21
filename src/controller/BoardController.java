package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	
}
