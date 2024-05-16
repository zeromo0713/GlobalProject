<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
	<style>
		body {
    		/* background-color: #FBFBEF; */
    		margin: 0; /* body의 기본 마진을 제거합니다. */
            padding: 0; /* body의 기본 패딩을 제거합니다. */
            background-size: cover; /* 배경 이미지가 화면을 가득 채우도록 설정합니다. */
            background-position: center; /* 배경 이미지를 화면 중앙에 배치합니다. */
            font-family: Arial, sans-serif; /* 기본 폰트를 설정합니다. */
    	}
		/*---------------------------헤더 영역 스타일--------------------------*/
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
		    font-size: 100px;
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
		/*---------------------------container 영역 스타일--------------------------*/
        /* container 영역 스타일 */
        
		#container {
			text-align: center; /* 텍스트 중앙 정렬 */
			margin: 0 auto; /* 상단 여백 추가 */
			width : 80%
		}

		#container a {
			text-decoration: none; /* 밑줄 제거 */
			display: inline-block; /* 인라인 블록 요소로 변경하여 너비 설정 가능 */
			padding: 50px 100px; /* 내부 여백 추가 */
			/* border: 2px solid #333; */ /* 테두리 추가 */
			border-radius: 10px; /* 둥근 테두리 */
			font-size: 45px; /* 글꼴 크기 */
			margin-right: 10px; /* 오른쪽 여백 추가 */
			font: bold;
			margin: 0 auto; 
			width : 19%;
			background-color: white;
			font-style: italic;
		    color: black;
		    text-shadow: 2px 2px 4px rgba(0,0,0,0.5); /* 그림자 효과 추가 */
		}

		#container a:hover {
			background-color: #333; /* 마우스 호버 시 배경색 변경 */
			color: #fff; /* 마우스 호버 시 글자색 변경 */
		}
         #header-nav {
            text-align: right;
            margin-top: 10px;
            margin-right: 20px;
        }

        #header-nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        #header-nav li {
            display: inline-block;
            margin-left: 10px;
        }

        #header-nav a {
            text-decoration: none;
            border-bottom: none; /* 밑줄 제거 */
            color: #333;
            font-size: 16px;
            display: inline-block;
            padding: 10px 20px;
            border-radius: 10%;
            background-color: #E7E6E4;
            font-weight: bold;
        }
        
        #header-nav a:hover {
            background-color: #E6E6FA;
        }
		
		.fadeShow {
		    position: relative;
		    width: 80%; /* 화면에 표시될 영역의 너비 */
		    height: 600px; /* 화면에 표시될 영역의 높이 */
		    overflow: hidden; /* 넘어가는 이미지를 가립니다. */
		    margin: 0 auto; /* 가운데 정렬을 위해 좌우 마진을 자동으로 설정합니다. */
		    display: flex; /* 내부 요소들을 가로로 나열하기 위해 Flexbox 레이아웃을 사용합니다. */
		    justify-content: center; /* 내부 요소들을 수평 방향으로 가운데로 정렬합니다. */
		    align-items: center; /* 내부 요소들을 수직 방향으로 가운데로 정렬합니다. */
		    
		}

		.fadeShow img {
		    position: absolute; /* 이미지를 겹쳐서 표시합니다. */
		    top: 50%; /* 상단 여백을 50%로 설정합니다. */
		    left: 50%; /* 좌측 여백을 50%로 설정합니다. */
		    transform: translate(-50%, -50%); /* 이미지를 가운데로 이동시킵니다. */
		    opacity: 0; /* 처음에는 투명합니다. */
		    transition: opacity 1s ease; /* 페이드 효과를 줍니다. */
		    width: 65%; /* 부모 요소에 맞게 조정 */
    		height: 100%; /* 부모 요소에 맞게 조정 */
		    max-width: 100%; /* 이미지의 최대 너비를 화면에 맞게 설정합니다. */
		    max-height: 100%; /* 이미지의 최대 높이를 화면에 맞게 설정합니다. */
		    /* object-fit: contain; */
		    object-fit: fill;
		}
	
/* .fadeShow {
    position: relative;
    width: 100%; /* 부모 요소 크기에 따라 조정됨 
    height: 600px; /* 화면에 표시될 영역의 높이 (필요에 따라 조정) 
    overflow: hidden;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
}

.fadeShow img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%; /* 부모 요소에 맞게 조정 
    height: 100%; /* 부모 요소에 맞게 조정 
    object-fit: cover; /* 이미지가 요소에 맞게 조정되도록 함 
    opacity: 0;
    transition: opacity 1s ease;
}
		 */
		
		
		
		.fadeShow img.active {
		    opacity: 1; /* 활성화된 이미지는 불투명하게 표시됩니다. */
		}

		
	</style>
</head>

<body>
	<div id="header-nav">
		<ul>
			<li><a href="/company/join">회원가입</a></li>  <!-- (a태그 회원가입 누르면 get방식)  -->
			<c:if test="${loginObj != null}">
			<li><a href="/company/logout">로그아웃</a></li>
			</c:if>
			<c:if test="${gradeName == '관리자'}"> 
                <li><a href="/company/manager">관리자</a></li> <!-- 관리자 페이지로 이동하는 링크 -->
            </c:if>
		</ul>
	</div>
	
	<div id="headarea">
		<header>
			<a href="/"><h1>Food Court</h1></a>
		</header>
	</div>
	<br /><br /><br />



	<!-- 메뉴 이미지 하나씩 홈 화면에 보여주기(메뉴 추천 느낌)  -->
	<div class="fadeShow">
		<div>
			<c:forEach var="menu" items="${exMenuList}">
				<img src="${menu.MENU_IMAGE}" alt="메뉴" />
			</c:forEach>	
		</div>
	</div>
	<br /><br />
	<div id="container">
		<a href="/company/login">회원</a>
		<a href="/company/menulist">메뉴판</a><br />
	</div>
	<br />


<a href="/company/test">test</a><br />
<a href="/company/test2">test2</a>


<script>
    // 문서가 완전히 로드되었을 때 실행되는 함수
    document.addEventListener('DOMContentLoaded', function() {
        // 슬라이드의 현재 인덱스를 나타내는 변수 초기화
        let slideIndex = 0;
        // 모든 슬라이드 요소를 가져와서 slides 변수에 할당
        const slides = document.querySelectorAll('.fadeShow img');
        
        // 특정 인덱스의 슬라이드를 보여주는 함수
        function showSlide(index) {
            // 모든 슬라이드 요소에서 'active' 클래스 제거
            slides.forEach(function(slide) {
                slide.classList.remove('active');
            });
            // 지정된 인덱스의 슬라이드에 'active' 클래스 추가
            slides[index].classList.add('active');
        }
        
        // 다음 슬라이드를 보여주는 함수
        function nextSlide() {
            // 다음 슬라이드의 인덱스 계산 (인덱스를 1 증가시키고, slides.length로 나눈 나머지를 취함)
            slideIndex = (slideIndex + 1) % slides.length;
            // 계산된 인덱스에 해당하는 슬라이드를 보여줌
            showSlide(slideIndex);
        }
        
        // 페이지가 로드될 때 첫 번째 슬라이드를 보여줌
        showSlide(slideIndex);
        
        // 일정 시간 간격으로 다음 슬라이드를 보여주는 타이머 설정
        setInterval(nextSlide, 2500);
    });
</script>

</body>
</html>
