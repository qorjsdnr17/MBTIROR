package DAO;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import DO.CommentsInfoDO;

public class CommentsInfoDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public CommentsInfoDAO() {
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
	
		if(conn == null){
			try{
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, "scott", "tiger");
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	// UserInfoDO로부터 하나의 행정보를 매개변수로 받아옴
	public int insertPostsInfo(CommentsInfoDO commentsDO) {
		int rowCount = 0;
					
		sql = "insert into user_info (hash, commentNum, regDate, updateDate, userId, content, recomm)" + "values(?, ?, to_date(?, 'YYYY-MM-DD HH24:MI:SS'), to_date(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?, ?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentsDO.getHash());
			pstmt.setInt(2, commentsDO.getCommentNum());
			pstmt.setDate(3, (Date) commentsDO.getRegDate());
			pstmt.setDate(4, (Date) commentsDO.getUpdateDate());
			pstmt.setString(5, commentsDO.getUserId());
			pstmt.setString(6, commentsDO.getContent());
			pstmt.setInt(7, commentsDO.getRecomm());
			
			rowCount = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null){
				try{
					pstmt.close();
					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		return rowCount;
	}
	
	// 조건없이 전체결과를 반환하니 매개변수없어야함, 반환값은 UserInfoDO를 담는 ArrayList
	public ArrayList<CommentsInfoDO> getAllCommetsInfo() {
		ArrayList<CommentsInfoDO> commentList = new ArrayList<CommentsInfoDO>();
		sql = "select hash, commentNum, regDate, updateDate, userId, content, recomm from COMMENTS";
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				CommentsInfoDO postsDO = new CommentsInfoDO();
				postsDO.setHash(rs.getString("hash"));
				postsDO.setCommentNum(rs.getInt("commentNum"));
				postsDO.setRegDate(rs.getDate("regDate"));
				postsDO.setUpdateDate(rs.getDate("updateDate"));
				postsDO.setUserId(rs.getString("userId"));
				postsDO.setContent(rs.getString("content"));
				postsDO.setRecomm(rs.getInt("recomm"));
				
				commentList.add(postsDO);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(stmt != null){
				try{
					stmt.close();
					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		return commentList;
	}
}
