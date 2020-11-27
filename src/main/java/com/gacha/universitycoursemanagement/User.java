/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gacha.universitycoursemanagement;

/**
 *
 * @author micha
 */
public class User {
    protected int id;
    protected String email;
    protected String name;
    protected String password;
    protected String phone;
    protected String address;
    
    public User(){
        
    }
    
    protected static String hashPassword(String password)
    {
        String salt = Bcrypt.gensalt(15);
        String hashed_password = BCrypt.hashpw(password, salt);
        
        return hashed_password;
    }
    
    public User(int id)
    {
        this.id = id;
    }
    
    public User(int id, String name, String email, String phone, String address, String password)
    {
        this.id = id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.password = hashPassword(password);
    }
    
    public int getId()
    {
        return this.id;
    }
    
    public void setId(int id)
    {
        this.id = id;
    }
    
    public String getEmail()
    {
        return this.email;
    }
    
    public void setEmail(String email)
    {
        this.email = email;
    }
    
    public String getName()
    {
        return this.name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getPhone()
    {
        return this.phone;
    }
    
    public void setPhone(String phone)
    {
        this.phone = phone;
    }
    
    public String getAddress()
    {
        return this.address;
    }
    
    public void setAddress(String address)
    {
        this.address = address;
    }
    
    public String getPassword()
    {
        return this.password;
    }
    
    public void setPassword(String password)
    {
        this.password = hashPassword(password);
    }
}
