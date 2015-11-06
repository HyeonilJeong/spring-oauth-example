<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<%-- Set contextPath in variable --%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="pragma" content="no-cache" />
	
	<title>Authentication</title>

	<script src="${contextPath}/resources/lib/jquery/jquery-2.1.4.min.js"></script>
	
	<style>
		#table_employee {
			margin-top: 20px;
			border-collapse: collapse;
		}
		
		#table_employee th,
		#table_employee td {
			border: 1px solid #000;
		}
	</style>
</head>
<body>
	<form id="login_form" action="${contextPath}/oauth/token" method="post">
		<!-- grant type -->
		<input type="hidden" name="grant_type" value="password" />
		<!-- Client information -->
		<input type="hidden" name="client_id" value="myapp" />
		<input type="hidden" name="client_secret" value="myapp_secret" />
		<!-- csrf token -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table>
			<tr>
				<td>username</td>
				<td><input type="text" name="username" value="" /></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="password" value="" /></td>
			</tr>
		</table>
		<input type="button" onclick="onClickAuthentication();" value="submit" />
	</form>
	
	access_token: <label id="access_token"></label><br />
	refresh_token: <label id="refresh_token"></label><br />
	token_type: <label id="token_type"></label><br />
	expires_in: <label id="expires_in"></label><br />
	scope: <label id="scope"></label><br/><br/>
	
	<button type="button" onclick="onClickRequestEmployeeList();">Request Employee List</button>
	<table id="table_employee">
		<colgroup>
			<col width="50px" />
			<col width="150px" />
			<col width="150px" />
			<col width="50px" />
		</colgroup>
		<thead>
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Dept</th>
				<th>Age</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	<script>
		var contextPath = '${contextPath}';
		var accessToken = '';
		var refreshToken = '';
		
		function onClickAuthentication() {
			$.ajax({
				'url': $('#login_form').attr('action'),
				'data': $('#login_form input').serialize(),
				'type': 'POST',
				'dataType': 'json'
			}).done(function(res) {
				accessToken = res.access_token;
				refreshToken = res.refresh_token;
				
				$('#access_token').text(res.access_token);
				$('#refresh_token').text(res.refresh_token);
				$('#token_type').text(res.token_type);
				$('#expires_in').text(res.expires_in);
				$('#scope').text(res.scope);
			}).fail(ajaxFail);
		}
		
		function onClickRequestEmployeeList() {
			$.ajax({
				'url': contextPath + '/employee/employeeList',
				'data': {
					'access_token': accessToken,
					'refresh_token': refreshToken
				},
				'type': 'GET',
				'dataType': 'json'
			}).done(makeEmployeeList).fail(ajaxFail);
		}
		
		function ajaxFail(xhr) {
			var msg = xhr.status + ': ' + xhr.responseText;
			alert(msg);
		}
		
		function makeEmployeeList(employeeList) {
			var employeeRowBase = $('#template_employee_row').html();
			var tbodyHtml = '';
			
			for (var i=0, employee; employee = employeeList[i]; i++) {
				var rowHtml = employeeRowBase;
				
				rowHtml = rowHtml.replace('[no]', employee.no);
				rowHtml = rowHtml.replace('[name]', employee.name);
				rowHtml = rowHtml.replace('[dept]', employee.dept);
				rowHtml = rowHtml.replace('[age]', employee.age);
				
				tbodyHtml += rowHtml;
			}
			
			$('#table_employee tbody').html(tbodyHtml);
		}
	</script>
<script id="template_employee_row" type="text/html">
<tr>
	<td>[no]</td>
	<td>[name]</td>
	<td>[dept]</td>
	<td>[age]</td>
</tr>
</script>
</body>
</html>
