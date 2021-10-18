<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReigsterForm</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
hi{
	font-size: 30px;
	margin-top: 50px;
}
select{
      font-family: 'Gowun Dodum', sans-serif;
}
#gender{
	widows: 100px;
	height: 20px;
}
.form-control{
	width: 350px;
	height: 50px;
	margin-top: 5px;
}
.birthday{
	width: 350px;
	height: 50px;
}
  #regi{
      align:center;
      margin:0 auto;
      width:1400px;
      font-family: 'Gowun Dodum', sans-serif;
}
#s{
  color:red;
}


</style>
<script>

//아이디 정규식
var idJ = /^[a-z0-9]{4,12}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

//아이디 중복 체크
$(document).ready(function(){
	

	$("#user_id").blur(function() {
		var user_id = $('#user_id').val();
		$.ajax({
			type : 'get'
			,url : '${pageContext.request.contextPath}/member/idCheck?user_id='+ user_id
			,success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#sign_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#sign_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#sign_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#sign_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				} 
			});
		});
		
		
			
	


		
		// 이름에 특수문자 들어가지 않도록 설정
	 	$("#user_name").blur(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
			} else {
				$('#name_check').text('이름을 확인해주세요');
				$('#name_check').css('color', 'red');
			}
		}); 
		
		
		// 휴대전화
		 $('#phoneno').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(phoneJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
				$('#phone_check').css('color', 'red');
			}
		});
	 
		//email
		 $('#email').blur(function(){
			if(mailJ.test($(this).val())){
				console.log(mailJ.test($(this).val()));
				$('#email_check').text('');
			}else {
				$('#email_check').text('이메일을 확인해주세요:)');
				$('#email_check').css('color','red');
			}
		}); 
		
		//비밀번호
		 $('#pwd').blur(function(){
			if(pwJ.test($('#pwd').val())){
				console.log('true');
				$('#pw_check').text('');
			}else {
				console.log('false');
				$('#pw_check').text('숫자 or 문자로만 4~12자리 입력');
				$('#pw_check').css('color','red');
			}
			
		}); 
		
		//password 재확인
		 $('#user_pwd').blur(function(){
			if($('#pwd').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
				$('#pw2_check').css('color','red');
			}else{
				$('#pw2_check').text('');
			}
			
		}); 
				
		//가입하기 버튼 유효화 검사
		 var inval_Arr = new Array(4).fill(false);
		$('#sign_submit').click(function(){
			// 비밀번호가 같은 경우 && 비밀번호 정규식
			if (($('#pwd').val() == ($('#user_pwd').val()))
					&& pwJ.test($('#pwd').val())) {
				inval_Arr[0] = true;
			} else {
				inval_Arr[0] = false;
			}
			// 이름 정규식
			if (nameJ.test($('#user_name').val())) {
				inval_Arr[1] = true;	
			} else {
				inval_Arr[1] = false;
			}
			// 이메일 정규식
			if (mailJ.test($('#email').val())){
				console.log(mailJ.test($('#email').val()));
				inval_Arr[2] = true;
			} else {
				inval_Arr[2] = false;
			}
			// 휴대폰번호 정규식
			if (phoneJ.test($('#phoneno').val())) {
				console.log(phoneJ.test($('#phoneno').val()));
				inval_Arr[3] = true;
			} else {
				inval_Arr[3] = false;
			}
		
			
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			if(validAll){ // 유효성 모두 통과
				 $("#registerForm").attr("action", "registersuccess");
		            $("#registerForm").submit();
				
			} else{
				alert('입력한 정보들을 다시 한번 확인해주세요 :)')
				location.href="${pageContext.request.contextPath}/registerForm"
				
			}
		});
	 
});	

</script>
</head>
<body>
<div id="regi">
<br><br><br><br><br><br>
<div align="center"  style="font-weight: bold;">
<div style="background:url(${pageContext.request.contextPath}/resources/img/regi.jpg) no-repeat; opacity:0.8; z-index:-1; 
	                                width: 1000px; height:800px; margin-left:50px;">
   	<div class="titlestyle" align="center" style="font-weight: bold;">
   		<hi>회원가입</hi><br><hr><br>
   	</div>
   	<form method="POST" id="registerForm">
   		<!-- user_id -->
   		<div class="form-group" align="center">
   			<label for="user_id"><span id="s">*</span> 아이디&nbsp;</label>
   			<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디" required>
   			<div class="check_font" id="id_check"></div>
   		</div>
   		<!-- pwd -->
   		<div class="form-group" align="center">
   			<label for="pwd" style="margin-left:-12px;"><span id="s">*</span> 비밀번호&nbsp;</label>
   			<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호 " required>
   			<div class="check_font" id="pw_check"></div>
   		</div>
   		<!-- password confirm -->
   		<div class="form-group">
   			<label for="user_pwd" style="margin-left:-45px;"><span id="s">*</span> 비밀번호 확인&nbsp;</label>
   			<input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="비밀번호 확인" required>
   			<div class="check_font" id="pw2_check"></div>
   		</div>
   		<!-- phoneno -->
   		<div class="form-group">
   			<label for="phoneno" style="margin-left:-26px;"><span id="s">*</span> 휴대폰번호&nbsp;</label>
   			<input type="text" class="form-control" id="phoneno" name="phoneno" placeholder="휴대폰번호('-'없이 번호만 입력)" required>
   			<div class="check_font" id="phone_check"></div>
   		</div>
   		<!-- email -->
   		<div class="form-group">
   			<label for="email" style="margin-right:3px;"><span id="s">*</span> E-mail&nbsp;</label>
   			<input type="text" class="form-control" id="email" name="email" placeholder="E-mail" required >
   			<div class="check_font" id="email_check"></div>
   		</div>
   		<!-- user_name -->
   		<div class="form-group">
   			<label for="user_name" style="margin-right:18px;"><span id="s">*</span> 이름&nbsp;</label>
   			<input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름" required>
   			<div class="check_font" id="name_check"></div>
   		</div>
   		<!-- birthday -->
   		<div class="form-group" style="margin-top:5px;">
   			<label for="birthday" style="margin-left:-8px;"><span id="s">*</span> 생년월일&nbsp;</label>
   			<input type="date" class="birthday" id="birthday" name="birthday" placeholder="ex)1990-01-01" required>
   			<div class="check_font" id="birth_check"></div>
   		</div>
   		
   		<!-- addr -->
		<div class="form-group">
			<label for="addr" style="margin-top:10px; margin-left:-160px;"><span id="s">*</span> 주소&nbsp;&nbsp;</label>
				<select name="addr1" id="addr1"></select>
   				<select name="addr2" id="addr2"></select>
			<div class="check_font" id="addr_check"></div>	
		</div>
   		
   		<!-- gender -->
   		<div class="gender">
   			<label for="gender" style="margin-top:10px; margin-left:-220px; margin-bottom:50px;"><span id="s">*</span> 성별&nbsp;&nbsp;</label>
   				<label for="man">남자</label>
   				<input type="radio" class="gender" id="man" name="gender" value="남자" placeholder="Gender" required>
   				<label for="woman">여자</label>
   				<input type="radio" class="gender" id="woman" name="gender" value="여자" placeholder="Gender" required>
   			<div class="check_font" id="gender_check"></div>
   		</div>
   		
		<!-- 가입버튼 -->
		<div class="sign_button" align="center">
			<a class="btn btn-danger px-3" href="${pageContext.request.contextPath }/mainpage">
				<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
			</a>&emsp;&emsp;
			<button class="btn btn-success px-3" id="sign_submit">
				<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
			</button>
		</div>   		
   	</form><br>
   	</div>
   </div><br><br><br>
   <script src="${pageContext.request.contextPath}/resources/js/writeboard.js"></script>
   </div>
</body>
</html>