package com.board.comment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.common.action.Action;
import com.common.action.ActionForward;


public class CommentDeleteAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		boardDao dao = new boardDao();
		boolean result = dao.deleteComment(comment_num);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		if(result) out.println("1");
		
		out.close();
		return null;
	}
}
