/**
 * 
 */
//사진 모달
$(function() {
	$('.moimg').click(function() {
		$(".modal").fadeIn();
		$(".modalimg").attr("src",$(this).attr("src"));
	})
	$(".modal_content").click(function(){
		$(".modal").fadeOut();
	});
})

//가격 , 찍기
function numberWithCommas(x) {
  x = x.replace(/[^0-9]/g,'');  
  x = x.replace(/,/g,'');          
  $("#sell_price").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); 
}
function numberWithCommas2(x) {
	  x = x.replace(/[^0-9]/g,'');  
	  x = x.replace(/,/g,'');          
	  $(".deal_price").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); 
}

//경매기능 사용 여부
$(function() {
	$('#deal').click(function () {
		if($('.deal_price').css("display")=='none'){
			$('.deal_price').show();
			$('.deal_price').attr("required",true);
		}else{
			$('.deal_price').val("");
			$('.deal_price').hide();
			$('.deal_price').attr("required",false);
		}
	})
})



//카테고리 기능
var category0=["대분류 선택","의류","디지털/가전","생활/식품","취미","도서/음반","기타(잡화)"];
var category1=["남성의류","여성의류"];
var category2=["모바일","카메라","PC/노트북","가전"];
var category3=["생활용품","주방용품","식품"];
var category4=["스포츠","수집품","게임","반려동물"];
var category5=["국내도서","해외도서","CD/DVD/LP"];
var category6=["기타"];


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

//주소 기능
var area0 = ["시/도 선택","서울특별시","인천광역시","경기도"];
var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
 var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
 var area3 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];

 $("select[name=addr1]").each(function() {
  $sido1 = $(this);
  $.each(eval(area0), function() {
   $sido1.append("<option value='"+this+"'>"+this+"</option>");
  });
  $sido1.next().append("<option value=''>군/구 선택</option>");
 });

$("select[name=addr1]").change(function() {
  var sido = "area"+$("option",$(this)).index($("option:selected",$(this))); 
  var $gungu = $(this).next(); 
  $("option",$gungu).remove(); 

  if(sido == "addr0")
   $gungu.append("<option value=''>군/구 선택</option>");
  else {
   $.each(eval(sido), function() {
    $gungu.append("<option value='"+this+"'>"+this+"</option>");
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
		alert('invalid file input'); 
}

function setPreviewForm(file, img){
	var reader = new FileReader();

	reader.onload = function(img) {
		var imgNum = previewIndex++;
		$("#preview").append(
				"<div class=\"preview-box\" value=\"" + imgNum +"\">" +
				"<img class=\"moimg\" src=\"" + img.target.result + "\"\/>" +
				"<p>" + file.name + "</p>"
				+ "</div>"
		);
		files[imgNum] = file;            
	};

	reader.readAsDataURL(file);
}


	$('#attach input[type=file]').change(function() {
		addPreview($(this)); 
	});