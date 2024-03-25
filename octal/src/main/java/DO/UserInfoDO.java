package DO;

import java.util.*;

public class UserInfoDO {

	private int userNo;
	private String userId;
	private String passWd;
	private Date joinDate;
	private String email;
	private String mbti;
	
	public UserInfoDO(){
	}
	
	public UserInfoDO(int userNo, String userId, String passWd, Date joinDate, String email, String mbti){
		this.userNo = userNo;
		this.userId = userId;
		this.passWd = passWd;
		this.joinDate = joinDate;
		this.email = email;
		this.mbti = mbti;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassWd() {
		return passWd;
	}

	public void setPassWd(String passWd) {
		this.passWd = passWd;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	

	
	
}
