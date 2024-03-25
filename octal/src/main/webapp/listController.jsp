<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat, posts.*" %>
<jsp:useBean id="postsDao" class="posts.postsDao" scope="session" />
<jsp:setProperty name="postsDao" property="*" />

<%
  if(request.getMethod().equals("POST")){
    request.setCharacterEncoding("UTF-8");
  } 

  String viewPath = "/WEB-INF/views/";
  String command = request.getParameter("command");
  postsDao postsDAO = (postsDao) session.getAttribute("postsDao"); 

  if(postsDAO == null){
    postsDAO = new postsDao(); 
    session.setAttribute("postsDao", postsDAO); 
  }
  
  postsDo postsInfo = new postsDo();
  
  if(request.getMethod().equals("GET")){
    pageContext.forward(viewPath + "list.jsp");
  }else if(request.getMethod().equals("POST")){
  	pageContext.forward(viewPath + "list.jsp");
    try{
      String postNoParam = request.getParameter("postNum");
      if(postNoParam != null && !postNoParam.isEmpty()){
        postsInfo.setPostNum(Integer.parseInt(postNoParam));
      }
    }catch(NumberFormatException e){
      e.printStackTrace();
    }
    postsInfo.setPostTitle(request.getParameter("postTitle"));
    postsInfo.setPostUserid(request.getParameter("postUserid"));
    
    String postDateParam = request.getParameter("postDate");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date postDate = null;
    
    try{
      postDate = dateFormat.parse(postDateParam);
      postsInfo.setPostDate(postDate);
    }catch(Exception e){
      e.printStackTrace();
      return;
    }
    
    try{
      postsInfo.setPostViews(Integer.parseInt(request.getParameter("postViews")));
      postsInfo.setPostRecomm(Integer.parseInt(request.getParameter("postRecomm")));
    }catch(NumberFormatException e){
      e.printStackTrace();
      return;
    }
    
    postsDo result = postsDAO.getPosts(postsInfo);
 	
    int postCount = (result != null) ? 1 : 0;
    
    
    if(postCount > 0){
      pageContext.forward(viewPath + "list.jsp");
    }else{
      response.sendRedirect("homeController.jsp");
    }    
  }
%>