package com.cruzeiro.jdbc;

import java.sql.Connection;

public class StudentDbUtil
{
    public StudentDbUtil()
    {

    }

    private DataSource dataSource;

    public StudentDbUtil(DataSource datasource)
    {
        this.dataSource = datasource;
    }

    private void close(Connection con, Statement stmt, ResultSet rs)
    {
        try
        {
            if(rs != null)
            {
                rs.close();
            }
            
            if(stmt != null)
            {
                stmt.close();
            }

            if(con != null)
            {
                con.close();
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public List<Student> getStudents() throws Exception
    {
        List<Student> students = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try
        {
            con = datasource.getConnection();

            String sql = "SELECT * FROM STUDENT ORDER BY LAST_NAME";

            stmt = con.createStatement();

            rs = stmt.executeQuery(sql);

            while(rs.next())
            {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");

                Student tempStudent = new Student(id, firstName, lastName, email);

                students.add(tempStudent);
            }

            return students;
        }
        finally
        {
            close(con, stmt, rs);
        }
    }

    public void addStudent(Student student) throws Exception
    {
        Connection con = null;
        Statement stmt = null;

        try
        {
            con = datasource.getConnection();

            String sql = "INSERT INTO STUDENT (FIRST_NAME, LAST_NAME, EMAIL) VALUES (?,?,?)";

            stmt = con.prepareStatement(sql);
            stmt.setString(1, student.getFirstName());
            stmt.setString(2, student.getLastName());
            stmt.setString(3, student.getEmail());

            stmt.execute();
        }
        finally
        {
            close(con, stmt, null);
        }
    }

    public void updateStudent(Student student) throws Exception
    {
        Connection con = null;
        Statement stmt = null;

        try
        {
            con = datasource.getConnection();

            String sql = "UPDATE STUDENT SET FIRST_NAME = ?, LAST_NAME = ?, EMAIL = ? WHERE ID = ?";

            stmt = con.prepareStatement(sql);
            stmt.setString(1, student.getFirstName());
            stmt.setString(2, student.getLastName());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getId());

            stmt.execute();
        }
        finally
        {
            close(con, stmt, null);
        }
    }

    public void deleteStudents(int id) throws Exception
    {
        Connection con = null;
        Statement stmt = null;

        try
        {
            con = datasource.getConnection();

            String sql = "DELETE FROM STUDENT WHERE ID = ?";

            stmt.setInt(1, id);

            stmt.execute();
        }
        finally
        {
            close(con, stmt, null);
        }
    }
}