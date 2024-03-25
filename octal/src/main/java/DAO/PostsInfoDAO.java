package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DO.PostsInfoDO;

public class PostsInfoDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;

	public PostsInfoDAO() {
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";

		if (conn == null) {
			try {
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, "scott", "tiger");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// UserInfoDO로부터 하나의 행정보를 매개변수로 받아옴
	public int insertPostsInfo(PostsInfoDO postsDO) {
		int rowCount = 0;

		sql = "insert into POSTS(hash, postNum, title, regDate, updateDate, userId, content, views, recomm)"
				+ "values(?, postSequence.NEXTVAL, ?, sysdate, null, ?, ?, 0, 0)";
//postSequence 만드는 법??
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postsDO.getHash());
			// hash가 문제임. mbti+postNum 구조인데, postNum이 당장 안 생김
			pstmt.setString(2, postsDO.getTitle());
			pstmt.setString(3, postsDO.getUserId());
			pstmt.setString(4, postsDO.getContent());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return rowCount;
	}

	// 조건없이 전체결과를 반환하니 매개변수없어야함, 반환값은 UserInfoDO를 담는 ArrayList
	public ArrayList<PostsInfoDO> getAllPostsInfo() {
		ArrayList<PostsInfoDO> postList = new ArrayList<PostsInfoDO>();
		sql = "select hash, postNum, title, regDate, updateDate, userId, content, views, recomm from POSTS";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				PostsInfoDO postsDO = new PostsInfoDO();
				postsDO.setHash(rs.getString("hash"));
				postsDO.setPostNum(rs.getInt("postNum"));
				postsDO.setTitle(rs.getString("title"));
				postsDO.setRegDate(rs.getDate("regDate"));
				postsDO.setUpdateDate(rs.getDate("updateDate"));
				postsDO.setUserId(rs.getString("userId"));
				postsDO.setContent(rs.getString("content"));
				postsDO.setViews(rs.getInt("views"));
				postsDO.setRecomm(rs.getInt("recomm"));

				postList.add(postsDO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return postList;
	}
}
