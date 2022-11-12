<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student List</title>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>Lista de Alunos</h2>
        </div>
        <div id="container">
            <input type="button" value="Add Student" onclick="addstudent()" />
            <table border="1">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>E-mail</th>
                    <th>Action</th>
                </tr>
        
                <c:forEach var="tempStudent" items="${STUDENTS_LIST}">
                    <c:url var="tempLink" value="StudentControllerServlet">
                        <c:param name="command" value="LOAD" />
                        <c:param name="studentId" value="${tempStudent.id}" />
                    </c:url>
                    <c:url var="tempLinkDelete" value="StudentControllerServlet">
                        <c:param name="command" value="DELETE" />
                        <c:param name="studentId" value="${tempStudent.id}" />
                    </c:url>
                    <tr>
                        <td><c:out value="${tempStudent.firstName}" /></td>
                        <td><c:out value="${tempStudent.lastName}" /></td>
                        <td><c:out value="${tempStudent.email}" /></td>
                        <td>
                            <a href="${tempLink}">Update</a>
                            <a href="${tempLink}" onclick="delstudent()">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>