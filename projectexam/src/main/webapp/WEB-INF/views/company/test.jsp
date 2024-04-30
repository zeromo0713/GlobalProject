<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->  <!-- j쿼리 사용 위해  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- j쿼리 사용 위해  --> <!-- 버전 차이..  -->
<style>
	.select_img img{
		maring : 20px 0;
	}
    .fadeShow {
        position: relative;
        width: 600px;
        height: 350px;
        overflow: hidden; /* 넘어가는 이미지를 가립니다. */
    }
    .fadeShow img {
        position: absolute; /* 이미지를 겹쳐서 표시합니다. */
        top: 50%; /* 상단 여백을 50%로 설정합니다. */
        left: 50%; /* 좌측 여백을 50%로 설정합니다. */
        transform: translate(-50%, -50%); /* 이미지를 가운데로 이동시킵니다. */
        opacity: 0; /* 처음에는 투명합니다. */
        transition: opacity 1s ease; /* 페이드 효과를 줍니다. */
        max-width: 100%; /* 이미지의 최대 너비를 화면에 맞게 설정합니다. */
        max-height: 100%; /* 이미지의 최대 높이를 화면에 맞게 설정합니다. */
    }
    .fadeShow img.active {
        opacity: 1; /* 활성화된 이미지는 불투명하게 표시됩니다. */
    }
</style>
</head>
<body>
<h1>실험용</h1>
${test} 


    <!-- 메뉴 추가 폼 컨테이너 -->
    <div class="form-container">
        <h2>메뉴 추가</h2>
        <form action="/company/test" method="post" enctype="multipart/form-data" >
            카테고리 :<input type="text" name="categori_name"/><br />
            메뉴 이름: <input type="text" name="menu_name"/><br />
            메뉴 이미지 : <input type="file" id="menu_image" name="file" /><br />
            <div class="select_img"><img id="previewImage" src="" /></div>
    	<!-- 	<button type="button" onclick="uploadImage()">이미지 업로드</button> -->
            메뉴 가격 : <input type="text" name="menu_price"/><br />
            메뉴 원가 : <input type="text" name="menu_cost"/><br />
            <button>메뉴 추가</button>
        </form>
    </div>
<hr />


<!-- 현재 프로젝트의 실제 경로를 표시. 스프링 파일이 저장되는 워크스페이스와 다르므로, 파일을 저장할 때 실제 경로를 알기 위해서 -->
<!-- request.getRealPath("/") 이 경로를 기준으로 파일을 저장하고 불러올 수 있다 -->
<!-- 현재 프로젝트는 개발자의 컴퓨터에서 로컬로 실행되지만,  이 프로젝트가 완성되어 서버에 업로드하여 실행된다면 저 경로가 아닌 새로운 경로 확인 필요..무슨말인지는 저도 잘.. -->
<%=request.getRealPath("/") %>
<hr />
<h2>나타나는 상품</h2>
<div class="view">
	<div>
		<c:forEach var="menu" items="${exMenuList}">
			메뉴 이름 : <span>${menu.MENU_NAME}</span><br />
			메뉴 가격 : <span>${menu.MENU_PRICE}</span><br />
			메뉴 이미지 : <img src="${menu.MENU_IMAGE}" alt="메뉴" />
		</c:forEach>	
	</div>
</div>

<hr />
<h2>이미지 애니매이션 전환</h2>

<div class="fadeShow">
	<div>
		<c:forEach var="menu" items="${exMenuList}">
			메뉴 이미지 : <img src="${menu.MENU_IMAGE}" alt="메뉴" />
		</c:forEach>	
	</div>
</div>
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
        setInterval(nextSlide, 3000);
    });
</script>




<!-- 현재 화면에서 어떤 이미지인지 미리보기 위해서 있는 스크립트 -->
<script>
    $("#menu_image").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (data) {
                $("#previewImage").attr("src", data.target.result).width(500);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
</script>

<!-- <script>
   function uploadImage() {
        var formData = new FormData();
        formData.append("file", $("#menu_image_path")[0].files[0]);

        $.ajax({
            url: '/upload', // 업로드를 처리할 서버의 엔드포인트
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                // 업로드 성공 시 추가 작업 수행
                console.log("Upload successful");
            },
            error: function (error) {
                console.error("Error uploading image", error);
            }
        });
    } 
</script> -->



</body>
</html>


