<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul id="roletree"></ul>
<input type="hidden" value="${userid}" id="useridss">
<script type="text/javascript">
$(function(){
	var getuserid = $("#useridss").val();
	//树
	$('#roletree').tree({
		url:'<%=request.getContextPath()%>/showall/selectusertorole?userid='+getuserid,
		checkbox:true
	});  
});


</script>
</body>
</html>