package com.byeme.userDao;
import com.byeme.userDto.userDto;

public interface FindUser {

	public userDto getId(String userEmail, String userName);
	public userDto getPw(String userId, String userName, String userEmail);
	
	public boolean findId(String userEmail, String userName);
	public boolean findPw(String userId, String userName, String userEmail);
	
}
