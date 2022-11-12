<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Student</title>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>Adicionar Aluno</h2>
        </div>
        <div id="container">
            <form action="StudentControllerServlet" method="GET">
                <input type="hidden" name="command" value="ADD">
                <table>
                    <tbody>
                        <tr>
                            <td><label>First name:</label></td>
                            <td><input type="text" name="firstName"></td>
                        </tr>
                        <tr>
                            <td><label>Last name:</label></td>
                            <td><input type="text" name="lastName"></td>
                        </tr>
                        <tr>
                            <td><label>E-mail:</label></td>
                            <td><input type="text" name="email"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Adicionar"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</body>
</html>