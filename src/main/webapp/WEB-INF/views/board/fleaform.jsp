<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
<title>upload</title>

<!-- Datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">board register</div>
				<div class="panel-body">
					<form role="form" action="/fleaformcre.do" method="post">

						<div class="form-group">
							<label>제목</label> <input class="form-control" name='title'>
						</div>
						<div class="form-group">
							<label>설명란</label>
							<textarea class="form-control" rows="3" name='content'></textarea>
						</div>
						<div class="form-group">
							<label>예정일</label> <input type="date" id="opendate"
								name="opendate"> ~ <input type="date" id="enddate"
								name="enddate">
						</div>
						<div class="form-group">
							<label>지역</label> <input class="form-control" name='location'>
						</div>
						<button type="submit" class="btn btn-default">전송</button>
						<button type="reset" class="btn btn-default">전체 삭제</button>
						<input name="${_csrf.parameterName}" type="hidden"
							value="${_csrf.token}" />
					</form>
				</div>
			</div>
		</div>

	</div>

	<!-- 첨부파일 등록하기위한 파트 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">판매하실 제품 사진을 올려주세요</div>
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name='uploadFile' multiple>
					</div>
					<div class='uploadResult'>
						<ul>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function(e) {
		 					var formObj = $("form[role='form']");
							console.log("formobj  " + formObj);
					 		$("button[type='submit']").on("click",function(e){
					 			e.preventDefault();
					 			console.log("submit clicked");
					 			var str="";
					 			
					 			$(".uploadResult ul li").each(function(i,obj){
					 				var jobj = $(obj);
					 				
					 				 str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					 			      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					 			      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					 			      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
					 			});
					 			
					 			formObj.append(str).submit();
					 		});
					 		
					 		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
					 		  var maxSize = 5242880; //5MB
					 		  
					 		  function checkExtension(fileName, fileSize){
					 		    
					 		    if(fileSize >= maxSize){
					 		      alert("파일 사이즈 초과");
					 		      return false;
					 		    }
					 		    
					 		    if(regex.test(fileName)){
					 		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
					 		      return false;
					 		    }
					 		    return true;
					 		  }
					 		  
					 		  $("input[type='file']").change(function(e){

					 		    var formData = new FormData();
					 		    
					 		    var inputFile = $("input[name='uploadFile']");
					 		    
					 		    var files = inputFile[0].files;
					 		    
					 		    for(var i = 0; i < files.length; i++){

					 		      if(!checkExtension(files[i].name, files[i].size) ){
					 		        return false;
					 		      }
					 		      formData.append("uploadFile", files[i]);
					 		      
					 		    }
					 		    
					 		    $.ajax({
					 		      url: '/uploadAjaxAction',
					 		      processData: false, 
					 		      contentType: false,data: 
					 		      formData,type: 'POST',
					 		      dataType:'json',
					 		     beforeSend : function(xhr)
			                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			                          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			                      },
			                      
					 		        success: function(result){
					 		          console.log(result); 
					 				  showUploadResult(result); //업로드 결과 처리 함수
					 		      }
					 		    }); //$.ajax
					 			});
					 		  function showUploadResult(uploadResultArr){
					 			  if(!uploadResultArr || uploadResultArr.length == 0) {return;}
					 			  var uploadUL=$(".uploadResult ul");
					 			  var str ="";
					 			  
					 			  $(uploadResultArr).each(function(i,obj){
					 				 if(obj.image){
					 					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					 					str += "<li data-path='"+obj.uploadPath+"'";
					 					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					 					str +" ><div>";
					 					str += "<span> "+ obj.fileName+"</span>";
					 					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					 					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					 					str += "<img src='/display?fileName="+fileCallPath+"'>";
					 					str += "</div>";
					 					str +"</li>";
					 				}else{
					 					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					 				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					 				      
					 					str += "<li "
					 					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					 					str += "<span> "+ obj.fileName+"</span>";
					 					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					 					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					 					str += "<img src='/resources/img/attach.png'></a>";
					 					str += "</div>";
					 					str +"</li>";
					 				}
					 			  });
					 			  uploadUL.append(str);
					 		  }
					 		  $(".uploadResult").on("click","button",function(e){
					 			  console.log("delete file");
					 		
					 			  var targetFile=$(this).data("file");
					 			  var type=$(this).data("type");
					 			  
					 			  var targetLi=$(this).closest("li");
					 			  
					 			  $.ajax({
					 				  url:'/deleteFile',
					 				  data:{fileName:targetFile,type:type},
					 				  dataType:'text',
					 				  type:'POST',
					 				 beforeSend : function(xhr)
				                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				                          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				                      },
					 				  success:function(result){
					 					  targetLi.remove();
					 				  }
					 			  });
					 		  });
							
					 		 
							
							//모든 datepicker에 대한 공통 옵션 설정
							$.datepicker
									.setDefaults({
										dateFormat : 'yy-mm-dd' //Input Display Format 변경
										,
										showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
										,
										showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
										,
										changeYear : true //콤보박스에서 년 선택 가능
										,
										changeMonth : true //콤보박스에서 월 선택 가능                
										,
										showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
										,
										buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
										,
										buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
										,
										buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
										,
										yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
										,
										monthNamesShort : [ '1', '2', '3', '4',
												'5', '6', '7', '8', '9', '10',
												'11', '12' ] //달력의 월 부분 텍스트
										,
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
										,
										dayNamesMin : [ '일', '월', '화', '수',
												'목', '금', '토' ] //달력의 요일 부분 텍스트
										,
										dayNames : [ '일요일', '월요일', '화요일',
												'수요일', '목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
										,
										minDate : "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
										,
										maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
									});

							//input을 datepicker로 선언
							$("#opendate").datepicker();
							$("#enddate").datepicker();

							//From의 초기값을 오늘 날짜로 설정
							$('#opendate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
							//To의 초기값을 내일로 설정
							$('#enddate').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

						
							
							
							
						
						
						});

		/*     	$(document).ready(function (e){
		 $('#submit').click(function(){
		 var frmArr = ["title","content","opendate","enddate","location"];

		 //입력 값 널 체크
		 for(var i=0;i<frmArr.length;i++){
		 //alert(arr[i]);
		 if($.trim($('#'+frmArr[i]).val()) == ''){
		 alert('빈 칸을 모두 입력해 주세요.');
		 $('#'+frmArr[i]).focus();
		 return false;
		 }
		 }

		 //전송
		 $('#frm').submit();
		 });
		 
		 }); */
	</script>
</body>
</html>
<%@include file="../footer.jsp"%>