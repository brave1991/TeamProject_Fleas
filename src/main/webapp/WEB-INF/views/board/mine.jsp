<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../header.jsp"%>
<html>
<head>
<title>마이페이지</title>
</head>
<body>

	<div class="text-center">
		<h2>조회하기</h2>
		<p>내가 쓴글!!!!!!!</p>
	</div>
	<div class="text-center">
		<c:if test="${not empty myflea}">
			<p>플리마켓</p>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>예정일</th>
						<th>지역</th>
						<th>지원자확인</th>
					</tr>
				</thead>
				<c:forEach items="${myflea}" var="board">
					<tr>
						<td><c:out value="${board.fno}" /></td>
						<td><c:out value="${board.title}" /></td>
						<c:choose>
							<c:when test="${fn:length(board.content) > 25}">
								<td><c:out value="${fn:substring(board.content,0,24)}" />...</td>
							</c:when>
							<c:otherwise>
							<td><c:out value="${board.content}" /></td>
							</c:otherwise>
						</c:choose>
						<td>${board.opendate}~${board.enddate}</td>
						<td>${board.location}</td>
						<td><a href="/mypage/applycheck/<c:out value="${board.fno}"/>"><button id="btn" class="btn btn-primary">확인</button></a></td>

					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>

	<div class="text-center">
		<c:if test="${not empty myapply}">
			<p>지원서</p>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>내용</th>
						<th>이메일</th>
						<th>이름</th>
					</tr>
				</thead>
				<c:forEach items="${myapply}" var="board">
					<tr>
						<%-- <td><c:out value="${board.ano}" /></td> --%>
						<c:choose>
							<c:when test="${fn:length(board.aplycontent) > 25}">
								<td><c:out value="${fn:substring(board.aplycontent,0,24)}" />...</td>
							</c:when>
							<c:otherwise>
							<td><c:out value="${board.aplycontent}" /></td>
							</c:otherwise>
						</c:choose>
						<td><c:out value="${board.email}" /></td>
						<td>${board.name}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>

	<div class="text-center">
		<c:if test="${empty myflea and empty myapply}">
			<p>내가 쓴 글이 없습니다.</p>
		</c:if>
	</div>
</body>
</html>
<%@include file="../footer.jsp"%>