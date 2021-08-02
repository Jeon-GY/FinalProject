<!-- 분할 정복으로 첨부파일 관리하여 복잡도를 관리합니다. 이는 유지 보수성 향상으로 이어집니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#uploadResult {	width: 100%; background-color: skyblue}
#uploadResult ul{ display:flex; flex-flow: row; justify-content: center; align-items: center;}
#uploadResult ul li {list-style:none; padding: 10px; align-content: center; text-align: center;}
#uploadResult ul li img{ width: 60px;}
#uploadResult ul li span{color: white;}
.bigWrapper { position: absolute; display: none; justify-content: center;
			align-items: center; top: 0%; width: 100%; height: 100%; background-color: gray;
			z-index: 100; background:rgba(255,255,255,0.5);}
.bigNested { position: relative; display:flex; justify-content: center; align-items:center;}
.bigNested img {width: 600px;}
.bigNested video {width: 600px;}
</style>

<!-- 첨부파일 목록 출력 부분 -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-body">
				<div class="card-header">첨부파일</div>
				
				<div class="card-body" id="uploadDiv">
					<!-- name은 queryParam 정도로 생각해라 컨트롤러에 있는거 참조 -->
					<input id="inFiles" type="file" name="uploadFile" multiple>
					<!-- <button id="btnUpload" class="btn btn-primary">파일 올리기</button> -->
				</div>
				

				<div class="card-body" id="uploadResult">
					<ul></ul>
				</div>
				
				<div class="bigWrapper">
					<div class="bigNested">
					</div>
				</div>
		  </div>
	</div>
</div>
<!-- End of 첨부파일 목록 -->
<script type="text/javascript" src="\resources\js\util\utf8.js"></script>

<script type="text/javascript">
var updateMode;
function adjustCRUDAtAttach(includer){
	if(includer === '수정' || includer === '신규'){
		updateMode = true;
		$('#uploadDiv').show();
	}else if(includer === '조회'){
		updateMode = false;
		$('#uploadDiv').hide();
	}
}

function appendUploadUl(attachVOInJson){
	var liTags = "";
	var attachVO = JSON.parse(decodeURL(attachVOInJson));
	
	if (attachVO.multiMediaType === "others"){
		liTags += "<li data-attach_info=" + attachVOInJson + "><a href='/uploadFiles/download?fileName="
		+ encodeURIComponent(attachVO.originalFileCallPath) + "'><img src='/resources/img/attachFileIcon.png'>"
		+ attachVO.pureFileName + "</a>"; 
		if (updateMode){
			liTags += "<span>X</span>";
		}
		liTags += "</li>";
	}else {
		if (attachVO.multiMediaType === "audio"){
			liTags += "<li data-attach_info=" + attachVOInJson + ">"
					+ "<a>"
					+ "<img src='/resources/img/audioThumbnail.jpg'>"
					+ attachVO.pureFileName + "</a>";
					if (updateMode){
						liTags += "<span>X</span>";
					}
					liTags += "</li>";
		}else if (attachVO.multiMediaType === "image" || attachVO.multiMediaType === "video"){
			liTags += "<li data-attach_info=" + attachVOInJson + ">"
					+ "<a>"
					+ "<img src='/uploadFiles/display?fileName=" 
					+ encodeURIComponent(attachVO.fileCallPath) + "'>" + attachVO.pureFileName + "</a>";
					if (updateMode){
						liTags += "<span>X</span>";
					}
					liTags += "</li>";
		}
	}
	$("#uploadResult ul").append(liTags);
}


$(document).ready(function(){
	//업로드 파일에 대한 확장자 제한하는 정규식
	var uploadConstraintByExt = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	//업로드 파일에 대한 최대 크기 제한
	var uploadMaxSize = 1036870912; 
	
	//화면이 맨 처음 로드 시 들어있는 깨끗한 상태 기억
	var initClearStatus = $("#uploadDiv").html();
	
	$("#uploadDiv").on("change", "input", function() {
		alert("잘 되는구나");
		var formData = new FormData();
		var files = $("#inFiles")[0].files;
		
		for (var i = 0; i < files.length; i++){
			if (! checkFileConstraints(files[i].name, files[i].size))
				return false;
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : "/uploadFiles/upload",
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result){
				showUploadedFile(result);
				//동적인 청소는 연동되어 있는 Event Listener까지 날아가버림. 이에 위임방식을 사용함.
				$("#uploadDiv").html(initClearStatus);
			}
		});
	});
	
	//IE11까지 고려함) 보여준 이 후에 클릭하면 사라지게 합니다.
	$(".bigWrapper").on("click", function(){
		$(".bigNested").animate({width:'0%', height:'0%'}, 1000);
		setTimeout(function (){
			$(".bigWrapper").hide();
		}, 1000);
	});
	
	//업로드 파일에 대한 제약 사항을 미리 검사해 줍니다.
	function checkFileConstraints(fileName, fileSize){
		//크기 검사
		if (fileSize > uploadMaxSize){
			return false;
		}
		//종류 검사
		if (uploadConstraintByExt.test(fileName)){
			return false;
		}
		
		return true;
	}
	
	
	$("#uploadResult").on("click", "a", function() {
		var attachVO = $(this).closest("li").data("attach_info");
		attachVO = JSON.parse(decodeURL(attachVO));
		
		$(".bigWrapper").css("display", "flex").show();
		if (attachVO.multiMediaType === "audio"){
			$(".bigNested").html("<audio src='/uploadFiles/display?fileName="+ encodeURI(attachVO.originalFileCallPath) + "' autoplay>")
			.animate({width:'100%', height:'100%'}, 1000);
		}else if (attachVO.multiMediaType === "image"){
			$(".bigNested").html("<img src='/uploadFiles/display?fileName="+ encodeURI(attachVO.originalFileCallPath) + "'>")
			.animate({width:'100%', height:'100%'}, 1000);
		}else if (attachVO.multiMediaType === "video"){
			$(".bigNested").html("<video src='/uploadFiles/display?fileName="+ encodeURI(attachVO.originalFileCallPath) + "' autoplay>")
			.animate({width:'100%', height:'100%'}, 1000);
		}

	});
	
	//첨부파일 삭제하기, 첨부 취소하기
	$("#uploadResult").on("click", "span", function(){
		var targetLi = $(this).closest("li");
		var attachVO = targetLi.data("attach_info");
		attachVO = JSON.parse(decodeURL(attachVO));
		
		$.ajax({
			url : "/uploadFiles/deleteFile",
			data : attachVO,
			type : 'POST',
			dataType : 'text',
			success : function(result){
				targetLi.remove();
			}
		});
	});
});

function showUploadedFile(result){
	$(result).each(function(i, attachVOInJson){
		appendUploadUl(attachVOInJson)
	});
}

/**
 * 첨부 파일 기능은 여러 화면에서 재사용될 가능성이 높아요
 * 이를 각 화면에서 중복 개발하기 보다는 이곳에서 통합적으로 서비스할 수 있도록 모듈화함.
 */
function addAttachInfo(frmContainer, varName){
	var inputAttaches = "";
	$("#uploadResult ul li").each(function(i, attachLi){
		var jobObj = $(attachLi);
		
		var attachVO = jobObj.data("attach_info");
		
		inputAttaches += "<input type='hidden' name='" + varName + "[" + i + "]' value=" + attachVO +">";
	});
	
	frmContainer.append(inputAttaches);
}
</script>








