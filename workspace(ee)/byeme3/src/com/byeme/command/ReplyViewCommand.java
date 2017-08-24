package com.byeme.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.boardDto.boardDto;

public class ReplyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String bId = request.getParameter("bId");
		boardDao dao = new boardDao();
		boardDto dto = dao.reply_view(bId);
		
		request.setAttribute("reply_view", dto);
		
	}

}
