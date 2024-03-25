package DO;

import java.util.*;

public class CommentsInfoDO {

	private String hash;
	private int commentNum;
	private Date regDate;
	private Date updateDate;
	private String userId;
	private String content;
	private int recomm;
	
	public CommentsInfoDO(){
	
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
