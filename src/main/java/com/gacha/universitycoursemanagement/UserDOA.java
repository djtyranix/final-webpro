/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gacha.universitycoursemanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author micha
 */
public class UserDOA {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
     
    public UserDAO(String jdbcURL, String jdbcUsername, String jdbcPassword)
    {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }
    
    protected void connect() throws SQLException
    {
        if (jdbcConnection == null || jdbcConnection.isClosed())
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch (ClassNotFoundException e)
            {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
    
    protected void disconnect() throws SQLException
    {
        if (jdbcConnection != null && !jdbcConnection.isClosed())
        {
            jdbcConnection.close();
        }
    }
    
    public boolean insertUser(User user) throws SQLException
    {
        String sql = "INSERT INTO users (user_name, email, phone, address, password_hash) VALUES (?, ?, ?, ?, ?)";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPhone());
        statement.setString(4, user.getAddress());
        statement.setString(5, user.getPassword());
         
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }
    
    public List<User> listAllUsers() throws SQLException
    {
        List<User> listUser = new ArrayList<>();
         
        String sql = "SELECT * FROM users";
         
        connect();
         
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String userName = resultSet.getString("user_name");
            String email = resultSet.getString("email");
            String phone = resultSet.getString("phone");
            String address = resultSet.getString("address");
            String password = resultSet.getString("password_hash");
             
            User user = new User(id, userName, email, phone, address, password);
            listUser.add(user);
        }
         
        resultSet.close();
        statement.close();
         
        disconnect();
         
        return listUser;
    }
    
    public boolean deleteUser(User user) throws SQLException
    {
        String sql = "DELETE FROM users where id = ?";
         
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, user.getId());
         
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;     
    }
    
    public boolean updateUser(User user) throws SQLException
    {
        String sql = "UPDATE users SET user_name = ?, email = ?, phone = ?, address = ?, password_hash = ?";
        sql += " WHERE id = ?";
        connect();
         
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPhone());
        statement.setString(4, user.getAddress());
        statement.setString(5, user.getPassword());
        statement.setInt(6, user.getId());
         
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;     
    }
    
    public User getUser(int id) throws SQLException
    {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";
        
        connect();
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
        
        ResultSet resultSet = statement.executeQuery();
        
        if(resultSet.next())
        {
            String userName = resultSet.getString("user_name");
            String email = resultSet.getString("email");
            String phone = resultSet.getString("phone");
            String address = resultSet.getString("address");
            String password = resultSet.getString("password_hash");
            
            User user = new User(id, userName, email, phone, address, password);
        }
        
        resultSet.close();
        statement.close();
        
        return user;
    }
}