package com.byeme.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.byeme.boardDao.boardDao;
import com.byeme.boardDto.boardDto;

public class ListCommand implements Command {


	private int pageNumber;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		boardDao dao = new boardDao();

		ArrayList<boardDto> dtos = dao.list(pageNumber);
		request.setAttribute("list", dtos);
	}
}