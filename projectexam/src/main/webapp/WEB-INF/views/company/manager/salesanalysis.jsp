<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매분석 사이트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #007bff;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="date"],
        input[type="submit"],
        input[type="checkbox"] {
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>판매분석 사이트</h1>
        <a href="/company/manager">관리자 홈</a>
        <hr>
        
        <h2>Sales Analysis</h2>
        <form action="/company/manager/salesanalysis" method="post">
            <label for="start_day">시작 기간:</label>
            <input type="date" id="start_day" name="start_day"><br>
            <label for="end_day">종료 기간:</label>
            <input type="date" id="end_day" name="end_day"><br>
            <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 메뉴별 총액
            <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 카테별 총액 비율
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 성별 총액
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 성별&메뉴별 총액
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 성별&카테별 총액<br>
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 세대별 총액
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 세대별 메뉴별 총액
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 세대별 카테별 총액
		    <input type="checkbox" name="category" value="0" onclick="updateValue(this)"> 월별분석<br>
		    
            <input type="hidden" id="analy_check" name="analy_check">
            <input type="submit" value="Submit">
        </form>
        <hr>
        
        <h1>판매 분석 결과</h1>
        <table>
            <thead>
                <tr>
                    <th>분석 결과</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    StringBuilder pythonScriptResult = (StringBuilder) request.getAttribute("pythonScriptResult");
                    if (pythonScriptResult != null) {
                        String[] results = pythonScriptResult.toString().split("&%&%");
                        for (String result : results) {
                            if (!result.trim().isEmpty()) { // 빈 줄이 아닌 경우에만 출력
                                out.println("<tr><td>" + result + "</td></tr>");
                            }
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        function updateValue(checkbox) {
            var checkboxes = document.getElementsByName("category");
            var values = [];
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    values.push(1);
                } else {
                    values.push(0);
                }
            }
            document.getElementById("analy_check").value = values.join(",");
        }
    </script>
</body>
</html>