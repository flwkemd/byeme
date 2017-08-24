package com.byeme.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.boardDto.boardCommentDto;
import com.byeme.boardDto.boardDto;

public class ContentCommand implements Command {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		int bId = Integer.parseInt(request.getParameter("bId"));
		
		boardDao dao = new boardDao();
		boardDto dto = dao.contentView(bId);
		
		ArrayList<boardCommentDto> commentList = dao.getCommentList(bId);
		
		// 댓글이 1개라도 있다면 request에 commentList를 세팅한다.
		if(commentList.size() > 0)	
			request.setAttribute("commentList", commentList);
		
		request.setAttribute("content_view", dto);
		
	}

}
