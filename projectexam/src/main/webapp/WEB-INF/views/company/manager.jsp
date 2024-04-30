<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		/* 헤더 영역 스타일 */
	    #headarea {
	        text-align: center;
	        padding: 20px;
	        background-color: #333;  /* 헤더 배경색 */
	        color: white; /* 헤더 텍스트 색상 */
	        font-weight: bold; /* 굵은 글꼴 */
	        font-size: 28px; /* 글꼴 크기 */
	        margin: 0; /* 상하 여백 제거 */ 
	        width : 30%;
	        margin: 20px auto;/* 가운데 정렬을 위한 여백 설정 */
	    }
	    #headarea a {
	        text-decoration: none;  /* 밑줄 제거 */
	        color: white; /* 링크 색상 */
	    }
	    #container {
			text-align: center; /* 텍스트 중앙 정렬 */
			margin-top: 20px; /* 상단 여백 추가 */
		}
		#container a {
			text-decoration: none; /* 밑줄 제거 */
			display: inline-block; /* 인라인 블록 요소로 변경하여 너비 설정 가능 */
			padding: 10px 20px; /* 내부 여백 추가 */
			border: 2px solid #333; /* 테두리 추가 */
			border-radius: 10px; /* 둥근 테두리 */
			font-size: 18px; /* 글꼴 크기 */
			margin-right: 10px; /* 오른쪽 여백 추가 */
		}
		#container a:hover {
			background-color: #333; /* 마우스 호버 시 배경색 변경 */
			color: #fff; /* 마우스 호버 시 글자색 변경 */
		}
		
	</style>
</head>
<body>
	<div id="headarea">
		<header>
			<a href="/company/manager">관리자 페이지</a>
		</header>
	</div>
	<div id="container">
		<a href="/company/manager/menumanage">메뉴 컨트롤</a>
		<a href="/company/manager/salesanalysis">판매분석</a>
		<a href="/company/manager/member">회원명단</a>
		<a href="/company/manager/discount">할인관리</a>
	</div>
${gradeName}
<a href="/">home</a>

<script>
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