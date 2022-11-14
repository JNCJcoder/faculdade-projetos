package com.cruzeiro.data;

import com.cruzeiro.hibernate.entity.Student;

public class StudentInsert
{
    public static void main(String[] args)
    {
        // create session factory
        SessionFactory factory = new Configuration()
        .configure("hibernate.cfg.xml")
        .addAnnotatedClass(Student.class)
        .buildSessionFactory();
        // create session
        Session = factory.getCurrentSession();
        try
        {
            System.out.println("Criando objeto Students...");
            Student tempStudent = new Student("Bob", "Alves", "bob@cruzeirodosul.com.br");
            session.beginTransaction();
            System.out.println("Inserindo os dados no banco...");
            session.save(tempStudent);
            session.getTransaction().commit();
            System.out.println("Finalizado");
        }
        finally
        {
            factory.close();
        }
    }
}