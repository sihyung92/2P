<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css" />
    <script type="text/javascript" href="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" href="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>
    <script type="text/javascript">
    	$('document').ready(function(){
    		$('button[type="button"]').click(function(){
    			window.history.back();
    			
    		});	
    	});
    </script>
<title>Insert title here</title>
<style type="text/css">
	textarea{
		
	}

</style>
</head>
<body>
	<h1>입력페이지</h1>
	<form action="" method="post">
		<input type="text"/>
		<textarea name="content"></textarea>
		<input type="submit" value="완료"/>
		<input type="submit" value="취소"/>
			
	
	
	
	</form>
</body>
</html>