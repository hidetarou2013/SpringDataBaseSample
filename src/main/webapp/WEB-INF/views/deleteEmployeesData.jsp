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
		<title>DataBase サンプル 削除</title>
	</head>
	<body>
		<h1>従業員削除</h1>
		<hr />
		<p><a href="menu">メニューへ戻る</a></p>
		<hr />
		<p>下記の従業員を削除します。</p>
		<form:form>
			<table>
				<tr>
					<td>従業員ID：</td>
					<td>
						<c:out value="${deleteEmployeesData.employee_id}" />
						<input type="hidden" value="${deleteEmployeesData.employee_id}" name="employee_id" />
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>名前：</td>
					<td><c:out value="${deleteEmployeesData.employee_name}" /></td>
				</tr>
				<tr>
					<td>携帯番号：</td>
					<td><c:out value="${deleteEmployeesData.employee_phone}" /></td>
				</tr>
				<tr>
					<td>メールアドレス：</td>
					<td><c:out value="${deleteEmployeesData.employee_email}" /></td>
				</tr>
				<tr>
					<td>所属：</td>
					<td><c:out value="${(deleteEmployeesData.dept).department_name}" /></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="削除" name="edit" />
					</td>
				</tr>
			</table>
		</form:form>
		<p class="error">${errorMessage}</p>
	</body>
</html>
