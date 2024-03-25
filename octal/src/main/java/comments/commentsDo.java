package comments;

import java.util.Date;

public class commentsDo {
	 private String hash;
	 
	 private int commentNum;
	 
	 private Date regDate;
	 
	 private Date updateDate;
	 
	 private String userid;
	 
	 private String content;
	 
	 private int recomm;
	 
	 public commentsDo() {
		 
	 }
	 
	 public commentsDo(String hash, int commentNum, Date regDate, Date updateDate, String userid, String contnet, int recomm) {
		 this.hash = hash;
		 this.commentNum = commentNum;
		 this.regDate = regDate;
		 this.updateDate = updateDate;
		 this.userid = userid;
		 this.content = content;
		 this.recomm = recomm;
		 
	 }

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRecomm() {
		return recomm;
	}

	public void setRecomm(int recomm) {
		this.recomm = recomm;
	}
	 
	 
}
