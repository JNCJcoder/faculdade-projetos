<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Utilizando o JSTL</title>
</head>
<body>
    <c:set var="salary" scope="session" value="${2000*2}" />
    O Salário é: <c:out value="${salary}" />
    <c:choose  test="${salary >= 2000}">
        <c:when test="${salary <= 0}">
            Salário muito baixo para sobreviver.
        </c:when>

        <c:when test="${salary > 1000}">
            Salário está bom.
        </c:when>

        <c:otherwise>
            Qualquer outra condição que não foi atendida anteriormente.
        </c:otherwise>
    </c:choose>
</body>
</html>