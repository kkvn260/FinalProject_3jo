/**
 * 
 */
$(function() {
	$('#deal').click(function () {
		if($('#deal_price').css("display")=='none'){
			$('#deal_price').show();
		}else{
			$('#deal_price').hide();
		}
	})
})
var files = {};
var previewIndex = 0;

//image preview 기능 구현
//input = file object[]
function addPreview(input) {
	$("#preview .preview-box").remove();
	if (input[0].files) {
		//파일 선택이 여러개였을 시의 대응
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

