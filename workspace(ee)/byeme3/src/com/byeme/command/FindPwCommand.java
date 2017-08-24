package com.byeme.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.userDao.userFindDao;
import com.byeme.userDto.userDto;

public class FindPwCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		userFindDao dao = new userFindDao();
		dao.getPw(userId, userName ,userEmail);
	    
	    response.setContentType("text/html;charset=utf-8");
	    PrintWriter out;
		try {
			out = response.getWriter();

			if(dao.findPw(userId, userName, userEmail) == true){
				userDto dto = dao.getPw(userId, userName, userEmail);
				String userPw = dto.getUserPassword();
				
				out.println("비밀번호는 : "+userPw+" 입니다."); 
			}else{
				out.println("정보를 찾을 수 없습니다.");
			}
				out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
