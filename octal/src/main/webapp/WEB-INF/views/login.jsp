<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MBTIROR : MBTI + MIRROR</title>
<link rel="stylesheet" href="css/css.css" />
</head>
<style>
.text {
	background-color: aliceblue;
	border: 1px solid black;
	border-radius: 5px;
	height: 30px;
	width: 300px;
}

.name {
	text-align: left;
	font-size: 80%;
	position: relative;
}

.sign_up {
	width: 300px;
	height: 30px;
	background: blueviolet;
	border: 1px solid blueviolet;
	border-radius: 5px;
	transition: 0.25s;
}

.sign_up:active {
	background: blueviolet;
}

div {
	text-align: center;
}
</style>
<body>
	<form method="POST">
		<div class="back" id="back">
			<a href="./home.html"> <img src="./images/name.png"	width="270px;" height="100px" /></a>
		</div>

		<div class="board_wrap">
			<div>
				<h1 align="center">로그인 창</h1>
				<hr>
				<div>
					<label for="userId">아이디</label> <input class="text" type="text"
						name="userId" id="userId" placeholder="아이디를 입력해주세요"><br>
					<br>
				</div>
				<div>
					<label for="passWd">비밀번호</label> <input class="text"
						type="password" name="passWd" id="passWd"
						placeholder="비밀번호를 입력해주세요"><br>
					<br>
				</div>
			</div>
			<input type="hidden" name="command" value="login" /> 
			<input type="submit" value="login" />
		</div>
	</form>

	<form method="POST">
		<input type="hidden" name="command" value="join" />
		<input type="submit" value="join" />
	</form>

	<!--  <input type="hidden" name="command" value="logout" />
  	<input type="submit" value="logout"/>  -->

</body>
</html>