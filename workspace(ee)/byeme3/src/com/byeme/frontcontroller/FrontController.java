package com.byeme.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.command.Command;
import com.byeme.command.ContentCommand;
import com.byeme.command.DeleteCommand;
import com.byeme.command.FindIdCommand;
import com.byeme.command.FindPwCommand;
import com.byeme.command.ListCommand;
import com.byeme.command.MemberIdCheckCommand;
import com.byeme.command.ModifyCommand;
import com.byeme.command.ReplyCommand;
import com.byeme.command.ReplyViewCommand;
import com.byeme.command.SearchCommand;
import com.byeme.command.WriteCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/board/write_view.do")) {
			viewPage = "write_view.jsp";
		} else if(com.equals("/board/write.do")) {
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/board/list.do";
		} else if(com.equals("/board/list.do")) {
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "board.jsp";
		} else if(com.equals("/board/content_view.do")){
			command = new ContentCommand();
			command.execute(request, response);
			viewPage = "content_view.jsp";
		} else if(com.equals("/board/modify.do")) {
			command = new ModifyCommand();
			command.execute(request, response);
			viewPage = "/board/list.do";
		} else if(com.equals("/board/delete.do")) {
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "/board/list.do";
		} else if(com.equals("/board/reply_view.do")) {
			command = new ReplyViewCommand();
			command.execute(request, response);
			viewPage = "reply_view.jsp";
		} else if(com.equals("/board/reply.do")) {
			command = new ReplyCommand();
			command.execute(request, response);
			viewPage = "/board/list.do";
		} else if(com.equals("/board/search.do")) {
			command = new SearchCommand();
			command.execute(request, response);
			viewPage = "/board/search.jsp";
		} else if(com.equals("/byemeUser/MemberIdCheckAction.do")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			viewPage = "null";
		} else if(com.equals("/byemeUser/findId.do")) {
			command = new FindIdCommand();
			command.execute(request, response);
			viewPage = "null";
		} else if(com.equals("/byemeUser/findPw.do")) {
			command = new FindPwCommand();
			command.execute(request, response);
			viewPage = "null";
		} 
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		if(viewPage!="null")
		dispatcher.forward(request, response);
		
	}
		
	}
	
	
