/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;

/**
 *
 * @author Eu
 */
public class Dao {
    /*public Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeholder?useTimezone=true&serverTimezone=UTC","root","root");
            return connection;
        } catch(ClassNotFoundException e){
            System.out.println("Erro: " + e.getException());
            e.printStackTrace();
            return null;
        }
        catch(SQLException e){
            System.out.println("Erro SQL: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }*/
    private Connection connection;
    private String erro="";
    private PreparedStatement statement;
    
    public Connection getConnection() {
        return connection;
    }

    public String getErro() {
        return erro;
    }

    public PreparedStatement getStatement() {
        return statement;
    }


    public boolean connect()
    {
                try
                {
                    erro="";
                    Class.forName("com.mysql.jdbc.Driver");
                    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/placeholder?useTimezone=true&serverTimezone=UTC","root","root");
                    return true;
                }
                catch(Exception e)
                {
                    erro=e.getMessage();
                    return false;
                }    

    }
    
    public PreparedStatement createPreparedStatement(String sql) throws SQLException
    {
        if (connection!=null)
        {    
            statement= connection.prepareStatement(sql);
            return statement;
        }
        else
             return null;
    }        
    
    public void setString(int index,String value) throws SQLException
    {
        if (statement!=null)
            statement.setString(index, value);
    }        
    
    public void execute() throws SQLException
    {
        if (statement!=null)
            statement.execute();
    }
    
    public ResultSet executeQuery() throws SQLException
    {
        if (statement!=null)
            return statement.executeQuery();
        else
            return null;
              
    }    

    public void close() throws SQLException    
    {
        if(statement!=null)
            statement.close();
        if(connection!=null)
            connection.close();
    }
}