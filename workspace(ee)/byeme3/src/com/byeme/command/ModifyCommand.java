package com.byeme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;

public class ModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		int bId = Integer.parseInt(request.getParameter("bId"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		boardDao dao = new boardDao();
		dao.modify(bId, bTitle, bContent);
			
	}

}
