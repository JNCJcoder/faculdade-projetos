<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Utilizando o JSTL</title>
</head>
<body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3000/agenda?useSSL=false&serverTimezone=UTC" user="root" password="root" />
    <sql:query dataSource="${snapshot}" var="result">
        select * from agenda.contato
    </sql:query>
    <table border="1" width="100%">
        <tr>
            <th>Emp ID</th>
            <th>Nome</th>
            <th>E-mail</th>
        </tr>

        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.Id}" /></td>
                <td><c:out value="${row.nome}" /></td>
                <td><c:out value="${row.email}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>