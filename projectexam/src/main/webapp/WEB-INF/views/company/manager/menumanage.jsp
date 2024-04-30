<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴 관리 페이지</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif; /* 폰트 지정 */
            background-color: #f5f5f5; /* 배경 색상 지정 */
            margin: 0; /* 바깥 여백 제거 */
            padding: 0; /* 내부 여백 제거 */
        }

        /* 페이지 헤더 영역 스타일 */
        #headarea {
            text-align: center; /* 텍스트 가운데 정렬 */
            padding: 20px; /* 여백 추가 */
            background-color: #333; /* 배경 색상 지정 */
            color: white; /* 글자 색상 지정 */
            font-weight: bold; /* 글자 굵게 지정 */
            font-size: 28px; /* 글자 크기 지정 */
            margin: 0; /* 바깥 여백 제거 */
            width: 30%; /* 너비 지정 */
            margin: 20px auto; /* 가운데 정렬 */
        }

        /* 페이지 헤더 링크 스타일 */
        #headarea a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: white; /* 링크 글자 색상 지정 */
        }

        /* 페이지 메뉴 컨테이너 스타일 */
        #container {
            text-align: center; /* 텍스트 가운데 정렬 */
            margin-top: 20px; /* 위 여백 추가 */
        }

        /* 페이지 메뉴 링크 스타일 */
        #container a {
            text-decoration: none; /* 링크 밑줄 제거 */
            display: inline-block; /* 인라인 블록 요소로 변경하여 너비 설정 가능 */
            padding: 10px 20px; /* 내부 여백 추가 */
            border: 2px solid #333; /* 테두리 추가 */
            border-radius: 10px; /* 둥근 테두리 */
            font-size: 18px; /* 글꼴 크기 */
            margin-right: 10px; /* 오른쪽 여백 추가 */
            color: #333; /* 글자 색상 지정 */
        }

        /* 페이지 메뉴 링크 호버 스타일 */
        #container a:hover {
            background-color: #333; /* 호버 시 배경 색상 변경 */
            color: #fff; /* 호버 시 글자 색상 변경 */
        }

        /* 폼 컨테이너 스타일 */
        .form-container {
            width: 70%; /* 너비 지정 */
            margin: 20px auto; /* 가운데 정렬 */
            background-color: white; /* 배경 색상 지정 */
            padding: 20px; /* 여백 추가 */
            border-radius: 10px; /* 둥근 테두리 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        /* 폼 스타일 */
        form {
            display: flex; /* Flexbox 사용하여 요소 정렬 */
            flex-direction: column; /* 컬럼 방향으로 정렬 */
            align-items: center; /* 가운데 정렬 */
        }

        /* 폼 입력 필드 스타일 */
        form input,
        form select {
            margin: 10px 0; /* 여백 추가 */
            padding: 10px; /* 여백 추가 */
            border: 1px solid #ccc; /* 테두리 추가 */
            border-radius: 5px; /* 둥근 테두리 */
            width: calc(100% - 20px); /* 전체 너비에서 여백 제외 */
            box-sizing: border-box; /* 박스 모델 지정 */
        }

        /* 폼 버튼 스타일 */
        form button {
            background-color: #333; /* 배경 색상 지정 */
            color: white; /* 글자 색상 지정 */
            cursor: pointer; /* 커서 스타일 지정 */
            transition: background-color 0.3s; /* 배경 색상 변화 효과 지정 */
            padding: 10px; /* 여백 추가 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 둥근 테두리 */
            width: calc(100% - 20px); /* 전체 너비에서 여백 제외 */
            box-sizing: border-box; /* 박스 모델 지정 */
        }

        /* 폼 버튼 호버 스타일 */
        form button:hover {
            background-color: #555; /* 호버 시 배경 색상 변경 */
        }

        /* 테이블 스타일 */
        table {
            width: 70%; /* 너비 지정 */
            margin: 20px auto; /* 가운데 정렬 */
            border-collapse: collapse; /* 테이블 경계 스타일 지정 */
        }

        /* 테이블 셀 스타일 */
        th, td {
            border: 1px solid #ccc; /* 테두리 추가 */
            padding: 10px; /* 여백 추가 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        /* 테이블 헤더 스타일 */
        th {
            background-color: #f2f2f2; /* 배경 색상 지정 */
        }

        /* 카테고리 컨테이너 스타일 */
        .category-container {
            display: flex; /* Flexbox 사용하여 요소 정렬 */
            overflow-x: auto; /* 가로 스크롤바 표시 */
            margin-top: 20px; /* 위 여백 추가 */
            justify-content: center; /* 가운데 정렬 */
        }

        /* 카테고리 아이템 스타일 */
        .category-item {
            margin-right: 20px; /* 오른쪽 여백 추가 */
        }

        /* 리스트 아이템 스타일 */
        ul>li {
            padding: 3px; /* 여백 추가 */
            display: inline-block; /* 인라인 블록 요소로 변경하여 너비 설정 가능 */
            margin: 4px; /* 여백 추가 */
            cursor: pointer; /* 커서 스타일 지정 */
        }

        /* 링크 스타일 */
        li a{
            text-decoration: none; /* 밑줄 제거 */
            display: inline-block; /* 인라인 블록 요소로 변경하여 너비 설정 가능 */
            padding: 10px 20px; /* 내부 여백 추가 */
            border: 2px solid #333; /* 테두리 추가 */
            border-radius: 10px; /* 둥근 테두리 */
            font-size: 18px; /* 글꼴 크기 */
            margin-right: 10px; /* 오른쪽 여백 추가 */
        }
       	.select_img img{
			maring : 20px 0;
		}
    </style>
</head>
<body>
    <!-- 페이지 헤더 영역 -->
    <div id="headarea">
        <header>
            <a href="/company/manager">관리자 페이지</a>
        </header>
    </div>

    <!-- 페이지 메뉴 컨테이너 -->
    <div id="container">
        <a href="/company/manager/menumanage">메뉴 컨트롤</a>
        <a href="/company/manager/salesanalysis">판매분석</a>
        <a href="/company/manager/member">회원명단</a>
    </div>

    <!-- 카테고리 추가 폼 컨테이너 -->
    <div class="form-container">
        <h2>카테고리 추가</h2>
        <form action="/company/manager/menumanage/categoriadd" method="post">
            카테고리 이름 : <input type="text" name="categori_name" /><br />
            카테고리 아이디 : <input type="text" name="categori_id" /><br />
            <button>카테고리 추가</button>
        </form>
    </div>

    <!-- 메뉴 추가 폼 컨테이너 -->
    <div class="form-container">
        <h2>메뉴 추가</h2>
        <form action="/company/manager/menumanage/menuadd" method="post" enctype="multipart/form-data" >
            카테고리 :
            <select name="categori_name">
                <!-- 카테고리 목록 반복문 -->
                <c:forEach var="category" items="${categoriList}">
                    <option value="${category.categori_name}">${category.categori_name}</option>
                </c:forEach>
            </select><br />
            메뉴 이름: <input type="text" name="menu_name"/><br />
            메뉴 이미지 : <input type="file" id="menu_image" name="file" /><br />
            <div class="select_img"><img id="previewImage" src="" /></div>
      <!-- 		<button type="button" onclick="uploadImage()">이미지 업로드</button> -->
            메뉴 가격 : <input type="text" name="menu_price"/><br />
            메뉴 원가 : <input type="text" name="menu_cost"/><br />
            <input type="submit" id="submit" value="전송"/>
            <button>메뉴 추가</button>
        </form>
    </div>
    <!-- *참고용 알아두기* -->
 <!-- 현재 프로젝트의 실제 경로를 표시. 스프링 파일이 저장되는 워크스페이스와 다르므로, 파일을 저장할 때 실제 경로를 알기 위해서 -->
<!-- request.getRealPath("/") 이 경로를 기준으로 파일을 저장하고 불러올 수 있다 -->
<!-- 현재 프로젝트는 개발자의 컴퓨터에서 로컬로 실행되지만,  이 프로젝트가 완성되어 서버에 업로드하여 실행된다면 저 경로가 아닌 새로운 경로 확인 필요..무슨말인지는 저도 잘.. -->
<%-- <%=request.getRealPath("/") %> --%>  

    <!-- 메뉴 수정 폼 컨테이너 -->
    <div class="form-container">
        <h2>메뉴 수정</h2>
        <div>카테고리 목록</div>
        <!-- 카테고리 목록 반복문 -->
        <div class="category-container">
            <ul class="category-item">
                <c:forEach var="categori" items="${categoriList}">
                    <li class="categori_name">
                        <!-- 카테고리 별 링크 생성 -->
                        <a href="/company/manager/menumanage?categoryName=${categori.categori_name}">${categori.categori_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- 메뉴 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>메뉴이름</th>
                    <th>가격</th>
                    <th>원가</th>
                    <th>사용여부</th>
                </tr>
            </thead>
            <tbody>
                <!-- 메뉴 목록 반복문 -->
                <c:forEach var="menu" items="${menuList}">
                    <tr>
                        <td>${menu.menu_name}</td>
                        <!-- 메뉴 가격 수정 폼 -->
                        <td>
                            <form action="/company/manager/menumanage/menumodify" method="post">
                                <input type="hidden" name="menu_name" value="${menu.menu_name}">
                                <input type="text" name="menu_price" value="${menu.menu_price}">
                                <input type="submit" value="수정">
                            </form>
                        </td>
                        <!-- 메뉴 원가 수정 폼 -->
                        <td>
                            <form action="/company/manager/menumanage/menumodify" method="post">
                                <input type="hidden" name="menu_name" value="${menu.menu_name}">
                                <input type="text" name="menu_cost" value="${menu.menu_cost}">
                                <input type="submit" value="수정">
                            </form>
                        </td>
                        <!-- 메뉴 사용여부 수정 폼 -->
                        <td>
                            <form action="/company/manager/menumanage/menumodify" method="post">
                                <input type="hidden" name="menu_name" value="${menu.menu_name}">
                                <input type="text" name="menu_use" value="${menu.menu_use}">
                                <input type="submit" value="수정">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 메뉴 삭제 폼 컨테이너 -->
    <div class="form-container">
        <h2>메뉴 삭제</h2>
        <form action="/company/manager/menumanage/menudelete" method="post">
            메뉴 이름 : <input type="text" name="menu_name" />
            <button>삭제</button>
        </form>
    </div>
    
    
    
	 <!-- 현재 화면에서 어떤 이미지인지 미리보기 위해서 있는 스크립트 -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("menu_image").addEventListener("change", function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (data) {
                        document.getElementById("previewImage").src = data.target.result;
                        document.getElementById("previewImage").width = 200;
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });
        
     
	     // 페이지 로드 후 실행될 스크립트
	     window.onload = function() {
	         var gradeName = "${gradeName}"; // gradeName을 JSP 표현식을 통해 가져옵니다.
	         // 만약 gradeName이 존재하지 않거나 "관리자"가 아닌 경우
	         if (!gradeName || gradeName !== "관리자") {
	             alert("권한이 없습니다. 로그인 페이지로 이동합니다.");
	             // 로그인 페이지로 리다이렉트
	             window.location.replace("/company/login");
	         }
	     };

    </script>
</body>
</html>
