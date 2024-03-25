package posts;

import java.util.Date;

public class postsDo {

	private String hash;
	private int postNum;
	private String postTitle;
	private String postUserid;
	private Date postDate;
	private String postContent;
	private int postAvailable;
	private int postViews;
	private int postRecomm;

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostUserid() {
		return postUserid;
	}

	public void setPostUserid(String postUserid) {
		this.postUserid = postUserid;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostAvailable() {
		return postAvailable;
	}

	public void setPostAvailable(int postAvailable) {
		this.postAvailable = postAvailable;
	}

	public int getPostViews() {
		return postViews;
	}

	public void setPostViews(int postViews) {
		this.postViews = postViews;
	}

	public int getPostRecomm() {
		return postRecomm;
	}

	public void setPostRecomm(int postRecomm) {
		this.postRecomm = postRecomm;
	}

}