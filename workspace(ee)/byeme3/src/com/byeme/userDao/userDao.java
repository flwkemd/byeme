package com.byeme.userDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.byeme.userDto.userDto;

public class userDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource dataSource;
	
	public static final int MEMBER_NONEXISTENT  = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	private static userDao instance = new userDao();
	
	public static userDao getInstance(){
		return instance;
	}
	
	public userDao(){
		try{
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			conn = dataSource.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertUser(userDto userDto) {
		int ri = 0;
		
		String query = "insert into byemeUser values (?,?,?,?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userDto.getUserId());
			pstmt.setString(2, userDto.getUserPassword());
			pstmt.setString(3, userDto.getUserName());
			pstmt.setString(4, userDto.getUserEmail());
			pstmt.executeUpdate();
			ri = userDao.MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int confirmId(String userId){
		int ri = 0;
		
		String query = "select userId from byemeUser where userId =?";
		
		try{
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				ri = userDao.MEMBER_EXISTENT;
			}else{
				ri = userDao.MEMBER_NONEXISTENT;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int login(String userId, String userPassword){
		int ri=0;
		String dbPw;
		
		String query="select userPassword from byemeUser where userId=?";
		
		try{
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbPw = rs.getString("userPassword");
				if(dbPw.equals(userPassword)){
					ri = userDao.MEMBER_LOGIN_SUCCESS;
				}else{
					ri = userDao.MEMBER_LOGIN_PW_NO_GOOD;
				}
			
			}else{
				ri = userDao.MEMBER_LOGIN_IS_NOT;
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		
	}
		return ri;
}	
	
		public userDto getMember(String userId) {
			String query = "select * from byemeUser where userId = ?";
			userDto dto = null;
			
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new userDto();
					dto.setUserId(rs.getString("userId"));
					dto.setUserPassword(rs.getString("userPassword"));
					dto.setUserName(rs.getString("userName"));
					dto.setUserEmail(rs.getString("userEmail"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return dto;
		}
		
		public int updateUser(userDto userDto) {
			int ri = 0;
			String query = "update byemeUser set userPassword=?, userName=?, userEmail=? where userId=?";
			
			try {
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userDto.getUserPassword());
				pstmt.setString(2, userDto.getUserName());
				pstmt.setString(3, userDto.getUserEmail());
				pstmt.setString(4, userDto.getUserId());
				ri = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return ri;
			
		}
		
		public void delete(String userId){
			String query ="delete from byemeUser where userId=?";
			try{
				int ri = 0;
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				ri = pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					pstmt.close();
					conn.close();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}

		  
    /**
     * 아이디 중복체크를 한다.
     * @param id 아이디
     * @return x : 아이디 중복여부 확인값
     */
    public boolean duplicateIdCheck(String userId)
    {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean x= false;
        
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT userId FROM byemeUser WHERE userId=?");
                        
            conn = dataSource.getConnection();
            pstm = conn.prepareStatement(query.toString());
            pstm.setString(1, userId);
            rs = pstm.executeQuery();
            
            if(rs.next()) x= true; //해당 아이디 존재
            
            return x;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstm != null ){ pstm.close(); pstm=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end duplicateIdCheck()
    


	
}
