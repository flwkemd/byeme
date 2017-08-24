package com.byeme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;

public class SearchCommand implements Command {

	private int pageNumber;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String col = request.getParameter("col");
		String word = request.getParameter("word");
		
		boardDao dao = new boardDao();
		dao.searchBoard(col, word, pageNumber);
	}

}
