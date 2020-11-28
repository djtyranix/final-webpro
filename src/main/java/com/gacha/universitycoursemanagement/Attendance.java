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
public class Attendance {
    private int attn_id;
    private int user_id;
    private int course_id;
    private String course_name;
    private String course_desc;
    private boolean isFinished;
    
    public Attendance()
    {
        
    }
    
    public Attendance(int attn_id, int user_id, int course_id, boolean isFinished)
    {
        this.attn_id = attn_id;
        this.user_id = user_id;
        this.course_id = course_id;
        this.isFinished = isFinished;
    }
    
    public Attendance(int course_id, String course_name, String course_desc, boolean isFinished)
    {
        this.course_id = course_id;
        this.course_name = course_name;
        this.course_desc = course_desc;
        this.isFinished = isFinished;
    }
    
    public String getCourseName()
    {
        return this.course_name;
    }
    
    public String getCourseDesc()
    {
        return this.course_desc;
    }
    
    public int getAttnId()
    {
        return this.attn_id;
    }
    
    public int getUserId()
    {
        return this.user_id;
    }
    
    public int getCourseId()
    {
        return this.course_id;
    }
    
    public boolean getIsFinished()
    {
        return this.isFinished;
    }
    
    public void setIsFinished(boolean isFinished)
    {
        this.isFinished = isFinished;
    }
}
