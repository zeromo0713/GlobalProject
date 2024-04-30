<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Excel Data</title>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    .export-button {
        margin-top: 20px;
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 10px 24px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
    }
</style>
<script>
    function exportToExcel() {
        var tableHtml = document.getElementById('excelTable').outerHTML;
        var fileName = "excel_data.xls";
        var downloadLink = document.createElement("a");
        downloadLink.href = 'data:application/vnd.ms-excel,' + encodeURIComponent(tableHtml);
        downloadLink.download = fileName;
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }
</script>
</head>
<body>
    <h1>Excel Data</h1>
    <%-- Excel 데이터를 보여줄 부분 --%>
    <div>
        <table id="excelTable">
		    <thead>
		        <tr>
		            <c:forEach items="${excelData.header}" var="header">
		                <th>${header}</th>
		            </c:forEach>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${excelData.rows}" var="row">
		            <tr>
		                <c:forEach items="${row}" var="cell">
		                    <td>${cell}</td>
		                </c:forEach>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
    </div>

    <%-- 에러 메시지가 있는 경우 --%>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <%-- 엑셀로 내보내기 버튼 --%>
    <button class="export-button" onclick="exportToExcel()">엑셀 저장</button>
</body>
</html>
