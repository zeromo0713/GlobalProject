<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<style>
		/* 기존 스타일 유지 */
		/* 헤더 영역 스타일 */
        #headarea {
            text-align: center; /* 텍스트 가운데 정렬 */        
            padding: 20px; /* 안쪽 여백 설정 */
            /* background-color: #F5F6CE; */
            width: 50%;
            height: 120px; 
            margin: 0 auto; 
        }
        #headarea h1 {
        	font-weight: bold;
		    font-size: 60px;
		    margin: 0;
		    font-style: oblique; /* 더 누워있는 듯한 효과 적용 */
		    /* font-family: 'Times New Roman', cursive; */	/* 옛날 붓글씨 느낌의 글꼴 적용 */
		    /* font-family: 'Inter', sans-serif;	 */	
		    font-family: 'Indie Flower', cursive; /* handwriting 스타일의 글꼴 */
		    color: black;
		    text-shadow: 2px 2px 4px rgba(0,0,0,0.5); /* 그림자 효과 추가 */
        }

        #headarea a {
            text-decoration: none; /* 링크 밑줄 제거 */
        }
		form.loginForm{
			border : black 2px solid;
			width : 30%;
			margin : 0 auto;
		}

		div.join{
			width : 30%;
			margin : 0 auto;
		}

		/* 수정된 스타일 추가 */
		.form-group {
			margin-bottom: 15px;
		}

		.form-group input {
			width: 100%;
			padding: 8px;
			box-sizing: border-box;
		}

		.form-group button {
			width: 100%;
			padding: 10px;
			box-sizing: border-box;
			border: none;
			border-radius: 20px;
			background-color: #424242;
			color: #fff;
			cursor: pointer;
		}

		.form-group button:hover {
			background-color: #2980b9;
		}

		/* 수정된 로그인 폼 스타일 */
		form.loginForm{
			border : black 2px solid;
			width : 30%;
			margin : 0 auto;
			border-radius: 20px;
			padding: 15px;
			background-color: #fff;
		}

		/* 추가된 스타일 */
		div.join {
			width : 30%;
			margin : 0 auto;
			text-align: center; /* 텍스트 가운데 정렬 */
		}

		/* 회원가입 링크 스타일 */
		div.join a {
			text-decoration: none; /* 밑줄 제거 */
			color: #777; /* 옅은 회색 */
			transition: color 0.3s; /* 색상 변경 시 부드러운 효과 */
		}

		div.join a:hover {
			color: #333; /* 마우스 호버 시 진한 회색으로 변경 */
		}

		div.join a:active {
			color: #000; /* 클릭 시 색상 변경 */
		}
		
		/* 모달 창 스타일 */
		.modal {
			display: none; /* 기본적으로 숨김 */
			position: fixed; /* 고정 위치 */
			z-index: 1; /* 최상위 */
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto; /* 모달 창 내용이 넘칠 경우 스크롤 허용 */
			background-color: rgba(0,0,0,0.4); /* 반투명 배경 */
			padding-top: 60px; /* 모달 내용 상단 여백 */
		}

		/* 모달 내용 스타일 */
		.modal-content {
			background-color: #fefefe;
			margin: 5% auto; /* 중앙 정렬 */
			padding: 20px;
			border: 1px solid #888;
			width: 20%;
			border-radius: 10px;
		}

		/* 모달 창 닫기 버튼 스타일 */
		.close {
			color: #aaa;
			float: right;
			font-size: 28px;
			font-weight: bold;
		}

		.close:hover,
		.close:focus {
			color: black;
			text-decoration: none;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div id="headarea">
		<header>
			<a href="/"><h1>빵모의 음식가게</h1></a>
		</header>
	</div>
	
	
	<!-- 로그인 폼 영역 -->
	<c:if test="${loginObj == null}">
		<div>
			<form class="loginForm" action="/company/login" method="post">
				<div class="form-group">
					<label for="mem_ph_num">핸드폰번호 :</label>
					<input type="text" name="mem_ph_num" id="mem_ph_num" />
				</div>
				<div class="form-group">
					<label for="mem_unique_num">고유번호 :</label>
					<input type="password" name="mem_unique_num" id="mem_unique_num" />
				</div>
				<div class="form-group">
					<button type="submit">로그인</button>
				</div>
				<div class="join">
					<a href="/company/join">회원가입<!-- (get방식) --></a>
				</div>
			</form>
		</div>
		<!-- 모달 창 -->
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p id="modalText">핸드폰 번호와 고유번호를 입력해주세요!</p>
			</div>
		</div>	
	</c:if>

   
	
	<c:if test="${loginObj != null}">
	<a href="/company/logout">로그아웃</a><br />
	</c:if>
	

<script>
		// 모달 창 닫기 버튼 동작
		var modal = document.getElementById('myModal');
		var span = document.getElementsByClassName("close")[0];
		span.onclick = function() {
			modal.style.display = "none";
		}

		// 폼 제출 시 모달 창 표시  (핸드폰 번호나 고유번호, 혹은 두 다 입력되지 않았을 때)
		document.querySelector('.loginForm').addEventListener('submit', function(event) {
			var phoneNumber = document.getElementById('mem_ph_num').value;
			var uniqueNumber = document.getElementById('mem_unique_num').value;
			if (phoneNumber.trim() === '' || uniqueNumber.trim() === '') {
				document.getElementById('modalText').innerText = '핸드폰 번호와 고유번호를 입력해주세요!!';
				modal.style.display = 'block';
				event.preventDefault(); //전송 취소
			}
			
		});
		
		//로그인 실패 모달 창 (핸드폰 번호 또는 고유번호가 일치하지 않을 때)	
		//로그인 실패 시, 입력했던 핸드폰 번호는 남겨두기
		<% if (request.getAttribute("loginError") != null) { %>
			document.getElementById('mem_ph_num').value = '<%= request.getParameter("mem_ph_num") %>';   
			document.getElementById('modalText').innerText = '<%= request.getAttribute("loginError") %>';
			modal.style.display = 'block';
		<% } %>
		
	</script>
</body>
</html>
