<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style type="text/css">
			.error {
				color: #FF0000;
			}
		</style>
		<title>DataBase サンプル 変更／削除</title>
	</head>
	<body>
		<h1>従業員変更／削除</h1>
		<hr />
		<p><a href="menu">メニューへ戻る</a></p>
		<hr />
		<p class="error">${errorMessage}</p>
		<form:errors path="*" element="div" cssClass="error" />
		<table border="1">
			<tr>
				<th>従業員ID</th>
				<th>従業員名</th>
				<th>携帯番号</th>
				<th>メールアドレス</th>
				<th>所属</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach var="emp" items="${changeEmployeesList}">
				<form:form modelAttribute="EmployeesModel">
					<tr>
						<td><c:out value="${emp.employee_id}" /></td>
						<td width="150"><c:out value="${emp.employee_name}" /></td>
						<td width="100"><c:out value="${emp.employee_phone}" /></td>
						<td width="200"><c:out value="${emp.employee_email}" /></td>
						<td><c:out value="${(emp.dept).department_name}" /></td>
						<td>
							<a href="edit?paramId=${emp.employee_id}">変更</a>
						</td>
						<td>
							<a href="delete?paramId=${emp.employee_id}">削除</a>
						</td>
					</tr>
				</form:form>
			</c:forEach>
		</table>
	</body>
</html>