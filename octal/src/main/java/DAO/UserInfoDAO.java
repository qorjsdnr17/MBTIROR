package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DO.UserInfoDO;

public class UserInfoDAO {

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;

	public UserInfoDAO() {
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
	public int insertUserInfo(UserInfoDO userDO) {
		int rowCount = 0;

		sql = "insert into USERINFO (userNo, userId, passWd, joinDate, email, mbti)"
				+ "values (userSequence.NEXTVAL, ?, ?, sysdate, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userDO.getUserId());
			pstmt.setString(2, userDO.getPassWd());
			pstmt.setString(3, userDO.getEmail());
			pstmt.setString(4, userDO.getMbti());

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
	public ArrayList<UserInfoDO> getAllUserInfo() {
		ArrayList<UserInfoDO> userList = new ArrayList<UserInfoDO>();
		sql = "select userNo, userId, passWd, to_date(joinDate, 'YYYY-MM-DD HH24:MI:SS') joinDate, email, mbti from USERINFO";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				UserInfoDO userDO = new UserInfoDO();
				userDO.setUserNo(rs.getInt("userNo"));
				userDO.setUserId(rs.getString("userId"));
				userDO.setPassWd(rs.getString("passWd"));
				userDO.setJoinDate(rs.getDate("joinDate"));
				userDO.setEmail(rs.getString("email"));
				userDO.setMbti(rs.getString("mbti"));

				userList.add(userDO);
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

		return userList;
	}

	public boolean deleteUserInfo(int userNo) {
		int rowCount = 0;

		// 삭제 쿼리
		String sql = "DELETE FROM USERINFO WHERE userNo = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			rowCount = pstmt.executeUpdate();

			// rowCount가 1 이상인 경우에만 성공으로 간주
			return rowCount > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false; // 삭제 실패의 경우

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public boolean checkLogin(String userId, String passPw) {
		boolean result = false;

		try {
			// 사용자 아이디를 사용하여 데이터베이스에서 사용자 정보를 조회
			String sql = "SELECT userId, passWd FROM USERINFO WHERE userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			// 조회 결과가 있으면 비밀번호 확인
			if (rs.next()) {
				String dbPasswd = rs.getString("passWd");

				// 데이터베이스의 비밀번호와 입력된 비밀번호를 비교
				if (passPw.equals(dbPasswd)) {
					result = true; // 비밀번호가 일치하면 로그인 성공
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return result;
	}

}
