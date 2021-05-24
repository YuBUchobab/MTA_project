<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

      <title>상세페이지</title>      
      
      <!-- 모바일 웹 페이지 설정 -->
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      <!-- 모바일 웹 페이지 설정 끝 -->
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap.min.css" />
	  <link rel = "stylesheet" type = "text/css" href = "/resources/include/dist/css/bootstrap-theme.css" />
      <style type="text/css">
       form {margin-bottom: 30px;}
       .image_size{
       			height: 200px;
       			width: 400px;
       }
       
       #fc_insertBtn{
       		height: 110px;
       		width: 70px;
       }
      </style>
      <script type = "text/javascript"  src = "/resources/include/js/jquery-3.6.0.min.js"></script>
      <script type = "text/javascript"  src = "/resources/include/js/common.js"></script>
      <script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js"></script>
           <script type="text/javascript">
         let buttonCheck = 0; // buttonCheck는 수정버튼과 삭제버튼을 구별하기 위한 변수
         $(function() {
            $("#pwdChk").css("visibility", "hidden");
            
            /* 수정 버튼 클릭 시 처리 이벤트 */
            $("#updateFormBtn").click(function(){
				$("#f_data").attr("action", "/board/freeUpdateForm");
				$("#f_data").submit();
            });
           
            
            /* 삭젲 버튼 클릭 시 처리 이벤트 */
            $("#boardDeleteBtn").click(function(){
            	if(confirm("정말 삭제하시겠습니까?")){
					$("#f_data").attr("action","/board/freeboardDelete");
					$("#f_data").submit();
				}
            });
                 
            /* 글쓰기 버튼 클릭 시 처리 이벤트 */
            $("#insertFormBtn").click(function(){
            	 location.href = "/board/freeWriteForm";
            });
           	
           
            
            /* 목록 버튼 클릭 시 처리 이벤트 */
            $("#boardListBtn").click(function(){
                location.href = "/board/freeboard";
             });
            
            /* 댓글달기 버튼 클릭 시 처리 이벤트 */
        	   $("#fc_insertBtn").click(function () {
				$("#fcomment").attr({
					"method" : "post",
					"action" : "/fcomment/fcommentInsert"
				});
				$("#fcomment").submit();
			}); 
            
        	   /* 댓글삭제 버튼 클릭 시 처리 이벤트 */
               $("#fcdeleteBtn").click(function(){
            	   console.log("댓글삭제클릭");
               	if(confirm("정말 삭제하시겠습니까?")){
   					$("#fc_form").attr("action","/fcomment/fcDelete");
   					$("#fc_form").submit();
   				}
               });
            
         });
         </script>
      
   </head>
   <body>
   <div class = "container-fluid">
         <form name = "f_data" id = "f_data" method = "post">
            <input type = "hidden" name = "f_no" value = "${detail.f_no}">
         </form>
    </div>
   	   		
	   	<div class="btnArea col-md-12 text-right" style="margin-top:50px; margin-bottom:30px;">
	   		<button type="button" id="updateFormBtn" class="btn btn-primary btn-sm" >글수정</button>
	   		<button type="button" id="boardDeleteBtn" class="btn btn-primary btn-sm" >글삭제</button>
	   		<button type="button" id="insertFormBtn" class="btn btn-primary btn-sm" >글쓰기</button>
	   		<button type="button" id="boardListBtn" class="btn btn-primary btn-sm" >목록</button>
	   	</div>
	
   		
   		<div >
   			<table class="table table-bordered" >
	   			<tr>
	   				<td class="col-md-3">글번호</td>
	   				<td class="col-md-3 text-left">${detail.f_no}
	   				<td class="col-md-3">작성일</td>
	   				<td class="col-md-3 text-left">${detail.f_regdate}</td>
	   			</tr>
   				<tr>
   					<td class="col-md-3">작성자 </td>
   					<td colspan="3" class="col-md-9 text-left">mta</td>
   				</tr>
   				<tr>
   					<td class="col-md-3">글제목 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.f_title}</td>
   				</tr>
   				<tr class="table-height">
   					<td class="col-md-3">글 내용 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.f_text}</td>
   				</tr>
   				<tr>
   					<td class="col-md-3">조회수 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.f_viewsCnt}</td>
   				</tr>
   				<tr>
   					<td class="col-md-3">추천수 </td>
   					<td colspan="3" class="col-md-9 text-left">${detail.f_recomentCnt}</td>
   				</tr>
   				<tr>
   					<td class="col-md-3">파일첨부 </td>
   					<td colspan="3" class="col-md-9 text-left">
						<img class="image_size" src="/uploadStorage/board/${detail.f_file}" /></td>
   				</tr>
   			</table>
   			<hr />
			<h4>댓글 작성</h4>
			 	<div class="container-fluid">
			 	<%-- 	<form name = "f_data" id = "f_data" method = "post">
            			<input type = "hidden" name = "f_no" value = "${detail.f_no}">
         			</form> --%>
			 		<form id="fcomment" name="fcomment">
			 			 <input type = "hidden" name = "f_no" value = "${detail.f_no}" />
			 			<textarea rows="5" class="col-md-10" maxlength="2000" id="fc_text" name="fc_text"></textarea>
			 			<button type="button" id="fc_insertBtn" class="btn btn-primary btn-sm" >댓글등록</button>
			 		</form>
			 		
			 		<hr />
			 		
			 		
			 		 		
		         <%-- ====================== 댓글 리스트 시작 ====================== --%>
		         <div id = "fcommentList">
		       
		            <table summary = "댓글 리스트" class = "table">
		               <colgroup>
		               	  <col width ="5%" />
		                  <col width ="5%" />
		                  <col width ="10%" />
		                  <col width ="10%" />
		                  <col width ="60%" />
		                  <col width="10%" />
		               </colgroup>
		               <thead>
		                  <tr>
		                  	 <th data-value="fc_no" class="">댓글번호</th>
		                     <th data-value="f_no" class="">글번호</th>
		                     <th class="text-center">유저아이디</th>
		                     <th class="text-center">댓글등록일</th>
		                     <th class="text-center">댓글내용</th>
		                  </tr>
		               </thead>
		               <tbody id="list" class="table-striped" >
		      				<!-- 데이터 출력 -->
		      				<c:choose>
		      					<c:when test="${not empty fcommentList}">
		      						<c:forEach var="comment" items="${fcommentList}" varStatus="status">
		      							  <form id="fc_form" method="post">
									         	<input type = "hidden" name = "fc_no" value = "${comment.fc_no}">
									      		<%-- <input type = "hidden" name = "f_no" value = "${comment.f_no}"> --%>
									      	</form>
		      							<tr class="text-center" data-num="${comment.fc_no}">
		      								
		      								<td class="text-centr">유저아이디</td>
		      								<td class="text-left">${comment.fc_regdate}</td>
		      								<td class="text-center">${comment.fc_text }</td>
		      								<td><button class="btn btn-primary btn-sm" type="button" id="fcdeleteBtn" name="fcdeleteBtn">삭제</button>
		      								</td>
		      							</tr>
		      							
		      						</c:forEach>
		      					</c:when>
		      					<c:otherwise>
		      						<tr>
		      							<td colspan="4" class="tac text-center">등록된 댓글이 존재하지않습니다</td>
		      						</tr>
		      					</c:otherwise>
		      				</c:choose>
		               </tbody>
		            </table>
		           
			 	</div>  			
   			
   		</div>
   	
   </body>
</html>