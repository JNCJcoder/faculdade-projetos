package com.cruzeiro.jdbc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class StudentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            String command = request.getParameter("command");
            
            if(command == null)
            {
                command = "LIST";
            }

            switch(command)
            {
                default:
                case "LIST":
                    listStudents(request, response);
                break;

                case "ADD":
                    addStudents(request, response);
                break;

                case "LOAD":
                    loadStudents(request, response);
                break;

                case "UPDATE":
                    updateStudents(request, response);
                break;

                case "DELETE":
                    deleteStudents(request, response);
                break;
            }
            catch (Exception e)
            {
                throw new ServletException(e);
            }
        }
	}

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        List<Student> students = studentDbUtil.getStudents();

        request.setAttribute("STUDENTS_LIST", students);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
        dispatcher.forward(request, response);
    }

    private void addStudents(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        Student student = new Student(firstName, lastName, email);

        studentDbUtil.addStudent(student);

        listStudents(request, response);
    }

    private void addStudents(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String studentId = request.getParameter("sutudentId");

        Student student = studentDbUtil.getStudents(studentId);

        request.setAttribute("THE_STUDENT", student);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
        dispatcher.forward(request, response);
    }

    private void updateStudents(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        int id = Integer.parseInt(request.getParameter("studentId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        Student student = new Student(id, firstName, lastName, email);

        studentDbUtil.updateStudent(student);

        listStudents(request, response);
    }
}