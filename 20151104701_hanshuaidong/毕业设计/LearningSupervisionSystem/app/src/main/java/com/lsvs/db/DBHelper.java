package com.lsvs.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.lsvs.R;



public class DBHelper extends SQLiteOpenHelper {

    public DBHelper(Context context) {
        super(context, context.getResources().getString(R.string.app_id), null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String user = "create table User(" +
                "_id integer primary key autoincrement,userName text,password text)";
        db.execSQL(user);

        String task = "create table Task(" +
                "_id integer primary key autoincrement," +
                "userId text,name text,content text,date text)";
        db.execSQL(task);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }
}
