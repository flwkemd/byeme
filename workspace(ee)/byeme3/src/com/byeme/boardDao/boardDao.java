package com.byeme.boardDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.byeme.boardDto.boardCommentDto;
import com.byeme.boardDto.boardDto;

public class boardDao {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DataSource dataSource;
		
		
		public boardDao() {
			try{
				Context context = new InitialContext();
				dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		

		public int getNext(){
			try{
				conn = dataSource.getConnection();
				String query = "SELECT bId FROM byemeBoard ORDER BY bId DESC";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				if(rs.next()){
					return rs.getInt(1)+1;
				}
				return 1; //첫번째 게시물일 경우
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1; 
		}
		
		public int write(String bTitle, String userId, String bContent) {
			Connection conn = null;
			PreparedStatement pstmt = null;

			try{
				conn = dataSource.getConnection();
				String query = "insert into byemeBoard (bId, bTitle, userId, bContent, bHit, bGroup, bStep, bIndent, bAvailable) values (?, ?, ?, ?, 0, 0, 0, 0, 1 )";
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bTitle);
				pstmt.setString(3, userId);
				pstmt.setString(4, bContent);
			
				return pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e2){
					e2.printStackTrace();
				}
			} return -1;
		}

		public boolean nextPage(int pageNumber){

			try{
				conn = dataSource.getConnection();
				String query = "select * from (select * from byemeBoard where bId < ? order by bId desc) where ROWNUM <= 10";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, getNext()-(pageNumber-1)*10);
				rs = pstmt.executeQuery();
				if(rs.next()){
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return false; 
			
			}

		public boardDto contentView(int strId) {

			upHit(strId);
			
			boardDto dto = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			

			try {
				conn = dataSource.getConnection();
				String query = "select * from byemeBoard where bId = ?";
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, strId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int bId = rs.getInt("bId");
					String bTitle = rs.getString("bTitle");
					String userId = rs.getString("userId");
					String bContent = rs.getString("bContent");
					Timestamp bDate = rs.getTimestamp("bDate");
					int bHit = rs.getInt("bHit");
					int bGroup = rs.getInt("bGroup");
					int bStep = rs.getInt("bStep");
					int bIndent = rs.getInt("bIndent");
					int bAvailable = rs.getInt("bAvailable");
					
					dto = new boardDto(bId, bTitle, userId, bContent, bDate, bHit, bGroup, bStep, bIndent, bAvailable);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return dto;
		}
		


		public void upHit(int bId) {

			Connection conn = null;
			PreparedStatement pstmt = null;
			

			try {
				conn = dataSource.getConnection();
				String query = "update byemeBoard set bHit = bHit + 1 where bId = ?";
			
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, bId);
				
				int rn = pstmt.executeUpdate();
						
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
			


		public void delete(int bId) {
				try {
					conn = dataSource.getConnection();
					String query = "delete from byemeBoard where bId = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, bId);
					int rn = pstmt.executeUpdate();
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					try {
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch (Exception e2) {
						// TODO: handle exception
						e2.printStackTrace();
					}
				}
			}
			
		public ArrayList<boardDto> list(int pageNumber) {
			
			ArrayList<boardDto> dtos = new ArrayList<boardDto>();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;


			try {
				conn = dataSource.getConnection();
				String query = "select * from (select level, bId, btitle, userid, bcontent, bdate, bhit, bgroup, bstep, bindent, bavailable from byemeBoard where bId < ? START WITH bgroup = 0 CONNECT BY PRIOR BID = bGroup ORDER SIBLINGS BY bId desc) WHERE ROWNUM <= 10";

				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, getNext()-(pageNumber-1)*10);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					int bId = rs.getInt("bId");
					String bTitle = rs.getString("bTitle");
					String userId = rs.getString("userId");
					String bContent = rs.getString("bContent");
					Timestamp bDate = rs.getTimestamp("bDate");
					int bHit = rs.getInt("bHit");
					int bGroup = rs.getInt("bGroup");
					int bStep = rs.getInt("bStep");
					int bIndent = rs.getInt("bIndent");
					int bAvailable = rs.getInt("bAvailable");
					
					boardDto dto = new boardDto(bId, bTitle, userId, bContent, bDate, bHit, bGroup, bStep, bIndent, bAvailable);
					dtos.add(dto);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return dtos;
		}


		public int modify(int bId, String bTitle, String bContent) {
			
			String query ="update byemeBoard set bTitle=?, bContent=? where bId=?";
			try{
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bTitle);
				pstmt.setString(2, bContent);
				pstmt.setInt(3, bId);
				return pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return -1;
		}
			

		public void reply(int bId, String bTitle, String userId, String bContent, int bGroup, int bStep, int bIndent) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			replyShape(bGroup, bStep);
			
			try {
				conn = dataSource.getConnection();
				String query = "insert into byemeBoard (bId, bTitle, userId, bContent, bHit, bGroup, bStep, bIndent, bAvailable) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bTitle);
				pstmt.setString(3, userId);
				pstmt.setString(4, bContent);
				pstmt.setInt(5, 0);
				pstmt.setInt(6, bGroup);
				pstmt.setInt(7, bStep + 1);
				pstmt.setInt(8, bIndent + 1);
				pstmt.setInt(9, 1);
				
				int rn = pstmt.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			
		}
		
		private void replyShape( int bGroup, int bStep) {
			// TODO Auto-generated method stub
			
			try {
				conn = dataSource.getConnection();
				String query = "update byemeBoard set bStep = bStep + 1 where bGroup = ? and bStep > ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, bGroup);
				pstmt.setInt(2, bStep);
				
				int rn = pstmt.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}


		public boardDto reply_view(String bId) {
			// TODO Auto-generated method stub
			return null;
		}

		public ArrayList<boardDto> searchBoard(String col, String word, int pageNumber){
			ArrayList<boardDto> dtos = new ArrayList<boardDto>();
			try{
				conn = dataSource.getConnection();
				if(col.equals("none")){
					String query = "select * from (select * from byemeBoard where bId < ? order by bId desc) where bTitle like ? or userId like ? or bContent like ? AND ROWNUM <= 10";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, 100);
					pstmt.setString(2, "%"+word+"%");
					pstmt.setString(3, "%"+word+"%");
					pstmt.setString(4, "%"+word+"%");

					
				}else if(col.equals("userId")){
					String query = "select * from (select * from byemeBoard where bId < ? order by bId desc) where userId like ? AND ROWNUM <= 10";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, 100);
					pstmt.setString(2, "%"+word+"%");
					
				}else if(col.equals("bTitle")){
					String query = "select * from (select * from byemeBoard where bId < ? order by bId desc) where bTitle like ? AND ROWNUM <= 10";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, 100);
					pstmt.setString(2, "%"+word+"%");
					
				}else if(col.equals("bContent")){
					String query = "select * from (select * from byemeBoard where bId < ? order by bId desc) where bContent like ? AND ROWNUM <= 10";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, 100);
					pstmt.setString(2, "%"+word+"%");
					
				}else{
					String query = "select * from (select * from byemeBoard where bId < ? order by bId desc) where bTitle like? or bContent like ? AND ROWNUM <= 10";
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, 100);
					pstmt.setString(2, "%"+word+"%");
					pstmt.setString(3, "%"+word+"%");
				}
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					int bId = rs.getInt("bId");
					String bTitle = rs.getString("bTitle");
					String userId = rs.getString("userId");
					String bContent = rs.getString("bContent");
					Timestamp bDate = rs.getTimestamp("bDate");
					int bHit = rs.getInt("bHit");
					int bGroup = rs.getInt("bGroup");
					int bStep = rs.getInt("bStep");
					int bIndent = rs.getInt("bIndent");
					int bAvailable = rs.getInt("bAvailable");
					
					boardDto dto = new boardDto(bId, bTitle, userId, bContent, bDate, bHit, bGroup, bStep, bIndent, bAvailable);
					dtos.add(dto);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return dtos;
		}

		 public int getSeq() 
		    {
		        int result = 1;
		        try {
		            conn = dataSource.getConnection();
		            
		            // 시퀀스 값을 가져온다. (DUAL : 시퀀스 값을 가져오기위한 임시 테이블)
		            StringBuffer sql = new StringBuffer();
		            sql.append("SELECT COMMENT_SEQ.NEXTVAL FROM DUAL");
		 
		            pstmt = conn.prepareStatement(sql.toString());
		            rs = pstmt.executeQuery(); // 쿼리 실행
		 
		            if (rs.next())    result = rs.getInt(1);
		 
		        } catch (Exception e) {
		            throw new RuntimeException(e.getMessage());
		        }
		 
		        close();
		        return result;
		    } // end getSeq
		    
		    
		    // 댓글 등록
		    public boolean insertComment(boardCommentDto dto)
		    {
		        boolean result = false;
		        
		        try {
		            conn = dataSource.getConnection();
		 
		            // 자동 커밋을 false로 한다.
		            conn.setAutoCommit(false);
		            
		            StringBuffer sql = new StringBuffer();
		            sql.append("INSERT INTO BYEMEBOARD_COMMENT");
		            sql.append(" (COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE");
		            sql.append(" , COMMENT_PARENT, COMMENT_CONTENT)");
		            sql.append(" VALUES(?,?,?,sysdate,?,?)");
		    
		            pstmt = conn.prepareStatement(sql.toString());
		            pstmt.setInt(1, dto.getComment_num());
		            pstmt.setInt(2, dto.getComment_board());
		            pstmt.setString(3, dto.getComment_id());
		            pstmt.setInt(4, dto.getComment_parent());
		            pstmt.setString(5, dto.getComment_content());
		            
		            int flag = pstmt.executeUpdate();
		            if(flag > 0){
		                result = true;
		                conn.commit(); // 완료시 커밋
		            }
		            
		        } catch (Exception e) {
		            try {
		                conn.rollback(); // 오류시 롤백
		            } catch (SQLException sqle) {
		                sqle.printStackTrace();
		            } 
		            e.printStackTrace();
		            throw new RuntimeException(e.getMessage());
		        }
		        
		        close();
		        return result;    
		    } // end boardInsert();    
		    
		    // 댓글 목록 가져오기
		    public ArrayList<boardCommentDto> getCommentList(int bId)
		    {
		        ArrayList<boardCommentDto> list = new ArrayList<boardCommentDto>();
		        
		        try {
		            conn = dataSource.getConnection();
		            
		            /* 댓글의 페이지 처리를 하고싶다면 이 쿼리를 사용하면 된다.
		             * SELECT * FROM
		             *            (SELECT  ROWNUM AS rnum,
		             *                   data.*
		             *             FROM
		             *                   (SELECT LEVEL,
		             *                           COMMENT_NUM,
		             *                             COMMENT_BOARD,
		             *                           COMMENT_ID,
		             *                           COMMENT_DATE,
		             *                           COMMENT_PARENT,
		             *                           COMMENT_CONTENT
		             *                    FROM BOARD_COMMENT
		             *                    WHERE COMMENT_BOARD = ?
		             *                   START WITH COMMENT_PARENT = 0
		             *                   CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT) 
		             *              data)
		             *    WHERE rnum>=? and rnum<=? ;
		             */
		            
		            StringBuffer sql = new StringBuffer();
		            sql.append("    SELECT COMMENT_NUM, COMMENT_BOARD,");
		            sql.append("            COMMENT_ID, COMMENT_DATE,");
		            sql.append("            COMMENT_PARENT, COMMENT_CONTENT");
		            sql.append("    FROM BYEMEBOARD_COMMENT");
		            sql.append("    WHERE COMMENT_BOARD = ?");
		            sql.append("    START WITH COMMENT_PARENT = 0");
		            sql.append("    CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT");         
		            
		            pstmt = conn.prepareStatement(sql.toString());
		            pstmt.setInt(1, bId);
		            
		            rs = pstmt.executeQuery();
		            while(rs.next())
		            {
		                boardCommentDto dto = new boardCommentDto();
		                dto.setComment_num(rs.getInt("COMMENT_NUM"));
		                dto.setComment_board(rs.getInt("COMMENT_BOARD"));
		                dto.setComment_id(rs.getString("COMMENT_ID"));
		                dto.setComment_date(rs.getDate("COMMENT_DATE"));
		                dto.setComment_parent(rs.getInt("COMMENT_PARENT"));
		                dto.setComment_content(rs.getString("COMMENT_CONTENT"));
		                list.add(dto);
		            }
		                
		        } catch (Exception e) {
		            e.printStackTrace();
		            throw new RuntimeException(e.getMessage());
		        }
		        
		        close();
		        return list;
		    } // end getCommentList
		    
		    
		    public boardCommentDto getComment(int comment_num)
			{
				boardCommentDto comment = null;
				
				try {
					conn = dataSource.getConnection();
					
					StringBuffer sql = new StringBuffer();
					sql.append("SELECT * FROM BYEMEBOARD_COMMENT WHERE COMMENT_NUM = ?");
					
					pstmt = conn.prepareStatement(sql.toString());
					pstmt.setInt(1, comment_num);
					
					rs = pstmt.executeQuery();
					while(rs.next())
					{
						comment = new boardCommentDto();
						comment.setComment_num(rs.getInt("COMMENT_NUM"));
						comment.setComment_board(rs.getInt("COMMENT_BOARD"));
						comment.setComment_id(rs.getString("COMMENT_ID"));
						comment.setComment_date(rs.getDate("COMMENT_DATE"));
						comment.setComment_parent(rs.getInt("COMMENT_PARENT"));
						comment.setComment_content(rs.getString("COMMENT_CONTENT"));
					}
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
				
				close();
				return comment; 
			} // end getComment
		    
		 // 댓글 삭제
			public boolean deleteComment(int comment_num) 
			{
				boolean result = false;

				try {
					conn = dataSource.getConnection();
					conn.setAutoCommit(false); // 자동 커밋을 false로 한다.

					StringBuffer sql = new StringBuffer();
					sql.append("DELETE FROM BYEMEBOARD_COMMENT");
					sql.append(" WHERE COMMENT_NUM IN");
					sql.append(" (SELECT COMMENT_NUM");
					sql.append(" FROM BYEMEBOARD_COMMENT");
					sql.append(" START WITH COMMENT_NUM = ?");
					sql.append(" CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT) ");
					
					pstmt = conn.prepareStatement(sql.toString());
					pstmt.setInt(1, comment_num);
					
					int flag = pstmt.executeUpdate();
					if(flag > 0){
						result = true;
						conn.commit(); // 완료시 커밋
					}	
					
				} catch (Exception e) {
					try {
						conn.rollback(); // 오류시 롤백
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
					throw new RuntimeException(e.getMessage());
				}

				close();
				return result;
			} // end deleteComment	
			
			
			// 댓글 수정
			public boolean updateComment(boardCommentDto comment) 
			{
				boolean result = false;
				
				try{
					conn = dataSource.getConnection();
					conn.setAutoCommit(false); // 자동 커밋을 false로 한다.
					
					StringBuffer sql = new StringBuffer();
					sql.append("UPDATE BYEMEBOARD_COMMENT SET");
					sql.append(" COMMENT_CONTENT = ?");
					sql.append(" WHERE COMMENT_NUM = ?");

					pstmt = conn.prepareStatement(sql.toString());
					pstmt.setString(1, comment.getComment_content());
					pstmt.setInt(2, comment.getComment_num());

					int flag = pstmt.executeUpdate();
					if(flag > 0){
						result = true;
						conn.commit(); // 완료시 커밋
					}
					
				} catch (Exception e) {
					try {
						conn.rollback(); // 오류시 롤백
					} catch (SQLException sqle) {
						sqle.printStackTrace();
					}
					e.printStackTrace();
					throw new RuntimeException(e.getMessage());
				}
			
				close();
				return result;
			} // end updateComment	
				
			
			// DB 자원해제
			private void close()
			{
				try {
					if ( pstmt != null ){ pstmt.close(); pstmt=null; }
					if ( conn != null ){ conn.close(); conn=null;	}
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
			} // end close()	
				
		}








