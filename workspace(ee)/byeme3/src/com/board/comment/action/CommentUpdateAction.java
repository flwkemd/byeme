package com.board.comment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.boardDto.boardCommentDto;
import com.common.action.Action;
import com.common.action.ActionForward;

public class CommentUpdateAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// �Ķ���͸� �����´�.
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String comment_content = request.getParameter("comment_content");
		
		boardDao dao = new boardDao();
		
		boardCommentDto comment = new boardCommentDto();
		comment.setComment_num(comment_num);
		comment.setComment_content(comment_content);
		
		boolean result = dao.updateComment(comment);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// ���������� ����� ����������� 1�� �����Ѵ�.
		if(result) out.println("1");
		
		out.close();
		
		return null;
	}
}
