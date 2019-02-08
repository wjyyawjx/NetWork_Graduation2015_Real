package com.example.hansh.learningsupervisionsystem;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * Created by hansh on 2019/2/8.
 */


public class MyDataBaseHelper extends SQLiteOpenHelper {
    public class Renwu{

        private int id;
        private char task_content;
        private  String time;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public char getTask_content() {
            return task_content;
        }

        public void setTask_content(char task_content) {
            this.task_content = task_content;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

    }
    public MyDataBaseHelper(Context context, String name, SQLiteDatabase.CursorFactory factory,
                          int version) {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    }

}


