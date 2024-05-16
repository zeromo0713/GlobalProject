<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 결과</title>
    <style>
        /* 헤더 영역 스타일 */
        #headarea {
            text-align: center; /* 텍스트 가운데 정렬 */
            padding: 10px; /* 안쪽 여백 설정 */
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

        /* 가운데 정렬 스타일 */
        body {
            display: flex; /* Flex 컨테이너로 설정 */
            flex-direction: column; /* 수직 방향으로 아이템 배치 */
            align-items: center; /* 아이템을 수평 가운데 정렬 */
            justify-content: center; /* 아이템을 수직 가운데 정렬 */
            height: 100vh; /* 뷰포트의 100% 높이를 사용하여 화면 가운데 정렬 */
            margin: 0; /* 페이지 기본 마진 제거 */
        }

        /* 버튼 스타일 */
        .button {
            display: inline-block;
            padding: 15px 30px; /* 버튼 내부 여백 설정 */
            font-size: 20px; /* 글자 크기 설정 */
            font-weight: bold; /* 글자 굵기 설정 */
            text-align: center;
            text-decoration: none;
            border-radius: 30px; /* 둥근 모서리 */
            background-color: #D8D8D8; /* 배경색 설정 */
            color: black; /* 글자색 설정 */
            cursor: pointer; /* 커서 스타일 변경 */
            margin-top: 20px; /* 버튼 위 여백 설정 */
        }

        .button:hover {
            background-color: #848484; /* 호버 시 배경색 변경 */
        }

        /* 주문 내역 스타일 */
        #orderList {
            list-style-type: none; /* 목록 기호 제거 */
            padding: 0;
            text-align: left; /* 텍스트 왼쪽 정렬 */
            font-size: 24px; /* 주문 내역 글씨 크기 */
            font-weight: bold; /* 글자 굵기 설정 */
        }

        #orderList li {
            margin-bottom: 10px; /* 주문 항목 간 여백 설정 */
        }

        /* 총 결제 금액 스타일 */
        #totalPrice {
            font-size: 24px; /* 글씨 크기 설정 */
            margin-top: 20px; /* 위 여백 설정 */
            font-weight: bold; /* 글자 굵기 설정 */
        }
    </style>
</head>
<body>
    <!-- 헤더 영역 -->
    <div id="headarea">
        <header>
            <a href="/"><h1>Food Court</h1></a>
        </header>
    </div>

    <h2>${message}</h2>
    
    <!-- 주문 내역 표시 -->
    <ul id="orderList">
        <!-- 주문 내역은 JavaScript에서 동적으로 추가될 것입니다. -->
    </ul>

    <!-- 총 결제 금액 표시 -->
    <div id="totalPrice">총 결제 금액: <span>${totalPrice}</span>원</div>

    <hr />
    <!-- '처음으로' 버튼 추가 -->
    <a href="/" class="button">처음으로</a>

    <!-- JavaScript 코드 -->
    <script>
        // JSP 페이지에서 모델에 추가된 주문 정보를 사용
        var selectedItems = JSON.parse('${selectedItems}');
        var totalPrice = '${totalPrice}';

        // 주문 내역을 표시하는 함수
        function displayOrderList() {
            var orderList = document.getElementById("orderList");
            var totalPriceSpan = document.getElementById("totalPrice").querySelector("span");

            // 선택된 항목과 총 결제 금액을 리스트로 표시
            for (var item in selectedItems) {
                var listItem = document.createElement("li");
                listItem.textContent = item + ' ' + selectedItems[item] + '개';
                orderList.appendChild(listItem);
            }
            
            // 총 결제 금액을 업데이트
            totalPriceSpan.textContent = totalPrice;
        }

        // 페이지가 로드될 때 주문 내역 표시 함수 호출
        window.onload = function() {
            displayOrderList();
        };
    </script>
</body>
</html>