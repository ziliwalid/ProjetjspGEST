package com.example.projetjspgest;

import java.sql.*;
public class Connexion {
    private static Connection con=null;

    private Connexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver") ;
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestabsences","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection connect(){
        if (con==null){
            new Connexion();
        }
        return con;
    }
}
