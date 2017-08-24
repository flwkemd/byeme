package com.board.comment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.boardDto.boardCommentDto;
import com.common.action.Action;
import com.common.action.ActionForward;

public class CommentReplyAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// �Ķ���͸� �����´�.
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int comment_board = Integer.parseInt(request.getParameter("comment_board"));
		String comment_id = request.getParameter("comment_id");
		String comment_content = request.getParameter("comment_content");

		boardDao dao = new boardDao();
		
		boardCommentDto comment = new boardCommentDto();	
		comment.setComment_num(dao.getSeq());	// �������� ������ �����Ѵ�
		comment.setComment_board(comment_board);
		comment.setComment_id(comment_id);
		comment.setComment_content(comment_content);
		comment.setComment_parent(comment_num);  // �θ����� �۹�ȣ�� ����
		
		boolean result = dao.insertComment(comment);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// ���������� ����� ����������� 1�� �����Ѵ�.
		if(result) out.println("1");
		else out.println("0");
		
		out.close();
		
		return null;
	}
}
