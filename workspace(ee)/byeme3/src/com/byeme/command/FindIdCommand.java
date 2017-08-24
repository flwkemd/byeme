package com.byeme.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.userDao.userDao;
import com.byeme.userDao.userFindDao;
import com.byeme.userDto.userDto;

public class FindIdCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		
		userFindDao dao = new userFindDao();
	    dao.getId(userEmail, userName);
	    
	    response.setContentType("text/html;charset=utf-8");
	    PrintWriter out;
		try {
			out = response.getWriter();

			if(dao.findId(userEmail, userName) == true){
				userDto dto = dao.getId(userEmail, userName);
				String userId = dto.getUserId();
				
				out.println("아이디는 : "+userId+" 입니다."); 
			}else{
				out.println("아이디를 찾을 수 없습니다.");
			}
				out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
	}

}
