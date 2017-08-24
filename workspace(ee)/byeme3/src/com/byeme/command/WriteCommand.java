package com.byeme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String bTitle = request.getParameter("bTitle");
		String userId = request.getParameter("userId");
		String bContent = request.getParameter("bContent");
		
		boardDao dao = new boardDao();
		dao.write(bTitle, userId, bContent);
	}
}
