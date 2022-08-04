<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원의 정보 입력 폼</h2>
	<form action="addProduct.jsp" method="post">
		<table>
			<tr>
				<td>name</td>
				<td><input type="text" name="name" size="20"></td>
			</tr>
			<tr>
				<td>unitPrice</td>
				<td><input type="text" name="unitPrice" size="20"></td>
			</tr>
			<tr>
				<td>description</td>
				<td><input type="text" name="description" size="20"></td>
			</tr>
			<tr>
				<td>category</td>
				<td> <select name="category">
						<option value="가방">가방</option>
						<option value="옷">옷</option>
						<option value="신발" selected>신발</option>
				</select>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td><input type="submit" value="submit"> <input
					type="reset" value="reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>