<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<title>MBTIROR : MBTI + MIRROR</title>
<link rel="stylesheet" href="./css/home.css">
<link rel="stylesheet" href="./css/header.css">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div>
		<jsp:include page="header.jsp" />

		<div class="container">
			<%-- <jsp:include page="boardLink.jsp" /> --%>
			<%-- <%= session.getAttribute("container") %> --%>
			<%-- <jsp:include page="${ sessionScope.container }" /> --%>
			<jsp:include page="${ container }" />     
		</div>

		<footer>
			<div class="foot" id="foot">
				<a> 임성수 - </a> <a> 김진성 - </a> <a> 배건욱 </a> <!-- <a> - 조혜진 </a> -->
			</div>
		</footer>
	</div>
</body>
</html>
