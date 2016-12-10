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
		<title>DataBase サンプル 変更</title>
	</head>
	<body>
		<h1>従業員変更</h1>
		<hr />
		<p><a href="menu">メニューへ戻る</a></p>
		<hr />
		<form:form modelAttribute="employeesModel">
			<table>
				<tr>
					<td>従業員ID：</td>
					<td>
						<c:out value="${employeesModel.employee_id}" />
						<input type="hidden" value="${employeesModel.employee_id}" name="employee_id" />
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>名前：</td>
					<td><form:input path="employee_name" size="50" /></td>
					<td><form:errors path="employee_name" element="div" cssClass="error" /></td>
				</tr>
				<tr>
					<td>携帯番号：</td>
					<td><form:input path="employee_phone" size="20" /></td>
					<td><form:errors path="employee_phone" element="div" cssClass="error" /></td>
				</tr>
				<tr>
					<td>メールアドレス：</td>
					<td><form:input path="employee_email" size="50" /></td>
					<td><form:errors path="employee_email" element="div" cssClass="error" /></td>
				</tr>
				<tr>
					<td>所属：</td>
					<td>
						<form:select path="department_id">
							<c:forEach var="dept" items="${deptList}">
								<c:choose>
									<c:when test="${dept.department_id == employeesModel.department_id}">
										<option value="${dept.department_id}" selected="selected">${dept.department_name}</option>
									</c:when>
									<c:otherwise>
										<option value="${dept.department_id}">${dept.department_name}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</form:select>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="変更" name="edit" />
						<input type="submit" value="リセット" name="reset" />
					</td>
				</tr>
			</table>
		</form:form>
		<p class="error">${errorMessage}</p>
	</body>
</html>
