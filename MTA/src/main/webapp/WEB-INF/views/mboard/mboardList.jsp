<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<html lang="ko">
	<head>
		
		<!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
		<meta charset="utf-8" />
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link  rel="stylesheet"  type = "text/css" href="/resources/include/css/mboard/MusicBoard.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css">
		

		<script type="text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
		
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"src ="/resources/include/js/common.js"></script> 
		
		
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
		.required {
			color: red;
		}
		
		img{
			height: 140px;
			width: 140px;
			border-radius: 30px;
		
		}
		.goDetailRank{
			height: 220px;
			width: 220px;
			border-radius: 10px 100px / 120px;	
			
		}
		
		audio:hover, audio:focus, audio:active
{
/* -webkit-box-shadow: 15px 15px 20px rgba(0,0, 0, 0.4);
-moz-box-shadow: 15px 15px 20px rgba(0,0, 0, 0.4);
box-shadow: 15px 15px 20px rgba(0,0, 0, 0.4);
-webkit-transform: scale(1.05);
-moz-transform: scale(1.05);
transform: scale(1.05);
}
with:-
audio
{
-webkit-transition:all 0.5s linear;
-moz-transition:all 0.5s linear;
-o-transition:all 0.5s linear;
transition:all 0.5s linear;
-moz-box-shadow: 2px 2px 4px 0px #006773;
-webkit-box-shadow:  2px 2px 4px 0px #006773;
box-shadow: 2px 2px 4px 0px #006773;
-moz-border-radius:7px 7px 7px 7px ;
-webkit-border-radius:7px 7px 7px 7px ;
border-radius:7px 7px 7px 7px ;
} */
audio::-webkit-media-controls-fullscreen-button
		</style>
<script type="text/javascript">
	$(function(){
		//recommend btn controll 
	/* 	$(".btn-group").click(function(){
			if(confirm("추천하시겠습니까?")){
			var m_no = $(this).parents("tr").attr("data-num");
			console.log(m_no);
			$("#m_no").val(m_no);
	
			$("#detailForm").attr("action", "/board/recommend");
			$("#detailForm").submit();
			}
		}); */
		$(".btn-group").click(function(){
			if(confirm("추천하시겠습니까?")){
				var m_no = $(this).parents("tr").attr("data-num");
				var m_recommend =$(this).html();
				var recommend_no = parseInt(m_recommend)+1;
				var currM_no = $(this).attr("data-num");
				console.log("currM_no :"+currM_no);
				console.log("m_no: "+currM_no);
				
				$.ajax({
					url :"/board/recommend",
					type : "get",
					data : {m_no : m_no},// 유저아이디도 추가로 넘겨서 좋아요 여부 체크 
					success : function(result){
						if(result==1){
							alert("게시물을 추천하셨습니다.");
							console.log(recommend_no);
							$(".btn-group[data-num='"+m_no+"']").html(recommend_no);
								
							}else{
								alert("system malfucntion");
							}
						}	
					}).fail (function(){
						alert("시스템오류");
					});
					
				}
			});
		
		
		
		
		$("#insertFormBtn").click(function() {
			location.href = "/mboard/writeForm";
		});
		/* 제목 클릭 시 상세 페이지 이동을 위한 이벤트  */
		$(".goDetail").click(function() {
			var m_no = $(this).parents("tr").attr("data-num");
			console.log(m_no);
			$("#m_no").val(m_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/mboard/boardDetail"
			});
			$("#detailForm").submit();
		});
		
		
		$("#fileDownBtn").click(function(){
			//console.log("filedownlaod btn clicked ");
			var m_no = $(this).parents("tr").attr("data-num");
			console.log(m_no);
			$("#m_no").val(m_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/mboard/fileDownload"
			});
			$("#detailForm").submit();
			
		});
		
		/*rank 영역 클릭 시 상세 페이지 이동 */
		$(".goDetailRank").click(function() {
			var m_no = $(this).parents("figure").attr("data-num");
			//console.log(m_no);
			$("#m_no").val(m_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/mboard/boardDetail"
			});
			$("#detailForm").submit();
		});
		
		
		
		
		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word ="<c:out value ='${data.keyword}'/>";
		let value = "";
		
		if(word !=""){
			$("#keyword").val("<c:out value ='${data.keyword}'/>");
			$("#search").val("<c:out value ='${data.search}'/>");
			
			
			if($("#search").val()!='b_content'){
				//:contains()는 특정 텍스틀 포함한 요소 반환
				if($("#search").val()=='b_title') value = "#list tr td.goDetail";
				else if($("#search").val()=='b_name') value ="#list tr td.name";
			
			console.log($(value+ ":contains('"+word+"')").html());
			
			$(value+ ":contains('"+word+"')").each(function(){
				var regex = new RegExp(word,'gi');
				$(this).html($(this).html().replace(regex, "<span class = 'required'>"+word+"</span>"));
			});
				
			}
		}
		
		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkData("#keyword", "검색어를"))
					return;
			} else if ($("#search").val() == "all") {
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/mboard/boardList"
			});
			$("#f_search").submit();
		});
	
	
	}); // 최상위 종료 
	
</script>
<title>BoardList</title>
	</head>
	
<body>
	<div class="container">
		<div id="music_rank">
			<c:choose>
				<c:when test="${not empty boardList }">
					<!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
					<c:forEach var="board" items="${boardList}" varStatus="status">
						<figure class="rank_track" data-num="${board.m_no}">
							<!-- click function() -->
							<img src="/uploadStorage/coverImg/${board.m_coverimage}"
								class="goDetailRank" />
							<figcaption>
								<p class="track_nm">${board.m_title}</p>
								<p class="artist_nm">${board.m_name}</p>
							</figcaption>
						</figure>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<!-- if문의 else -->
					<p class="tac text-center">등록된 게시물이 존재하지 않습니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
		<form id="detailForm">
			<input type="hidden" id="m_no" name="m_no" />
		</form>
		<%-- =====================검색기능 시작 =========================== --%>
		<div id="boardSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<div class="form-group">
					<label>검색조건</label> <select id="search" name="search"
						class="form-control">
						<option value="all">전체</option>
						<option value="b_title">제목</option>
						<option value="b_content">내용</option>
						<option value="b_name">작성자</option>
					</select> <input type="text" id="keyword" name="keyword"
						placeholder="검색어를 입력하세요" class="form-control">
					<button type="button" id="searchData"
						class="btn btn-primary btn-sm">검색</button>
				</div>
			</form>
		</div>
		<%-- =====================검색기능 종료 =========================== --%>
		<div class="text-center">
			<!-- <h3>글목록</h3> -->
		</div>
		<%-- ==================== 리스트 시작 =========================== --%>
		<div id="boardsList">
			<table summary="게시판 리스트" class="table">
				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="21%" />
					<col width="13%" />
					<col width="19%" />
					<col width="50%" />
				</colgroup>
				<thead>
					<tr>
						<th>앨범커버</th>
						<th>제목</th>
						<th>가격</th>
						<th>작성자</th>
						<th>추천수</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="list" class="table">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty boardList }">
							<!-- if 문으로 not empty가 true 일때, list가 있을 때 실행되는 구문. -->
							<c:forEach var="board" items="${boardList}" varStatus="status">
								<!-- items 의 항목을 모두 반복 -->
								<tr class="text-center" data-num="${board.m_no}">
									<!-- data-num 이 해당 글번호를 가지고있다. -->
									<td><img src="/uploadStorage/coverImg/${board.m_coverimage}" /></td>
									<td class="goDetail text-left">${board.m_title}</td>
									<td class="text-center">₩ ${board.m_price}</td>
									<td class="text-center">${board.m_name}</td>
									<td class=""><button type="button"
											class="btn-group btn-group-xs" data-num="${board.m_no}">${board.m_recommentcnt}</button></td>
									<td><audio controls controlsList="nodownload"
											src="/uploadStorage/audioFile/${board.m_file}"></audio></td>
									<td><button type="button" class="btn btn-default" id ="fileDownBtn"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-save"
												aria-hidden="true"></span>
										</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- if문의 else -->
							<tr>
								<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- ==========================리스트 종료============================== -->
		<!-- ==========================글쓰기 버튼 출력 시작====================== -->
		<div class="contentBtn text-right">
			<input type="button" id="insertFormBtn" class="btn btn-success"
				value="글쓰기">
		</div>
		<!-- ==========================글쓰기 버튼 출력 종료======================= -->
	</div>
</body>
</html>