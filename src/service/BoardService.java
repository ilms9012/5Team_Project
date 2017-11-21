package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.TipBoardDao;

@Component
public class BoardService {
	@Autowired
	private TipBoardDao dao;
}
