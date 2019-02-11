package com.example.hansh.learningsupervisionsystem;

import org.litepal.crud.LitePalSupport;

/**
 * Created by SwithunHan on 2019/2/9.
 */

public class User extends LitePalSupport {
    private String username;
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}