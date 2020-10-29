<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../header.jsp"%>
<html>
<head>
<title>마이페이지</title>
</head>
<body>

	<div class="text-center">
		<h2>지원 조회하기</h2>
	</div>
	<div class="text-center">
	<input name="fno" type="hidden" value="${param.fno}"/>
		<c:if test="${not empty apply}">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>#번호</th>
						<th>판매품목</th>
						<th>이름</th>
						<th>내용</th>
						<th>이메일</th>
					</tr>
				</thead>
				<c:forEach items="${apply}" var="board">
					<tr>
						<td>${board.ano}</td>
						<td>${board.item}</td>
						<td>${board.name}</td>
						<c:choose>
							<c:when test="${fn:length(board.aplycontent) > 25}">
								<td><c:out value="${fn:substring(board.aplycontent,0,24)}" />...</td>
							</c:when>
							<c:otherwise>
							<td><c:out value="${board.aplycontent}" /></td>
							</c:otherwise>
						</c:choose>
						<td>${board.email}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>

	<div class="text-center">
		<c:if test="${empty apply}">
			<p>지원자가 없습니다.</p>
		</c:if>
	</div>
</body>
</html>
<%@include file="../footer.jsp"%>