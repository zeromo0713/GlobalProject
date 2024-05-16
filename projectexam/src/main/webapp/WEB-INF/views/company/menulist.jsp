<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴판</title>
    <style>
    	body {
    		/* font-family: Arial, sans-serif; */
    		font-family: 'Inter', sans-serif;   		
		    background-color: white;
		    margin: 0;
		    padding: 0;
    	}
    	/* 환영메시지 오른쪽으로  */
    	.welcome-message {
		    text-align: right;
		    margin-right: 12%;
		}
		h2 {
			text-align: center;
		}
		/*---------------------------헤더 영역 스타일--------------------------*/
        /* 헤더 영역 스타일 */
        #headarea {
            text-align: center; /* 텍스트 가운데 정렬 */        
            padding: 20px; /* 안쪽 여백 설정 */
            background-color: white;
            width: 75%;
            height: 180px; 
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
        
		/*-------------------------카테고리 컨테이너 스타일-----------------------*/
        /* 카테고리 컨테이너 스타일 */
        #categoryContainer {
            display: flex; /* Flex 컨테이너로 설정 */
            background-color: #FFF;
            padding: 20px 0;
            justify-content: center; /* 가운데 정렬 */
            /* overflow-x: auto; */ /* 가로로 넘칠 경우 스크롤 표시 */
            width : 77%; 
			margin: 0 auto;   /* 좌우 여백을 자동으로 설정하여 가운데 정렬합니다 */
			/* min-width: var(--site-width);*/ /* 최소 너비 설정 */ 
			
        }
        .category-item a {
            margin: 45px; /* 카테고리 간격 더 넓게 조정 */
            list-style: none; /* 리스트 마커 제거 */
            display: inline-block; /* 가로로 나열 */
            cursor: pointer; /* 커서 스타일 변경 */
            padding: 20px; /* 내부 여백 설정 */
            font-size: 40px; /* 글자 크기 설정 */
            font-weight: bold; /* 글자 굵기 설정 */
            text-decoration: none; /* 밑줄 제거 */
        }
        .category-item:hover {
            background-color: #E6E6E6; /* 호버 시 배경색 변경 */
            /* opacity: 0.6; */
        }
        #categoryContainer  ul {
            /* background-color: white; */ /* 배경색 설정 */
            color: white; /* 글자색 설정 */
            font-style: italic;
        }
        #categoryContainer  ul a{
        	color: black;
        }
        #categoryContainer ul li {
		   /*  margin-right: 30px; */ /* 카테고리 간격 더 넓게 조정 */
		    /* list-style: none; */ /* 리스트 마커 제거 */
		   /*  display: inline-block; */ /* 가로로 나열 */
		    /* cursor: pointer; */ /* 커서 스타일 변경 */
		    padding: 20px; /* 내부 여백 설정 */
		    font-size: 30px; /* 글자 크기 설정 */
		    font-weight: bold; /* 글자 굵기 설정 */
		    text-decoration: none; /* 밑줄 제거 */
		    border-radius: 20px;  /* 요소를 둥글게 만듦 */
		    border: 2px solid lightgray;  /* 테두리 스타일 지정 */
		    /* font-family: 'Times New Roman', cursive; */ /* 옛날 붓글씨 느낌의 글꼴 적용 */
		    font-family: 'Inter', sans-serif;	    
		}
		#categoryContainer button{
        	width: 100px;
        	font-size: 40px;
        	border: none;
        }
        
		
        /*-------------------------메뉴 목록 스타일-----------------------*/
        /* 메뉴 목록 스타일 */
		#menuListDiv {
		 	display: flex;
		    flex-wrap: wrap;
		    justify-content: center;
		    padding: 20px;
		    background-color: #FFF;
			width : 75%;
			margin: 0 auto; /* 좌우 여백을 자동으로 설정하여 가운데 정렬합니다 */
		}
        #menuListDiv ul {
            color: black; /* 글자색 설정 */
            display: flex;
            flex-wrap: wrap; /* 아이템이 넘칠 경우 자동으로 다음 줄로 이동 */
            justify-content: space-between;/* 아이템들을 간격을 두고 정렬 */ /* 이 부분 나중에 수정하여 한 줄에 메뉴 4개 아닐 때 양 끝에 생기는거 안되도록. */
            list-style: none;
            padding: 0;
        }
        #menuListDiv ul li {
            width: calc 25%; /* 4개씩 나열, 간격 조정을 위한 계산식 */
            margin: 5px; /* 각 아이템 간의 간격 조정 */
            text-align: center;
            padding: 10px;    
            font-size: 25px; /* 원하는 크기로 조정 */ 
            font-weight: bold; /* 진하게 설정 */
            border-radius: 25px; /* 요소를 둥글게 만듦 */
		    border: 2px solid black;  /* 테두리 스타일 지정 */
		    /* font-family: 'Times New Roman', cursive; */ /* 옛날 붓글씨 느낌의 글꼴 적용 */
		    font-family: 'Inter', sans-serif;	    
		    cursor: pointer;
        }
        #menuListDiv img {
		    width: 300px;
		    height: 180px;
		    object-fit: contain; 
		    /* object-fit: fill;*/
		    border-radius: 10px;
    		margin-bottom: 10px;
		}
		
        /*-------------------------주문 확인 (선택된 메뉴들) 스타일-----------------------*/
		/* 주문 확인 (선택된 메뉴들) 스타일 */
        .selected-item {
            padding: 5px; /* 내부 여백 설정 */
            display: inline-block; /* 가로로 나열 */
            margin: 5px; /* 마진 설정 */
            border-radius: 20px; /* 요소를 둥글게 만듦 */
		    border: 2px solid black; /* 테두리 스타일 지정 */
		    font: italic;  
		    font-size: 25px;
    		font-weight: bold;   
    		background-color: white;
    		text-align: center;
        }    
        #selectedItemsDiv {
            /* background-color: #F2F5A9; */
            width : 70%; /* 넓이는 70퍼센트로만 지정 */
            margin-left : 60px;
			/* margin: 0 auto; */ /* 좌우 여백을 자동으로 설정하여 가운데 정렬합니다 */ 
			display: inline-block;
			/* font-size: 30px; */
			font-weight: bold;
			border-radius: 25px; /* 요소를 둥글게 만듦 */
	    	border: 2px solid black; /* 테두리 스타일 지정 */
	    	
        }
        .selected-item button {
		    margin-left: 5px;
		    padding: 5px 10px;
		    font-size: 20px;
		    border: solid 1px black;
		    border-radius: 5px;
		    cursor: pointer;
		    background-color: white;
		    color: #333;
		    transition: background-color 0.3s ease;
		}
		
		.selected-item button:hover {
		    background-color: #AAA;
		    color: #FFF;
		}
        
        
        /*---------------------------------------------*/
        /* 주문 확인 및 결제 영역 스타일 */
        #selectAndPayment{
        	display : flex;
        	justify-content : space-between;
        	width: 80%;
        	margin: 0 auto;
        	align-items: center;
		    padding: 20px;
		    background-color: white;
        }
        
        #selectAndPayment #removeOrPaymentButton{
        	width: 25%
        }
        #selectAndPayment #removeOrPaymentButton button {
		    padding: 10px 20px; /* 위아래 여백을 20px, 좌우 여백을 30px로 설정 */
		    font-size: 25px; /* 글자 크기를 20px로 설정 */
		    font-weight: bold;
		    height: 150px;
		    /* width: 100%; */
		    margin: 5px 1px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    background-color: #646452;
		    color: #FFF;
		    transition: background-color 0.3s ease;
		}
		#selectAndPayment #removeOrPaymentButton button:nth-child(2) {
			background-color: #9E905D;
			width : 50%; 
		}
		#selectAndPayment #removeOrPaymentButton button:hover {
		    background-color: #B0AF91;
		    color: #FFF;
		}
        /* 전체 취소와 결제 버튼 스타일 */
        button {
            padding: 15px; /* 내부 여백 설정 */
            font-size: 18px; /* 글자 크기 설정 */
            cursor: pointer; /* 커서 스타일 변경 */
            border: none; /* 테두리 제거 */
            border-radius: 15px; /* 버튼을 동그랗게 만듦 */
            color: black;
            background-color: white;
            border-radius: 20px; /* 요소를 둥글게 만듦 */
	    	border: 2px solid black; /* 테두리 스타일 지정 */
        }
        button:hover {
			background-color: #E6E6E6; /* 호버 시 배경색 변경 */
		}
		
        /* 모달 디자인 */
		.modal {
		    display: none; /* 모달은 기본적으로 숨김 */
		    position: fixed; /* 페이지에 고정 */
		    z-index: 1; /* 다른 요소들 위에 표시 */
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto; /* 스크롤 가능하도록 */
		    background-color: rgba(0, 0, 0, 0.4); /* 배경색 및 투명도 조절 */
		    padding-top: 60px; /* 모달이 표시될 때 기존 콘텐츠를 가리기 위한 여백 */
		}
		
		.modal-content {
		    background-color: #fefefe;
		    margin: 10% auto; /* 모달을 가운데 정렬 */
		    padding: 20px;
		    border: 1px solid #888;
		    width: 50%; /* 모달 너비를 조정 */
		    max-width: 400px; /* 최대 너비 설정 */
		    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); /* 그림자 효과 */
		    border-radius: 10px; /* 모달의 모서리를 둥글게 만듦 */
		}
		
		/* 모달 닫기 버튼 */
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
		
		/* 버튼 컨테이너 내 버튼 가운데 정렬 및 간격 설정 */
		.button-container {
		    display: flex;
		    justify-content: center;
		    margin-top: 20px; /* 버튼과 제목 사이 간격 조정 */
		}
		
		/* 버튼 스타일 */
		.button-container button {
		    padding: 15px 30px; /* 위아래 여백을 15px, 좌우 여백을 30px로 설정 */
		    font-size: 18px; /* 글자 크기를 18px로 설정 */
		    margin: 0 10px; /* 버튼 간격을 설정 */
		    border: none; /* 테두리 제거 */
		    border-radius: 10px; /* 버튼을 둥글게 만듦 */
		    color: white;
		    background-color: #4CAF50; /* 버튼 배경색 */
		}
		
		.button-container button:hover {
		    background-color: #45a049; /* 호버 시 배경색 변경 */
		}

    </style>
</head>
<body>
    <!-- 헤더 영역 -->
    <div id="headarea">
        <header>
            <br /><a href="/"><h1>Food Court</h1></a>
        </header>
    </div>
    <hr style="color: lightgray; border-style: solid; border-width: 1px; border-color: lightgray; opacity: 0.5;">

    
	<!-- 환영 메시지 -->
	<c:if test="${loginObj != null}">
	    <h4 class="welcome-message">${loginObj.mem_ph_num} 님 환영합니다 <br />
	    보유 포인트 : ${loginObj.mem_point} 원<br />
	</c:if>
	<c:if test="${gradeName != null}">
	    ${gradeName} 등급입니다 <br /></h4>
	</c:if>
  	<br />
   
    <!-- 카테고리 영역 -->
	<div id="categoryContainer" class="con-min-width">
	    <!-- 이전 카테고리 보기 버튼 -->
	    <button id="prevCategory" data-index="0">◀️</button>	    
	    <!-- 카테고리 목록 반복 -->
	    <ul id="categoryList" class="top-bar__menu-box-1">
	        <li class="category-item">
	            <a href="/company/menulist?categoryName=추천">추천</a>
	        </li>
	        <c:forEach var="categori" items="${categoriList}">           	
	            <li class="category-item">
	                <!-- 카테고리에 대한 링크 생성 -->              
	                <a href="/company/menulist?categoryName=${categori.categori_name}">${categori.categori_name}</a>
	            </li>
	        </c:forEach>
	    </ul>
	    
	    <!-- 다음 카테고리 보기 버튼 -->
	    <button id="nextCategory" data-index="0">▶️</button>
	    
	</div>

 
    <hr style=" width:75%; color: lightgray; border-style: solid; border-width: 1px; border-color: lightgray; opacity: 0.5;">
    <!-- 메뉴 영역 -->
	<!-- 메뉴판 -->
	<h2>메뉴판</h2>
	<div id="menuListDiv"></div> <!-- 메뉴 목록이 나타날 위치 -->
	
	<div class="menuPerPageDiv" style="text-align: right; margin-right: 15%;">
	    <label for="menuPerPage" style="margin-right: 10px;">페이지당 메뉴 개수:</label>
	    <select id="menuPerPage" onchange="changeMenusPerPage()">
	        <option value="4">4개</option>
	        <option value="8">8개</option>
	        <option value="12">12개</option>
	    </select>
	</div>
	<br />
	
	<div id="paginationButtons" style="text-align: center;">
	    <button id="prevButton" style="width: 120px; height: 55px;">&lt; 이전</button>
	    <button id="nextButton" style="width: 120px; height: 55px;">다음 &gt;</button>
	</div>


 
    <br /><br />
    <hr style=" width:75%; color: lightgray; border-style: solid; border-width: 1px; border-color: lightgray; opacity: 0.5;">
	<!-- 주문 확인 및 결제 영역 -->
	<h2>주문 수량 확인 및 결제</h2>
	<div id="selectAndPayment">
	    <div id="selectedItemsDiv">
	        <!-- 선택된 상품이 없을 경우 메시지 표시 -->
	        <c:if test="${empty selectedItems}">
	            <p style="text-align: center; font-weight: bold; font-size: 30px;">
	                선택된 상품이 없습니다.<br>
	                상품을 담아주세요.
	            </p>
	        </c:if>
	    </div>
	    <div id="removeOrPaymentButton">
	        <button onclick="removeAllItems()">전체 취소</button>
	        <!-- "결제" 버튼 클릭 시 모달 열기 -->
	        <button type="button" onclick="openModal()">결제</button>
	    </div>
	</div>

    
	<!-- 결제 방법 선택을 위한 모달 -->
	<div id="paymentModal" class="modal">
	    <div class="modal-content">
	        <!-- x 버튼 추가 -->
	        <span class="close" onclick="closeModal()">&times;</span>
	        <h2>결제 방법 선택</h2>
	        <!-- 버튼을 가운데 정렬하고 둥근 정사각형 모양으로 스타일 변경 -->
	        <div class="button-container">
	            <button onclick="processPayment('card')">카드 결제</button>
	            <button onclick="processPayment('cash')">현금 결제</button>
	        </div>
	    </div>
	</div>



 

    <script>
        // 선택된 메뉴와 수량, 총 결제 금액을 저장하는 객체
        var selectedItems = {};
        var totalPrice = 0;

        // 메뉴와 가격 정보 (초기화)
        var menuPrices = {};

        // 서버에서 받아온 메뉴 목록 데이터 (JSON 형태로 파싱)  ==> 해당하는 카테고리별 메뉴만 받음 
       var serverMenuList = JSON.parse('${jsonMenuList.replace("\\\\", "\\\\\\\\")}');


        // 세션에 선택된 메뉴 정보와 총 결제 금액을 저장
        function saveToSession() {
            var dataToSave = {
                selectedItems: selectedItems,  //타입은 object
                totalPrice: totalPrice  		//타입은 number
            };
            sessionStorage.setItem("paymentData", JSON.stringify(dataToSave));	//paymentData 라는 세션 아이디로 저장
        }

        // 세션에 저장되어있는 선택된 메뉴와 선택 수량,  총 결제 금액을 불러옴
        function loadFromSession() {
            var savedData = sessionStorage.getItem("paymentData");
            if (savedData) {
                var parsedData = JSON.parse(savedData);
                selectedItems = parsedData.selectedItems || {};	//타입은 object
                totalPrice = parsedData.totalPrice || 0; 	//타입은 number
                updateSelectedItems();
            }
        }

     // 페이지 초기화 함수
        function initializePage() {
            // 메뉴 데이터 초기화
            for (var i = 0; i < serverMenuList.length; i++) {
                var menu = serverMenuList[i];
                // menuPrices 객체에 메뉴 이름(key)과 가격(value)을 추가
                menuPrices[menu.MENU_NAME] = {
                    price: menu.MENU_PRICE,
                    image: menu.MENU_IMAGE
                };
                console.log("===========menuPrices============="+menuPrices); 
                console.log("===========MENU_NAME============="+menu.MENU_NAME); 
                console.log("===========MENU_PRICE============="+menu.MENU_PRICE); 
                console.log("===========MENU_IMAGE============="+menu.MENU_IMAGE); 
            }

            // 메뉴 목록을 동적으로 생성
            renderMenuList();
            loadFromSession();
        }
     // 페이지당 표시될 메뉴의 개수를 저장할 변수
        var menusPerPage;
        // 사용자가 페이지당 메뉴 개수를 변경할 때 호출되는 함수
        function changeMenusPerPage() {
            // 사용자가 선택한 값을 변수에 저장
            menusPerPage = parseInt(document.getElementById('menuPerPage').value);
            // 변경된 값을 세션 스토리지에 저장
            sessionStorage.setItem('menusPerPage', menusPerPage);
            // 메뉴 목록을 다시 렌더링
            renderMenuList();
        }
        
        
        var menuStartIndex = 0;
     // 다음 페이지로 이동하는 함수
        function nextPage() {
            if (menuStartIndex + menusPerPage < serverMenuList.length) {
            	menuStartIndex += menusPerPage;
                renderMenuList();
            }
        }

        // 이전 페이지로 이동하는 함수
        function prevPage() {
            if (menuStartIndex - menusPerPage >= 0) {
            	menuStartIndex -= menusPerPage;
                renderMenuList();
            }
        }

        // 다음 버튼 클릭 시 다음 페이지로 이동
        document.getElementById('nextButton').addEventListener('click', nextPage);

        // 이전 버튼 클릭 시 이전 페이지로 이동
        document.getElementById('prevButton').addEventListener('click', prevPage);

     // 메뉴 목록을 동적으로 생성하는 함수
        function renderMenuList() {
            var menuListDiv = document.getElementById("menuListDiv");
            menuListDiv.innerHTML = ""; // 메뉴 목록 초기화

            var ul = document.createElement("ul");

            // 시작 인덱스부터 페이지당 메뉴 개수만큼 반복하여 메뉴 생성
            for (var i = menuStartIndex; i < Math.min(serverMenuList.length, menuStartIndex + menusPerPage); i++) {
                var menu = serverMenuList[i];
                // 메뉴 생성 코드...
                var li = document.createElement("li");
                console.log(menuPrices[menu.MENU_NAME].price);

                var content = '<img src="' + menuPrices[menu.MENU_NAME].image + '" alt="' + menu.MENU_NAME + '" width="300" height="350"><br />' +
                    menu.MENU_NAME + ' </br> ' + menuPrices[menu.MENU_NAME].price + '원';

                li.innerHTML = content;

                // 각 메뉴 클릭 시 selectItem 함수 호출
                li.onclick = (function(menuName) {
                    return function() {
                        selectItem(menuName);
                    };
                })(menu.MENU_NAME);

                ul.appendChild(li);
                
              
            }

            // 현재 선택된 카테고리의 li 태그에 white 색상 배경 적용
            highlightSelectedCategory();
            menuListDiv.appendChild(ul);
        }
    
     // 페이지 로드 시 호출되는 함수
        window.onload = function() {
            // 세션 스토리지에서 사용자가 선택한 값 가져오기
            menusPerPage = parseInt(sessionStorage.getItem('menusPerPage')) || 12;
            document.getElementById("menuPerPage").value = menusPerPage;
            // 메뉴 목록을 초기화하고 렌더링
            initializePage();
        };

        // 메뉴를 선택할 때 호출되는 함수
        function selectItem(item) {
            // 이미 선택된 메뉴라면 수량 증가, 아니면 수량을 1로 설정
            if (selectedItems[item]) {
                selectedItems[item]++;
            } else {
                selectedItems[item] = 1;
            }

            // 선택된 메뉴들 업데이트
            updateSelectedItems();
        }

        // 선택된 메뉴를 취소할 때 호출되는 함수
        function removeItem(item) {
            // 선택된 메뉴의 수량을 감소, 0이면 삭제
            if (selectedItems[item] && selectedItems[item] > 0) {
                selectedItems[item]--;
                if (selectedItems[item] === 0) {
                    delete selectedItems[item];
                }
            }

            // 선택된 메뉴들 업데이트
            updateSelectedItems();
        }
        
     	// 선택된 메뉴를 추가할 때 호출되는 함수
        function addItem(item) {
            // 선택된 메뉴의 수량을 감소, 0이면 삭제
            if (selectedItems[item] && selectedItems[item] > 0) {
                selectedItems[item]++;
                if (selectedItems[item] === 0) {
                    delete selectedItems[item];
                }
            }

            // 선택된 메뉴들 업데이트
            updateSelectedItems();
        }

        // 전체 취소 함수
        function removeAllItems() {
            // 선택된 메뉴 초기화
            selectedItems = {};
            // 선택된 메뉴들 업데이트
            updateSelectedItems();
            // 세션에서 데이터도 삭제
            sessionStorage.removeItem("paymentData");
        }

        // 선택된 메뉴들을 업데이트하고 총 결제 금액을 계산하는 함수
        function updateSelectedItems() {
            var selectedItemsDiv = document.getElementById("selectedItemsDiv");
            selectedItemsDiv.innerHTML = "";
            totalPrice = calculateTotalPrice(); // 총 결제 금액 계산

            // 각 선택된 메뉴에 대해 화면에 표시 및 총 가격 계산
            for (var item in selectedItems) {
            	console.log("---------item--------->>"+item);
            	console.log("---------selectedItems--------->>"+selectedItems);
            	console.log("---------selectedItems[item]--------->>"+selectedItems[item]);
                selectedItemsDiv.innerHTML += "<div class='selected-item'>" + 
                								"<button onclick='addItem(\"" + item + "\")'>+</button>&nbsp&nbsp" +
                                               item + " : " + selectedItems[item] + 
                                               "&nbsp&nbsp<button onclick='removeItem(\"" + item + "\")'>-</button></div>";
            }

            // 총 결제 금액 표시
            selectedItemsDiv.innerHTML += "</br><div class='selected-item'>총 결제 금액: " + totalPrice + "</div>";
            saveToSession();
        }

     // 결제 방법 선택을 처리하는 함수
        function selectPaymentMethod(method) {
          // 선택된 결제 방법을 저장
          sessionStorage.setItem("paymentMethod", method);
          // 모달 닫기
          var modal = document.getElementById("paymentModal");
          modal.style.display = "none";
        }

     // 결제 페이지로 이동하는 함수
        function processPayment(paymentMethod) {
            // 선택된 결제 방법과 함께 결제 페이지로 이동
            var selectedItemsStr = encodeURIComponent(JSON.stringify(selectedItems));
            var totalPrice = calculateTotalPrice();
            var paymentURL = "/company/payment?selectedItems=" + selectedItemsStr + "&totalPrice=" + totalPrice + "&paymentMethod=" + paymentMethod;
            
         // 포인트 사용 여부 확인
            <c:if test="${loginObj != null}">
                var usePoints = confirm("포인트를 사용하시겠습니까?");
                if (usePoints) {
                    var pointsToUse = parseInt(prompt("사용할 포인트를 입력하세요.", "0"));
                    if (pointsToUse <= 0) {
                        // 사용할 포인트가 0 이하일 경우
                        alert("포인트를 사용하지 않습니다.");
                    } else if (pointsToUse > parseInt('${loginObj.mem_point}')) {
                        // 사용할 포인트가 보유 포인트를 초과할 경우
                        alert("보유한 포인트보다 많은 포인트를 사용할 수 없습니다.");
                    } else {
                        // 사용할 포인트가 유효한 경우
                        var totalPrice = calculateTotalPrice(); // 총 결제 금액 계산
                        var remainingPrice = totalPrice - pointsToUse; // 남은 금액 계산

                        // 결제 페이지로 이동
                        var paymentURL = "/company/payment?selectedItems=" + selectedItemsStr + "&totalPrice=" + remainingPrice + "&paymentMethod=" + paymentMethod + "&pointsToUse=" + pointsToUse ;
                     	// 결제와 동시에 세션 삭제
                        sessionStorage.removeItem("paymentData"); // 선택한 상품 및 수량 확인 부분 삭제
                        sessionStorage.removeItem('startIndex'); // 이전 startIndex 값을 삭제
                        sessionStorage.removeItem('menusPerPage'); // 이전 menusPerPage 값을 삭제
                        window.location.href = paymentURL;
                    }
                } else {
                    // 포인트를 사용하지 않는 경우
                    var totalPrice = calculateTotalPrice(); // 총 결제 금액 계산
                    var paymentURL = "/company/payment?selectedItems=" + selectedItemsStr + "&totalPrice=" + totalPrice + "&paymentMethod=" + paymentMethod;
                    // 결제와 동시에 세션 삭제
                    sessionStorage.removeItem("paymentData"); // 선택한 상품 및 수량 확인 부분 삭제
                    sessionStorage.removeItem('startIndex'); // 이전 startIndex 값을 삭제
                    sessionStorage.removeItem('menusPerPage'); // 이전 menusPerPage 값을 삭제
                    // 페이지 이동
                    window.location.href = paymentURL;
                }
            </c:if>
            <c:if test="${loginObj == null}">
	         	// 결제와 동시에 세션 삭제
	            sessionStorage.removeItem("paymentData"); // 선택한 상품 및 수량 확인 부분 삭제
	            sessionStorage.removeItem('startIndex'); // 이전 startIndex 값을 삭제
	            sessionStorage.removeItem('menusPerPage'); // 이전 menusPerPage 값을 삭제
	            // 페이지 이동
	            window.location.href = paymentURL;
            </c:if>
        }

        
        // 모달 열기 함수
        function openModal() {
            var modal = document.getElementById("paymentModal");
            modal.style.display = "block";
        }

        // 모달 닫기 함수
        function closeModal() {
            var modal = document.getElementById("paymentModal");
            modal.style.display = "none";
        }
        
        // 총 결제 금액 계산 함수
        function calculateTotalPrice() {
            var total = 0;
            //DB에서 가져온 모든 메뉴의 이름과 가격을 가지고 있는 serverAllMenuList
            var serverAllMenuList = JSON.parse('${jsonAllMenuList}');

            //특정 메뉴 이름에 해당하는 가격 찾기 위해 반복문 사용하여 매치되는 메뉴 찾기
            for (var item in selectedItems) {
                // 현재 메뉴 이름과 일치하는 객체 찾기
                var matchedMenu = serverAllMenuList.find(menu => menu.MENU_NAME === item);
                // 매치된 메뉴가 있다면 가격을 가져와서 계산에 추가
                if (matchedMenu) {
                    total += parseInt(selectedItems[item]) * parseInt(matchedMenu.MENU_PRICE);
                }
            }
            return total;
        }
		
     	// 초기에는 처음 다섯 개의 카테고리를 보여줌  
        // 초기에는 세션 스토리지에서 startIndex 값을 가져오거나, 없으면 0으로 초기화
		var startIndex = parseInt(sessionStorage.getItem('startIndex')) || 0;
		showCategories(startIndex);
		
		// 카테고리를 동적으로 보여주는 함수
		function showCategories(startIndex) {
		    var categories = document.querySelectorAll('.category-item');
		    var numToShow = 5; // 한 번에 보여줄 카테고리 수
		    var totalCategories = categories.length;
		
		    for (var i = 0; i < totalCategories; i++) {
		        if (i >= startIndex && i < startIndex + numToShow) {
		            categories[i].style.display = 'inline-block';
		        } else {
		            categories[i].style.display = 'none';
		        }
		    }
		}
		
		// 다음 카테고리 보기 버튼 클릭 시
		document.getElementById('nextCategory').addEventListener('click', function() {
		    var totalCategories = document.querySelectorAll('.category-item').length;
		    startIndex++; // 시작 인덱스 증가
		    if (startIndex >= totalCategories - 5) {
		        startIndex = totalCategories - 5; // 범위를 벗어나면 조정
		    }
		    if (startIndex < 0) {
		        startIndex = 0; // 음수가 되면 0으로 조정
		    }
		    showCategories(startIndex);
		    sessionStorage.removeItem('startIndex'); // 이전 startIndex 값을 삭제
		    sessionStorage.setItem('startIndex', startIndex); // 새로운 startIndex 값을 저장
		});
		
		// 이전 카테고리 보기 버튼 클릭 시
		document.getElementById('prevCategory').addEventListener('click', function() {
		    startIndex--; // 시작 인덱스 감소
		    if (startIndex < 0) {
		        startIndex = 0; // 음수가 되면 0으로 조정
		    }
		    showCategories(startIndex);
		    sessionStorage.removeItem('startIndex'); // 이전 startIndex 값을 삭제
		    sessionStorage.setItem('startIndex', startIndex); // 새로운 startIndex 값을 저장
		});
		

     
     
/*     -------------->>이렇게 하면 5개씩 나타나는 것 <<-------------------------------
        // 이전 카테고리 보기 버튼 클릭 시
        document.getElementById('prevCategory').addEventListener('click', function() {
            startIndex -= 5; // 시작 인덱스 감소
            if (startIndex < 0) {
                startIndex = 0; // 음수가 되면 0으로 조정
            }
            showCategories(startIndex);
        });
        // 다음 카테고리 보기 버튼 클릭 시
        document.getElementById('nextCategory').addEventListener('click', function() {
            var totalCategories = document.querySelectorAll('.category-item').length;
            startIndex += 5; // 시작 인덱스 증가
            if (startIndex >= totalCategories) {
                startIndex = totalCategories - 5; // 범위를 벗어나면 조정
            }
            if (startIndex < 0) {
                startIndex = 0; // 음수가 되면 0으로 조정
            }
            showCategories(startIndex);
        });
        ---------------------------------------------------------------------
*/		
		//현재 선택된 카테고리의 li 태그에 white 색상 배경을 적용하는 함수
		function highlightSelectedCategory() {
		    // 현재 페이지 URL에서 categoryName 파라미터 값을 가져옴
		    var urlParams = new URLSearchParams(window.location.search);
		    var categoryName = urlParams.get('categoryName');
		
		    // 카테고리 목록의 li 태그를 가져와 반복
		    var categories = document.querySelectorAll('.category-item');
		    categories.forEach(function(category) {
		        // 카테고리 이름이 현재 선택된 카테고리와 일치하면 배경색을 white로 설정
		        if (category.innerText.trim() === categoryName) {
		            category.style.backgroundColor = 'lightgray';
		        } else {
		            category.style.backgroundColor = ''; // 다른 카테고리는 배경색 제거
		        }
		    });
		}


    </script>

</body>
</html>
