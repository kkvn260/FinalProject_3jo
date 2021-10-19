<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

    #container{
       font-family: 'Gowun Dodum', sans-serif;
    }
	#buttons{
		margin-top: 70px;

	}
	#cancel{
		border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border: 1px solid white;
	}
	
	#idsearchbtn{
		border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border: 1px solid white;
	
	}
	input{
		margin-top: 30px;
	}
</style>

<script>
$(document).ready(function(){
	
	$('#idsearchbtn').one('click',function(){
		let user_name=$('#user_name').val();
		let birthday=$('#birthday').val();
		let phoneno=$('#phoneno').val();
		let d={user_name:user_name
				,birthday:birthday
				,phoneno:phoneno
				};
		$.ajax({
			type:'post'
			,url:"${pageContext.request.contextPath}/member/findidresult"
			,dataType:'text'
			,data:JSON.stringify(d)
			,contentType:'application/json;charset=utf-8'
			,success:function(data){
				if(data){
					$('#result').append("아이디는"+"'"+data+"'"+"입니다").css('color','blue').css('font-weight','bold').css('font-size','20px');
				}else{
					$('#result').text("등록된 아이디가 없습니다").css('color','blue').css('font-weight','bold').css('font-size','20px');
				}
				
			}
			,error:function(data){
				console.log(data);
				console.log("error");
			}
		});
		
	
		
	
	});
	
	$('#cancel').click(function(){
		var url = "${pageContext.request.contextPath}/login";
		$(location).attr('href',url);
	});
	

	
	});
	
	

</script>
</head>
<body>
<br><br><br><br><br><br>
<div id= "container">
<div id="title" align="center">
<h2 style="font-family: 'Gowun Dodum', sans-serif;">ID 찾기</h2>
</div>

<div id="findid_form" align="center">
<div id="result"></div>
<br>
<label for="user_name">이 름</label>
<input type="text" id="user_name" name="user_name" placeholder="ex)홍길동" required style="width: 350px;">
<br>
<label for="birthday">생 년 월 일</label>
<input type="date" id="birthday" name="birthday" placeholder="ex)1990-01-01" required style="width: 310px"><br>
<label for="phoneno">휴대폰번호</label>
<input type="text" id="phoneno" name="phoneno" placeholder="ex)010-1234-5489" required style="width: 310px"><br>

<div id="buttons">
	<button type="button" id="cancel" style="width: 200px; height: 50px; background-color: #ff2233; color: white">취소</button>
	<button type="button" id="idsearchbtn" style="width: 200px; height: 50px; background-color: blue; color: white" >확인</button>
	
</div>

</div>







</div>

</body>
</html>