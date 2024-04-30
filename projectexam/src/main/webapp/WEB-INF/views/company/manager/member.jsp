<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원명단</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif; /* 전체 페이지에 적용되는 글꼴 지정 */
            background-color: #f5f5f5; /* 전체 페이지 배경색 지정 */
            margin: 0; /* 페이지 외부 여백 제거 */
            padding: 0; /* 페이지 내부 여백 제거 */
        }

        h1, h2 {
            text-align: center; /* 제목 가운데 정렬 */
        }

        a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #333; /* 링크 색상 지정 */
        }

        hr {
            margin: 20px 0; /* 수평선 위아래 여백 지정 */
            border: none; /* 테두리 없음 */
            border-top: 1px solid #ccc; /* 윗부분 테두리 지정 */
        }

        form {
            display: flex; /* 내용을 수평으로 정렬 */
            align-items: center; /* 내용을 세로 방향 가운데 정렬 */
            margin-bottom: 20px; /* 하단 여백 지정 */
        }

        form select {
            margin-right: 10px; /* 우측 여백 지정 */
            padding: 10px; /* 내부 여백 지정 */
            border: 1px solid #ccc; /* 테두리 스타일과 색상 지정 */
            border-radius: 5px; /* 테두리 둥글게 처리 */
        }

        form button {
            background-color: #333; /* 배경색 지정 */
            color: white; /* 글자색 지정 */
            cursor: pointer; /* 커서 스타일 지정 */
            padding: 10px; /* 내부 여백 지정 */
            border: none; /* 테두리 없음 */
            border-radius: 5px; /* 테두리 둥글게 처리 */
        }

        table {
            width: 100%; /* 테이블 전체 폭 지정 */
            margin-top: 20px; /* 상단 여백 지정 */
            border-collapse: collapse; /* 테두리 겹치도록 설정 */
        }

        th, td {
            border: 1px solid #ccc; /* 테두리 스타일과 색상 지정 */
            padding: 10px; /* 내부 여백 지정 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        th {
            background-color: #f2f2f2; /* 테이블 헤더 배경색 지정 */
        }

        ul.pageNav {
            display: flex; /* 페이지 네비게이션을 수평으로 정렬 */
            list-style: none; /* 리스트 기본 스타일 제거 */
            padding: 0; /* 리스트 내부 여백 제거 */
            margin: 20px 0; /* 상단과 하단 여백 지정 */
            justify-content: center; /* 페이지 네비게이션 가운데 정렬 */
        }

        ul.pageNav>li {
            display: inline-block; /* 리스트 아이템을 인라인 블록으로 표시 */
            list-style: none; /* 리스트 기본 스타일 제거 */
            padding: 5px; /* 내부 여백 지정 */
            border: solid 1px black; /* 테두리 스타일과 색상 지정 */
            margin: 0 5px; /* 좌우 여백 지정 */
        }

        ul.pageNav>li.active>a {
            cursor: default; /* 클릭 비활성화 */
            background-color: #333; /* 클릭한 페이지의 배경 색상 변경 */
            color: white; /* 클릭한 페이지의 글자 색상 변경 */
        }

        canvas #ageChart {
            width: 100%; /* 캔버스 전체 폭 지정 */
            height: auto; /* 캔버스 높이 자동 지정 */
        }
     
    </style>
</head>
<body>
    <h1>회원명단</h1>
    <a href="/company/manager">관리자 홈</a>
    <hr />

    <div>
        <h2>연령대 선택</h2>
        <form action="/company/manager/member" method="get">
            <select name="age_group">
                <option value="">전체</option>
                <option value="10대 이하">10대 이하</option>
                <option value="10대">10대</option>
                <option value="20대">20대</option>
                <option value="30대">30대</option>
                <option value="40대">40대</option>
                <option value="50대">50대</option>
                <option value="60대 이상">60대 이상</option>
            </select>
            <button>필터 적용</button>
        </form>
    </div>

    <div>
        <table border="1">
            <thead>
                <tr>
                    <th>핸드폰 번호</th>
                    <th>생년월일</th>
                    <th>성별</th>
                    <th>총 주문 금액</th>
                    <th>등급</th>
                    <th>나이</th>
                    <th>나이대</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${memberList}">
                    <tr>
                        <td>${member.mem_ph_num}</td>
                        <td>${member.mem_birth}</td>
                        <c:choose>
                            <c:when test="${member.mem_gender==1}">
                                <td>남자</td>
                            </c:when>
                            <c:when test="${member.mem_gender==2}">
                                <td>여자</td>
                            </c:when>
                        </c:choose>
                        <td>${member.total_sale_price}</td>
                        <td>
                            <form action="/company/manager/member" method="post">
                                <input type="hidden" name="mem_ph_num" value="${member.mem_ph_num}">
                                <select name="mem_grade">
                                    <option value="0" ${member.mem_grade == 0 ? 'selected' : ''}>관리자</option>
                                    <option value="1" ${member.mem_grade == 1 ? 'selected' : ''}>일반회원</option>
                                    <option value="2" ${member.mem_grade == 2 ? 'selected' : ''}>우수회원</option>
                                    <option value="3" ${member.mem_grade == 3 ? 'selected' : ''}>VIP</option>
                                </select>
                                <button type="submit">수정</button>
                            </form>
                        </td>
                        <td>${member.age}</td>
                        <td>${member.age_group}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <ul class="pageNav">
            <c:if test="${pageMaker.prev}">
                <li><a href="${pageMaker.startPage-1}">previous</a></li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="${pageMaker.criteria.pageNum == num ? 'active' : ''}">
                    <a href="${num}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next }" >
                <li><a href="${pageMaker.endPage+1}">next</a></li>
            </c:if>
        </ul>
    </div>

    <!-- 페이징과 관련된 폼(내용이 숨겨져있다) -->
    <form action="/company/manager/member" id="actionForm" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum }" />
        <input type="hidden" name="amount" value="${pageMaker.criteria.amount }" />
        <input type="hidden" name="age_group" value="${param.age_group }" />
        <input type="hidden" name="keyword" value="${pageMaker.criteria.keyword }" />
    </form>
	
	<div id="age">
	    <!-- 그래프를 나타내는 위치 -->
	    <canvas id="ageChart"></canvas>
	</div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>	<!-- 그래프를 나타내기 위함 -->

    <script>
        $(document).ready(function() {
            // 페이지 리스트에서의 이벤트 처리
            let $actionForm = $('#actionForm');
            $('ul.pageNav>li>a').on('click', function(ev){
                ev.preventDefault();
                $actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
                $actionForm.attr('action','/company/manager/member');
                $actionForm.submit();
            });

            // 예시: 페이지 로드 후 "Hello, World!"를 콘솔에 출력하는 코드
            console.log("Hello, World!");
        });
    </script>

    <script>
        // 나이대 분포를 나타내는 막대그래프를 생성하는 함수
        function createAgeChart(ageData) {
            var ctx = document.getElementById('ageChart').getContext('2d');
            var ageChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: Object.keys(ageData),
                    datasets: [{
                        label: '회원 수',
                        data: Object.values(ageData),
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        // 그래프를 위한 데이터 처리
        var ageData = {};
        <c:forEach var="member" items="${memberListAll}">
            var ageGroup = "${member.age_group}";
            ageData[ageGroup] = (ageData[ageGroup] || 0) + 1;
        </c:forEach>

        // 함수를 호출하여 그래프 생성
        createAgeChart(ageData);
        

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
