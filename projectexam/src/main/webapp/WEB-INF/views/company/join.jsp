<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    	<style>
		/* 전체 페이지 스타일 */
		body {
		    /* 웹 페이지 전체의 폰트를 Arial 또는 sans-serif로 설정 */
		    font-family: 'Arial', sans-serif;
		    background-color: #f5f5f5; /* 배경색 설정 */
		    margin: 0;
		    padding: 0;
		}
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
	    /* 컨텐츠 영역 스타일 */
	    .contentBox {
	        width: 55%;
	        margin: 20px auto; /* 가운데 정렬을 위한 여백 설정 */
	        background-color: white; /* 배경색 설정 */
	        padding: 20px; /* 안쪽 여백 설정 */
	        border-radius: 10px; /* 테두리 모서리 둥글게 설정 */
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	    }    
	    /* 회원가입 폼 스타일 */
		form.memForm{
	                width : 55%;
	                margin: 0 auto;
	              /*   border: solid 2px black; */
	                padding: 20px;
	    }
	     /* 버튼 스타일 */
	    button {
	        background-color: #333; /* 배경색 설정 */
	        color: white; /* 글자색 설정 */
	        cursor: pointer; /* 커서를 손가락으로 변경 */
	        transition: background-color 0.3s; /* 배경색 변화에 대한 부드러운 전환 설정 */
	    }
	    button:hover {
	        background-color: #555; /* 마우스 오버시 배경색 변경 */
	    }
		/* 푸터 영역 스타일 */
	    .footerBox {
	        width: 55%;
	        margin: 20px auto; /* 가운데 정렬을 위한 여백 설정 */
	        background-color: white; /* 배경색 설정 */
	        padding: 20px; /* 안쪽 여백 설정 */
	        border-radius: 10px; /* 테두리 모서리 둥글게 설정 */
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	        text-align: center; /* 텍스트 가운데 정렬 */
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
    <!-- 헤더 영역 -->
    <div id="headarea">
        <header>
            <a href="/"><h1>빵모의 음식가게</h1></a>
        </header>
    </div>

    <!-- 컨텐츠 영역 -->
    <div class="contentBox">
        <!-- 회원가입 폼 -->
        <form action="/company/join" class="memForm" method="post" onsubmit="return validateForm()">
            전화번호 : <input type="text" id="mem_ph_num" name="mem_ph_num" /><br />
            성별 :
            <label><input type="radio" name="mem_gender" value="1"> 남자</label>
            <label><input type="radio" name="mem_gender" value="2"> 여자</label><br />
            생년월일 :
            <select name="mem_birth_year"></select> <!-- JavaScript로 연도 옵션 생성 -->
            <select name="mem_birth_month"></select> <!-- JavaScript로 월 옵션 생성 -->
            <select name="mem_birth_day"></select><br /> <!-- JavaScript로 일 옵션 생성 -->
            <button type="submit">회원가입</button>
        </form>
    </div>

	 <!-- 모달 창 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p id="modalText"></p>
        </div>
    </div>



    <!-- 푸터 영역 -->
    <div class="footerBox">
        <p>빵모의 음식가게 전화번호 및 등등 정보</p>
    </div>
	
	
    <script>
        // 현재 연도 구하기
        var currentYear = new Date().getFullYear();

        // 연도 옵션 생성
        for (var i = currentYear; i >= currentYear - 120; i--) {
            document.querySelector('select[name="mem_birth_year"]').innerHTML += '<option value="' + i + '">' + i + '</option>';
        }

        // 월 옵션 생성
        for (var i = 1; i <= 12; i++) {
            document.querySelector('select[name="mem_birth_month"]').innerHTML += '<option value="' + i + '">' + i + '월</option>';
        }
	 	// 일 옵션 생성
	    function updateDays() {
	        var year = document.querySelector('select[name="mem_birth_year"]').value;
	        console.log("=====111111111===year===="+year);
	        var month = document.querySelector('select[name="mem_birth_month"]').value;
	        console.log("=====222222222===month===="+month);
	        var daysInMonth = new Date(year, month, 0).getDate(); // 해당 월의 마지막 날짜 구하기
	        console.log("=====33333333333==daysInMonth====="+daysInMonth);
	        document.querySelector('select[name="mem_birth_day"]').innerHTML = ''; // 일 옵션 초기화
	        for (var i = 1; i <= daysInMonth; i++) {
	            document.querySelector('select[name="mem_birth_day"]').innerHTML += '<option value="' + i + '">' + i + '일</option>';
	        }
	    }
	    updateDays(); // 페이지 로드시 일 옵션 초기화
	
	    // 연도나 월이 변경될 때마다 일 옵션 업데이트
	    document.querySelector('select[name="mem_birth_year"]').addEventListener('change', updateDays);
	    document.querySelector('select[name="mem_birth_month"]').addEventListener('change', updateDays);

        // 회원가입 폼 유효성 검사
        function validateForm() {
            var phoneNumber = document.getElementById('mem_ph_num').value;
            var genderChecked = document.querySelector('input[name="mem_gender"]:checked');

            if (phoneNumber.trim() === '') {
                showModal('전화번호를 입력해주세요!');
                return false;
            }
            if (phoneNumber.length < 8) {
                showModal('핸드폰 번호는 8자리 이상으로 입력하세요!');
                return false;
            }
            if (!genderChecked) {
                showModal('성별을 선택해주세요!');
                return false;
            }
            return true;
        }

        // 모달 창 표시 함수
        function showModal(message) {
            var modal = document.getElementById('myModal');
            var modalText = document.getElementById('modalText');
            modalText.innerText = message;
            modal.style.display = 'block';
        }

        // 모달 창 닫기 함수
        function closeModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = 'none';
        }
        // 모달 창 표시 여부 확인
        // EL활용 message라는 변수가 비어있는지 확인하는 조건 ==> message 변수가 비어 있지 않을 때 모달 창에 해당 메시지를 표시 (이미 존재하는 회원의 경우)
        <c:if test="${not empty message}">
            showModal("${message}");
        </c:if>
    </script>
</body>
</html>
