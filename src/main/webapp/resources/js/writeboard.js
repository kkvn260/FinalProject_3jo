/**
 * 
 */

//경매기능 사용 여부
$(function() {
	$('#deal').click(function () {
		if($('#deal_price').css("display")=='none'){
			$('#deal_price').show();
		}else{
			$('#deal_price').hide();
		}
	})
})


//카테고리 기능
var category0=["대분류 선택","의류","디지털/가전","생활/식품","취미","도서/음반","기타(잡화)"];
var category1=["남성","여성"];
var category2=["모바일","카메라","PC/노트북","가전"];
var category3=["생활용품","주방용품","식품"];
var category4=["스포츠","수집품","게임","반려동물"];
var category5=["국내도서","해외도서","CD/DVD/LP"];


 $("select[name=category1]").each(function() {
  $cate1 = $(this);
  $.each(eval(category0), function() {
   $cate1.append("<option value='"+this+"'>"+this+"</option>");
  });
  $cate1.next().append("<option value=''>소분류 선택</option>");
 });

$("select[name=category1]").change(function() {
  var category = "category"+$("option",$(this)).index($("option:selected",$(this))); 
  var $cate2 = $(this).next(); 
  $("option",$cate2).remove(); 

  if(category == "category0")
   $cate2.append("<option value=''>소분류 선택</option>");
  else {
   $.each(eval(category), function() {
    $cate2.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });



//image preview 기능 구현
var files = {};
var previewIndex = 0;

function addPreview(input) {
	$("#preview .preview-box").remove();
	if (input[0].files) {
		for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
			var file = input[0].files[fileIndex];
			setPreviewForm(file);
		}
	} else
		alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
}

function setPreviewForm(file, img){
	var reader = new FileReader();

	//div id="preview" 내에 동적코드추가.
	//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	reader.onload = function(img) {
		var imgNum = previewIndex++;
		$("#preview").append(
				"<div class=\"preview-box\" value=\"" + imgNum +"\">" +
				"<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
				"<p>" + file.name + "</p>"
				+ "</div>"
		);
		resizeHeight();
		files[imgNum] = file;            
	};

	reader.readAsDataURL(file);
}


	$('#attach input[type=file]').change(function() {
		addPreview($(this)); //preview form 추가하기
	});

