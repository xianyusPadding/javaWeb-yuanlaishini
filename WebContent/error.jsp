<%@   page   contentType="text/html;charset=UTF-8"   %>     
<%@ page   pageEncoding="UTF-8"%>  
<%request.setCharacterEncoding("UTF-8");%> 
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta content= "text/html; charset=UTF-8 ">
</head>
<body>
<%out.print("<script type='text/javascript'>alert('"+session.getAttribute("message")+"');location.href='"+session.getAttribute("link")+"';</script>"); %>
</body>
</html>