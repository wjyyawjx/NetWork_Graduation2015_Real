package com.example.hansh.learningsupervisionsystem;


import org.litepal.crud.LitePalSupport;

/**
 * Created by SwithunHan on 2019/2/8.
 */

public class Renwu extends LitePalSupport {
    private int id;
    private String task_content;
    private String date;
    private String time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTask_content() {
        return task_content;
    }

    public void setTask_content(String task_content) {
        this.task_content = task_content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }




}
