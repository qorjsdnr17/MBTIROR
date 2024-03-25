<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MBTIROR : MBTI + MIRROR</title>
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="./css/header.css">
<script src="js/write.js"></script>
<script src="js/list.js"></script>

</head>
<body>
	<div>
		<jsp:include page="header.jsp" />
	</div>
	<div class="board_wrap">
		<div class="board_title">
			<strong>ENFP 게시판</strong>
			<p>ENFP 친구들 안녕! 우리 같이 얘기할 생각 하니까 신나면서도 벌써 기 빨리는 거 알지?!</p>
		</div>
		<form action=writeController.jsp method="POST">
			<div class="board_write_wrap">

				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input id="title" name="title" type="text" placeholder="제목 입력">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input id="writer" name="writer" type="text"
									placeholder="글쓴이 입력">
								<!-- userId 출력으로 변 -->
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea id="content" name="content" placeholder="내용 입력"></textarea>
					</div>

				</div>
				<div class="bt_wrap">
					<input type="hidden" name="command" value="resister">
					<button type="submit">등록</button>

				</div>
		</form>
		<form action="listController.jsp">
			<button id="cancel" class>취소</button>
		</form>
	</div>
	</div>
</body>
</html>