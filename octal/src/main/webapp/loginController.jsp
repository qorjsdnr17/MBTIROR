<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, java.text.SimpleDateFormat, DAO.*" %>

<jsp:useBean id="userInfoBean" class="DAO.UserInfoDAO" scope="session" />
<jsp:setProperty name="userInfoBean" property="*" />

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}

	String viewPath = "/WEB-INF/views/";
	String command = request.getParameter("command");
	UserInfoDAO userDAO = (UserInfoDAO) session.getAttribute("userDAO");

	if(userDAO == null){
		userDAO = new UserInfoDAO();
		session.setAttribute("userDAO", userDAO);
	}
	
	if(session.getAttribute("loginId") == null){
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "login.jsp");
			
		}else if(request.getMethod().equals("POST") && command != null && command.equals("login")){
			if(userDAO.checkLogin(request.getParameter("userId"), request.getParameter("passWd"))){
				session.setAttribute("loginId", request.getParameter("userId"));
				
				// System.out.println("로그인 성공");
				
				response.sendRedirect("homeController.jsp"); // 로그인 성공하고 파라미터를 가져가고 home.jsp 이동
				
			}else{
				// System.out.println("로그인 실패");
				
				response.sendRedirect("loginController.jsp"); // 로그인 인증실패하고 파라미터를 가져가지못하고 home.jsp 이동
			}
		}else if(request.getMethod().equals("POST") && command != null && command.equals("join")) {
			
			response.sendRedirect("joinController.jsp"); // join 버튼눌러서 파라미터 가져가지않고 join.jsp 이동
			// System.out.println("회원가입버튼");
		}else {
			// System.out.println("그 외의 경우");
			pageContext.forward("homeController.jsp"); // 그 외의 경우에는 home.jsp 이동
			
		}
	}	
	
	
	
%>