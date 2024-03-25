<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="comments.commentsDo" %>
<%@ page import="comments.commentsDao" %>
<%@ page import="posts.postsDo" %>
<%@ page import="posts.postsDao" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>MBTIROR : MBTI + MIRROR</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/css.css"> 
    <link rel="stylesheet" href="css/sns.css"> 
    <link rel="stylesheet" href="./css/header.css">

</head>
 
 

<body>
    
 <%
 		String userid =null;
 		  if(session.getAttribute("userid")!=null){
	 	  userid = (String)session.getAttribute("userid");
		 }
 		
 		  int postNum=0;
 	     if(request.getParameter("postNum")!=null)
 	    	 postNum=Integer.parseInt(request.getParameter("postNum"));
 	     postsDo postsInfo = new postsDo();
		
		postsDo posts = new postsDao().getPosts(postsInfo);
		
			int commentID = 0;
			if(request.getParameter("commentID")!=null)
			commentID=Integer.parseInt(request.getParameter("commentID"));
			commentsDo comments = new commentsDao().getComment(commentID);
		
	%>

	<div>
		<jsp:include page="header.jsp" />
	</div>

	<div class="board_wrap">
        
        <div class="board_title">
            <div class="board_title">
                <strong>ENFP 게시판</strong>
                <p>ENFP 친구들 안녕! 우리 같이 얘기할 생각 하니까 신나면서도 벌써 기 빨리는 거 알지?!</p>
            </div>
        </div>
        
        <div class="board_view_wrap">
            <div class="board_view">

                <div class="title">
                    <dl>
                        <dt></dt>
                        <dd id="title"></dd>
                    </dl>
                </div>     

                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd colspan=“2” id=“postNum”><%= (posts != null) ? posts.getPostNum() :"" %></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                         <dd colspan=“2” id=userid><%= (posts != null) ? posts.getPostUserid() :"" %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd colspan="2" id="date"><%= (posts != null) ? posts.getPostDate():"" %>></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd id="view"></dd>
                        <dd colspan="2" id="view"><%= (posts != null) ? posts.getPostViews():"" %>></dd>
                    </dl>
                    <dl>
                        <dt>추천</dt>
                        <dd id="recommValue">0</dd>
                        <dd colspan="2" id="recome"><%= (posts != null) ? posts.getPostRecomm():"" %>></dd>
                    </dl>

                </div>

                <div class="cont">
                </div>
            </div>
                      
            <div class="bt_wrap">
                <a href="listController.jsp" class="on" id="on">목록</a>
                <form action="writeController.jsp" method="post">
                	<input type="hidden" name="command" value="edit">
                	<button type="submit">수정</button>
                </form>
                
            </div>
            <br/><br/>
            <hr/>
            <br/>

            <div id="form-commentInfo">
                <div id="comment-count">댓글 <span id="count">0</span></div>

                <label for="name">이름</label>
                <input type="text" id="name" placeholder="이름"/>
             
                <label for="passwd">비밀번호</label>
                <input type="password" id="passwd" placeholder="비밀번호"/>
                <br />

                <input id="comment-input" placeholder="댓글을 입력해 주세요.">
                <button id="submit">등록</button>
            </div>
            <div id=comments>
        
            </div>

            <div> 
                <ul class="sns" >

                    <li class="facebook">
                        <a href="#n" onclick="fn_sendFB('facebook');return false;" class="facebook" target="_self" title="facebook-share">
                            <span class="skip"><img src="./images/snsIcon/icon-facebook.png"/></span>
                        </a>
                    </li>
                    
                    <li class="twitter">
                        <a href="#n" onclick="fn_sendFB('twitter');return false;" class="twitter" target="_self" title="twitter-share">
                            <span class="skip"><img src="./images/snsIcon/icon-twitter.png"/></span>
                        </a>
                    </li>

                    <li class="band">
                        <a href="#n" onclick="fn_sendFB('band');return false;" class="band" target="_self" title="naverband-share">
                            <span class="skip"><img src="./images/snsIcon/icon-naverband.png"/></span>
                        </a>
                    </li>
                </ul>       
            </div>


        </div>
    </div>
   
    
</body>
</html>