<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="posts.postsDo"%>
<%@ page import="posts.postsDao"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MBTIROR : MBTI + MIRROR</title>
<link rel="stylesheet" href="css/css.css" />
<link rel="stylesheet" href="./css/header.css">
</head>

<body onload="listInit();">
	<div>
		<jsp:include page="header.jsp" />
	</div>
	<div class="board_wrap">

		<div class="board_title">
			<div class="board_wrap"></div>
			<br /> <br />
			<h2 id="title"></h2>
			<strong></strong>
		</div>

		<div class="board_list_wrap">
			<div class="container">
				<div class="board_list">
					<form method="post" action="listController">
						<table class="postTable">
							<input type="text" name="listInfo" />
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>추천수</th>
								</tr>
							</thead>
							<tbody>
								<%
/* 								int pageNumber = (Integer) session.getAttribute("pageNumber"); */
								int pageNumber = 1;

								postsDao postsDao = new postsDao();
								ArrayList<postsDo> list = postsDao.getList(pageNumber);
								for (int i = 0; i < list.size(); i++) {
								%>

								<tr>
									<td><%=list.get(i).getPostNum()%></td>
									<%--현재 게시글에 대한 정보 --%>
									<td><a
										href="view.jsp?postNum=<%=list.get(i).getPostNum()%>"><%=list.get(i).getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
									<td><%=list.get(i).getPostUserid()%></td>
									<%-- <td><%=list.get(i).getPostDate().substring(0, 11) + list.get(i).getPostDate().substring(11, 13) + "시" + list.get(i)
		.getPostDate().substring(14, 16) + "분"%></td> --%>
									<td><%=list.get(i).getPostViews()%></td>
									<td><%=list.get(i).getPostRecomm()%></td>
								</tr>

								<%
								}
								%>
							</tbody>
						</table>
					</form>

					<!-- 			<form method="post" action="listController"> -->
					<div class=container style="text-align: center">
						<%
						if (pageNumber != 1) {//이전페이지
						%>
						<a href="list.jsp?pageNumber= <%=pageNumber - 1%>">◀ 이전</a>
						<%
						} //이전 페이지
						%>
						<%
						int n = (int) (postsDao.getCount() / 10 + 1);
						for (int i = 1; i <= n; i++) { //현재 페이지
						%>
						<a href="list.jsp?pageNumber=<%=i%>">|<%=i%>|
						</a>
						<%
						} // 현재 페이지
						%>
						<%
						if (postsDao.nextPage(pageNumber + 1)) {//다음페이지
						%>
						<a href="list.jsp?pageNumber=<%=pageNumber + 1%>">다음 ▶</a>
						<%
						} //다음 페이지
						%>
						<a href="write.jsp" class="btn btn-success pull-right">글쓰기</a>
					</div>
					<!-- 			</form> -->

					<div id="article_list"></div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
