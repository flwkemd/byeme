package com.board.comment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.boardDto.boardCommentDto;
import com.common.action.Action;
import com.common.action.ActionForward;

public class CommentUpdateFormAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ������ ����� �۹�ȣ�� �����´�.
		int comment_num = Integer.parseInt(request.getParameter("num"));

		boardDao dao = new boardDao();
		boardCommentDto comment = dao.getComment(comment_num);
		
		// ��� ������ request�� �����Ѵ�.
		request.setAttribute("comment", comment);
		
		forward.setRedirect(false);
		forward.setNextPath("comment/CommentUpdateForm.jsp");
		
		return forward;
	}
}
