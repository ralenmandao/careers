<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<ul>
	<c:forEach items="spittleList" var="spittle">
		<li id="spittle_<c:out value='spittle.id'/>">
			<div class="spittleMessage">
				<c:out value="spittle.message" />
			</div>
			<div>
				<span class="spittleTime"><c:out value="spittle.time" /></span>
			</div>
		</li>
	</c:forEach>
</ul>
</body>
</html>