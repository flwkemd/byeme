package com.byeme.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.userDao.userDao;;

public class MemberIdCheckCommand implements Command
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String id = request.getParameter("userId");
		userDao dao = new userDao();
		
		boolean result = dao.duplicateIdCheck(id);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result)	out.println("0"); // 아이디 중복
		else		out.println("1");
		
		out.close();
	}
}
