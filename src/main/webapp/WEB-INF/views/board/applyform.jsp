<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
 <%@ include file="../header.jsp"%>
<%-- <jsp:include page="../header.jsp"></jsp:include> --%>
<html>
<head>
<title>apply!</title>

</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">올리기</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">지원 하기</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<form action="/applyformcre.do" method="post">
						<input name="fno" type="hidden" value="${param.fno}"/>
						<div class="form-group">
							<label>참가 명</label> <input class="form-control" id='name'
								name="name">
						</div>
						<div class="form-group">
							<label>판매 품목</label> <input class="form-control" id='item'
								name="item">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" id='aplycontent'
								name="aplycontent"></textarea>
						</div>
						<div class="form-group">
							<label>이메일</label> <input class="form-control" id='email'
								name="email">
						</div>
						<button type="submit" class="btn btn-primary" id="submit">지원</button>
					<input name="${_csrf.parameterName}" type="hidden"
							value="${_csrf.token}" />
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

</body>
</html>
<%@include file="../footer.jsp"%>