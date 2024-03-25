<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MBTIROR : MBTI + MIRROR</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="./css/header.css">
    <script src="./js/edit.js"></script>
    <script src="./js/list.js"></script>
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
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" id="title" placeholder="글 제목을 입력해주세요." value=""></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" id="writer" placeholder="글쓴이를 입력해주세요." value=""></dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd><input type="password" id="passwd" placeholder="비밀번호를 입력해주세요." value=""></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용을 입력해주세요." value="" id="content" rows="30" cols="50">
                        
                    </textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <button id="edit">수정</button>
                <button id="previousView">이전</button>
            </div>
        </div>
    </div>
</body>
</html>