<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<meta name="viewport" content="width=device-width, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />
	
	<title>Authentication</title>

	<script src="${contextPath}/resources/lib/jquery/jquery-2.1.4.min.js"></script>
</head>
<body>
	<form id="login_form" action="${contextPath}/oauth/token" method="post">
		<input type="hidden" name="grant_type" value="password" />
		<input type="hidden" name="client_id" value="restapp" />
		<input type="hidden" name="client_secret" value="restapp" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="scope" value="read,write,trust" />
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="username" value="" /></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="password" value="" /></td>
			</tr>
		</table>
		<input type="button" onclick="onClickAuthentication();" value="submit" />
	</form>
	
	<script>
		function onClickAuthentication() {
			$.ajax({
				'url': $('#login_form').attr('action'),
				'data': $('#login_form input').serialize(),
				'type': 'POST',
				'dataType': 'json'
			}).done(function(res) {
				console.log(res);
			}).fail(function(xhr) {
				var responseJSON = xhr.responseJSON;
				var msg = xhr.status + ': ' + responseJSON.error + '\n'
						+ responseJSON.error_description;
				alert(msg);
			});
		}
	</script>
</body>
</html>
