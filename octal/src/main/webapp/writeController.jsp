<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <jsp:useBean id="LoginBean" class="LoginBean" />
<jsp:setProperty name="LoginBean" property="*" /> --%>
<jsp:useBean id="postsInfoDO" class="DO.PostsInfoDO" scope="session" />
<jsp:useBean id="postsInfoDAO" class="DAO.PostsInfoDAO" scope="session" />


<%
String viewPath = "/WEB-INF/views/";
String loginBtn = "<a href='./loginController.jsp' class='loginBtn'>Log In</a>";
String logoutBtn = "<form method='post'><input type='hidden' name='command' value='logout'><button type='submit'>Log Out</button></form>";

/* if(session.getAttribute("isLogin") == true) {
	loginBtn = 
} */

if (session.getAttribute("loginId") == null) {
	/* 로그인 정보가 없는 경우 로그인 페이지로 이동 */
	response.sendRedirect("loginController.jsp");

} else if (session.getAttribute("loginId") != null) {
	loginBtn = session.getAttribute("loginId") + "님 환영합니다!";
	session.setAttribute("loginBtn", loginBtn);
	session.setAttribute("logoutBtn", logoutBtn);

	if (request.getMethod().equals("POST") && request.getParameter("command") != null) {
		if (request.getAttribute("command").equals("logout")) {
			//logout 버튼 클릭 시, 로그인 정보 삭제 및 홈 페이지로 연결
			session.removeAttribute("loginId");
			session.removeAttribute("loginBtn");
			response.sendRedirect("homeController.jsp");
		} else if (request.getParameter("command") == "edit") {
			//view에서 수정버튼을 눌러서 온 거면 수정 페이지로 연결
			session.removeAttribute("command"); // 페이지 이동 전 command 저장된 값 삭제. 추후 잘못 진입하지 않게.
			pageContext.forward(viewPath + "edit.jsp");
		} else if (request.getParameter("command") == "resister") {
			//wrtie에서 등록버튼을 눌러서 온 거면 글 정보를 db에 저장
			//postsInfoDO.setHash();
			postsInfoDO.setTitle(request.getParameter("title"));
			postsInfoDO.setTitle(request.getParameter("title"));
			postsInfoDO.setTitle(request.getParameter("title"));
			postsInfoDO.setTitle(request.getParameter("title"));
			postsInfoDO.setTitle(request.getParameter("title"));
		}
	} else {
		//이도 저도 아니면 쓰기 페이지로 연결
		pageContext.forward(viewPath + "write.jsp");
	}
}
%>