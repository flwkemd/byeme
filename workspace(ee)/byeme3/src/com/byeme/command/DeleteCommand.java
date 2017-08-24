package com.byeme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		boardDao dao = new boardDao();
		dao.delete(bId);
		
	}

}
