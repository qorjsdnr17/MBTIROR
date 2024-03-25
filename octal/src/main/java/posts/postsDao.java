package posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class postsDao {

	private Connection conn;
	private ResultSet rs;

	public postsDao() {
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

	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "SELECT postNum from POSTS order by postNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int postInfo(String hash, String title, String userid, String content, int view, int recom) {
		int postCount = 0;

		String SQL = "INSERT INTO POSTS VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());// 게시글 번호
			pstmt.setString(2, hash);
			pstmt.setString(3, title);// 제목
			pstmt.setString(4, userid);// 아이디
			pstmt.setString(5, getDate());// 날짜
			pstmt.setString(6, content);// 내용;
			pstmt.setInt(7, 1); // Available
			pstmt.setInt(8, view);// 조회 수
			pstmt.setInt(9, recom);// 추천 수

			postCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return postCount;
	}

	public ArrayList<postsDo> getList(int pageNumber) {
		String SQL = "SELECT * FORM POSTS WHERE POSTNUM <? AND postAvailable = 1 order by postNum desc limit 10";
		ArrayList<postsDo> list = new ArrayList<postsDo>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				postsDo posts = new postsDo();
				posts.setPostNum(rs.getInt(1));
				posts.setHash(rs.getString(2));
				posts.setPostTitle(rs.getString(3));
				posts.setPostUserid(rs.getString(4));
				posts.setPostDate(rs.getDate(5));
				posts.setPostContent(rs.getString(6));
				posts.setPostAvailable(rs.getInt(7));
				posts.setPostViews(rs.getInt(8));
				posts.setPostRecomm(rs.getInt(9));
				list.add(posts);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCount() {
		String SQL = "select count(*) from posts";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * from posts where postUserid < ? AND postAvailable =1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public postsDo getPosts(postsDo postsInfo) {
		String SQL = "SELECT * from posts where postNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postsInfo.getPostNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				postsDo posts = new postsDo();
				posts.setPostNum(rs.getInt(1));
				posts.setPostTitle(rs.getString(2));
				posts.setPostUserid(rs.getString(3));
				posts.setPostDate(rs.getDate(4));
				posts.setPostContent(rs.getString(5));
				posts.setPostAvailable(rs.getInt(6));
				int postview = rs.getInt(7);
				posts.setPostViews(postview);
				postview++;
				countUpdate(postview, postsInfo.getPostNum());

				posts.setPostRecomm(rs.getInt(8));
				return posts;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int countUpdate(int postview, int postNum) {
		String SQL = "update posts set postview = ? where postNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postview);// 물음표의 순서
			pstmt.setInt(2, postNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int update(int postNum, String postTitle, String postContent) {
		String SQL = "update posts set postTitle = ?, postContent = ? where postNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, postContent);
			pstmt.setInt(3, postNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int delete(int postNum) {
		String SQL = "update posts set postAvailable = 0 where postNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}

	public int postRecomm(int postNum) {
		String SQL = "update posts set postRecomm = postRecomm + 1 where postNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<postsDo> getSearch(String postSearch, String postText) {
		ArrayList<postsDo> list = new ArrayList<postsDo>();
		String SQL = "select * from posts WHERE " + postSearch.trim();
		try {
			if (postText != null && !postText.equals("")) {
				SQL += " postRecomm '%" + postText.trim() + "%' order by postNum desc limit 10";
			}

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				postsDo posts = new postsDo();
				posts.setPostNum(rs.getInt(1));
				posts.setPostTitle(rs.getString(2));
				posts.setPostUserid(rs.getString(3));
				posts.setPostDate(rs.getDate(4));
				posts.setPostContent(rs.getString(5));
				posts.setPostAvailable(rs.getInt(6));
				posts.setPostViews(rs.getInt(7));
				posts.setPostRecomm(rs.getInt(8));
				list.add(posts);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}