<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@include file="../header.jsp"%>
<html>
<head>
<title>조회</title>

<!-- kakao map + services 라이브러리 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8edb8cdd7d7dcd293b0f1e7e1ac00c7c&libraries=services"></script>

</head>
<body>
	<div
		style="background-color: white; width: 105%; height: 1200px; padding-right: 35%; padding-top: 115px; padding-left: 35%;">

		<div>
			<h2>글 상세</h2>
		</div>

		<div class="form-group">

			<label style="color: black;">제목</label>
			<p>${content.title}</p>
		</div>
		<div class="form-group">

			<label style="color: black;">내용</label>
			<p>${content.content}</p>
		</div>
		<div class="form-group">

			<label style="color: black;">예정일</label>
			<p>${content.opendate}
				~ <span>${content.enddate}</span>
			</p>
		</div>
		<div class="form-group">
			<label style="color: black;">위치</label>
			<p>${content.location}</p>
			<div id="map" style="width: 500px; height: 400px;"></div>
		</div>
		<div class="form-group">
			<a href="/applyform.do?fno=<c:out value="${content.fno}"/>">
				<button class="btn btn-primary btn-lg">지원하기</button>
			</a>
		</div>

	</div>


	<script>
		var container = document.getElementById('map');
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표.
				level : 3 //지도의 레벨(확대, 축소 정도)
			};		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var loca = '${content.location}';
		console.log(loca);
						
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(loca, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				console.log(result);
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        map.setDraggable(false); 
		    } 
		}); 
	</script>


</body>
</html>
<%@include file="../footer.jsp"%>
