<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Utilizando o JSTL</title>
</head>
<body>
    <c:set var="balance" value="120000.2309"/>
    <c:set var="porc" value="10"/>
    <p>
        Moeda local:
        <fmt:formatDate type="currency" value="${balance}" />
    </p>
    <p>
        Porcentagem:
        <fmt:formatDate type="percent" value="${porc}" groupingUsed="true"/>
    </p>
    <p>
        Formatada com notação exponencial:
        <fmt:formatDate type="number" value="${balance}" pattern="###.###E0" />
    </p>
    <p>
        Moeda local americana:
        <fmt:setLocale value="en_US"/>
        <fmt:formatDate type="currency" value="${balance}" />
    </p>
</body>
</html>