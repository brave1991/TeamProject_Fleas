<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../header.jsp"%>
<html>
<head>
<title>조회</title>
</head>


<body>

	<!-- /.panel-heading -->
	<div class="panel-body">
	<div class="gallery">
		<div class="text-center">
			<h2>조회하기</h2>
			<p>조회하기조회하기</p>
		</div>
		  
		
	
		
		
		<!-- 정렬기능 -->
		<form action="/getFlealist.do" method="get">
		<input type="hidden" name="fno" value="{$fno}" />

		<input type="hidden" name="location" value="{$location}" />
		
		<input type="hidden" name="enddate" value="{$enddate}" />

			<!-- <select name="sort">
			    <option value="">대상</option>
			    <option value="bseq">번호</option>
			    <option value="title">제목</option>
			    <option value="regid">마감순</option>
			</select> -->
			
			
			
			
			
			
			<%-- <select name="sort_index">

				<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택</option>
			
				<option value="FNO"<c:out value="${pageMaker.cri.type eq 'FNO'?'selected':''}"/>>번호</option>
			
				<option value="OPEN"<c:out value="${pageMaker.cri.type eq 'OPEN'?'selected':''}"/>>최신업로드순</option>
			
				<option value="END"<c:out value="${pageMaker.cri.type eq 'END'?'selected':''}"/>>마감순</option>
			
				<option value="LOCA"<c:out value="${pageMaker.cri.type eq 'LOCA'?'selected':''}"/>>지역순</option>
			</select>
					 --%>
					 
					 <!-- ////////////////////////////  -->
			
			<!-- <select name="asc">
			    <option value="">방식</option>
			    <option value="asc">오름차순</option>
			    <option value="desc">내름차순</option>
			</select> -->
			
			<!-- /////////////////////// -->
		

			<div class="boardsort">
			<a href="/getFlealist.do?sort=fno">[번호순]</a>
			<a href="/getFlealist.do?sort=opendate">[최신업데이트순]</a>
			<a href="/board/list.do?sort=tot_reply_cnt">[댓글순]</a>
			<a href="/board/list.do?sort=read_cnt">[조회순]</a>
			</div>
			
			<input type="submit" value="정렬">

			<br>
		</form>
		
		
	
		
		
		<div class="container">
			<c:forEach items="${flealist}" var="flea">
				<div class="col-md-4">
					<figure class="effect-marley">
						<a href='/getflea.do?fno=<c:out value="${flea.fno}"/>'> <img
							src="/resources/img/12.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>${flea.title}</h4>
								<p>${flea.opendate}
									,<span>${flea.enddate}, </span>${flea.content}</p>
							</figcaption>
						</a>
					</figure>
				</div>
				<c:if test="${empty flea}">
				<p>없다.</p>
				</c:if>
			</c:forEach>
		</div>
	</div>
		<div class='row'>
			<div class="col-lg-12">

				<form id='searchForm' action="/getFlealist.do" method='get'>
					<select name='type'>
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
							or 내용</option>
					</select> <input type='text' name='keyword' id="keyword" 
						value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
						type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
						type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class='btn btn-default'>검색</button>
				</form>
			</div>
		</div>

		<div >
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous"><a
						href="${PageMaker.startPage -1 }">previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class="paginate_button ${pageMaker.cri.pageNum ==num? "active":""} ">
						<a href="${num }">${num }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next }">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">NEXT</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<form id='actionForm' action="/getFlealist.do" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	</form>





<script type="text/javascript">
	$(document).ready(function() {

						/* var result = '<c:out value="${result}"/>';
						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}
						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						}); */
						var actionForm= $("#actionForm");
						$(".paginate_button a").on("click",function(e){
							e.preventDefault();
							console.log('click');
							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
						});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();
								});
	});					
	</script>

</body>
</html>
<%@include file="../footer.jsp"%>
