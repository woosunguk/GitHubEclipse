<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "Video.videolist_DAO" %>
<%@ page import = "Video.videolist_DTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/foundation.css" />

<script src="js/play.js"></script>
<title>Insert title here</title>
</head>
<body>
<%

%>
<iframe width="640" height="360" id="video"
	src="https://www.youtube.com/embed/ksOwJHLeHpM?autoplay=1" 
	frameborder="0"
	autoplay="1" 
	allowfullscreen>
</iframe>

<div class="large-4 medium-4 columns">
        <h5>100 VIDEO</h5>
        <p>
        <%
	    	videolist_DAO videolist_dao = videolist_DAO.getInstance();
	    	List<videolist_DTO> list_DTO = new ArrayList<videolist_DTO>();
	    	list_DTO = videolist_dao.get_url_list();
	       	for(int i=0; i<list_DTO.size(); i++){ 
        %>
	        <a class="small button"><%=list_DTO.get(i).getArtist()%> - <%=list_DTO.get(i).getTitle() %></a>
	        <a onClick="changeIt('<%=list_DTO.get(i).getUrl() %>');" class="medium success button">play</a><br/>
		<%
	       	}
		%>
        </p>
                   
        <div class="panel">
          <h5>So many components, girl!</h5>
          <p>A whole kitchen sink of goodies comes with Foundation. Check out the docs to see them all, along with details on making them your own.</p>
          <a href="http://foundation.zurb.com/docs/" class="small button">Go to Foundation Docs</a>          
        </div>
</div>

<form name="form1">
  <select name="menu1" onChange="changeIt(this); return false">
    <option></option>
    <option value="https://www.youtube.com/embed/ksOwJHLeHpM?autoplay=1">11111</option>
    <option value="https://www.youtube.com/embed/M8MrF-dNzzs?autoplay=1">22222</option>
  </select>
</form>
</body>
</html>