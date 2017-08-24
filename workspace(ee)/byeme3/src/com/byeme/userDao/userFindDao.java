package com.byeme.userDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.byeme.userDto.userDto;

public class userFindDao implements FindUser {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource dataSource;
	
	public userFindDao(){
		try{
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			conn = dataSource.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public userDto getId(String userEmail, String userName) {
		
		String query = "select * from byemeUser where userEmail=? and userName=?";
		userDto dto = new userDto();
		try{
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userName);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserEmail(rs.getString("userEmail"));
				
				return dto;
			}
			
		}catch(Exception e){
			e.getMessage();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {
				e.getMessage();
			}
		}
		
		return null;
	}

	@Override
	public userDto getPw(String userId, String userName, String userEmail) {
		String query = "select * from byemeUser where userId=? and userName=? and userEmail=?";
		userDto dto = new userDto();
		try{
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setUserId(rs.getString("userId"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserEmail(rs.getString("userEmail"));
				
				return dto;
			}
			
		}catch(Exception e){
			e.getMessage();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {
				e.getMessage();
			}
		}
		
		return null;
	}

	@Override
	public boolean findId(String userEmail, String userName) {
		userDto dto = getId(userEmail, userName);
		
		if(dto!=null){
			String userId = dto.getUserId();
			return true;
		}
		
		return false;
	}

	@Override
	public boolean findPw(String userId, String userName, String userEmail) {
		userDto dto = getPw(userId, userName, userEmail);
		
		if(dto!=null){
			String userPw = dto.getUserPassword();
			return true;
		}
		
		return false;
	}
	
	

}
