package comments;

import java.sql.*;
import java.util.ArrayList;

public class commentsDao {

	private Connection conn;
	private ResultSet rs;
	
	public commentsDao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID="scott";
			String dbPassword="tiger";
			Class.forName("com.mysql.jdbc.Driver");
			
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL="select now()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL="SELECT commentNum from COMMENT order by commentNum DESC";//마지막 게시물 반환
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String content, String userid, int commentNum) {
		String SQL="insert into COMMENT VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentNum);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userid);
			pstmt.setInt(4, 1);
			pstmt.setString(5, getDate());
			pstmt.setString(6, content);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

	//특정한 리스트를 받아서 반환
	
	public ArrayList<commentsDo> getList(int hash){
		String SQL="SELECT * from comment where commentNum = ? AND commentAvailable = 1 order by CommentNum desc limit 10";
		ArrayList<commentsDo> list = new ArrayList<commentsDo>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, hash);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				commentsDo comment = new commentsDo();
			
	
				list.add(comment);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;//댓글 리스트 반환
	}
	
	//댓글 내용 불러오기
	
	public commentsDo getComment(int userid) {
		String SQL="SELECT * from comment where userid = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, userid);
			rs=pstmt.executeQuery();//select
			if(rs.next()) {//결과가 있다면
				commentsDo comment = new commentsDo();
			    comment.setUserid(rs.getNString(SQL));
				return comment;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
