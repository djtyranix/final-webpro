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
public class Courses {
    private int course_id;
    private String course_name;
    private String course_desc;
    
    public Courses()
    {
        
    }
    
    public Courses(int course_id, String course_name, String course_desc)
    {
        this.course_id = course_id;
        this.course_name = course_name;
        this.course_desc = course_desc;
    }
    
    public int getId()
    {
        return this.course_id;
    }
    
    public String getCourseName()
    {
        return this.course_name;
    }
    
    public String getCourseDesc()
    {
        return this.course_desc;
    }
}
