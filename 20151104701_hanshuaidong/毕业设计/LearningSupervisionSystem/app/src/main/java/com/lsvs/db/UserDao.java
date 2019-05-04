package com.lsvs.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;


import com.lsvs.bean.User;

import java.util.ArrayList;


public class UserDao {

    private DBHelper dbHelp;
    private SQLiteDatabase db;

    private static final String TABLE = "User";

    public UserDao(Context context) {
        dbHelp = new DBHelper(context);
    }


    public boolean register(User user) {
        if (hasName(user.getUserName())) {
            return false;
        }

        db = dbHelp.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("userName", user.getUserName());
        values.put("password", user.getPassword());
        long id = db.insert(TABLE, null, values);
        db.close();
        return id != -1;
    }

	
    public boolean update(User user) {
        db = dbHelp.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("password", user.getPassword());
        int a = db.update(TABLE, contentValues,
                "_id=? and userName=?", new String[]{user.getId() + "", user.getUserName()});
        db.close();
        return a != -1;
    }

    public User findByNamePwd(String username, String password) {
        User user = null;
        db = dbHelp.getReadableDatabase();
        String sql = "select * from " + TABLE + " where userName = ? and password=?";
        Cursor cursor = db.rawQuery(sql, new String[]{username, password});

        while (cursor.moveToNext()) {
            user = new User();
            user.setId(cursor.getInt(cursor.getColumnIndex("_id")));
            user.setUserName(cursor.getString(cursor.getColumnIndex("userName")));
            user.setPassword(cursor.getString(cursor.getColumnIndex("password")));
        }

        db.close();
        return user;
    }

    public User findByName(String username) {
        User user = null;
        db = dbHelp.getReadableDatabase();
        String sql = "select * from " + TABLE + " where userName = ?";
        Cursor cursor = db.rawQuery(sql, new String[]{username});

        while (cursor.moveToNext()) {
            user = new User();
            user.setId(cursor.getInt(cursor.getColumnIndex("_id")));
            user.setUserName(cursor.getString(cursor.getColumnIndex("userName")));
            user.setPassword(cursor.getString(cursor.getColumnIndex("password")));
        }

        db.close();
        return user;
    }

    public boolean hasName(String username) {
        db = dbHelp.getReadableDatabase();
        String sql = "select userName from " + TABLE + " where userName = ?";
        Cursor cursor = db.rawQuery(sql, new String[]{username});
        boolean has = cursor.getCount() != 0;
        db.close();
        return has;
    }

    public boolean delete(User user) {
        db = dbHelp.getWritableDatabase();
        int code = db.delete(TABLE, "userName=? and _id=?", new String[]{user.getUserName(), user.getId() + ""});
        boolean has = code != 0;
        db.close();
        return has;
    }

    public ArrayList<User> findAll() {
        db = dbHelp.getReadableDatabase();
        String sql = "select * from " + TABLE;
        Cursor cursor = db.rawQuery(sql, null);
        ArrayList<User> userArrayList = new ArrayList<>();
        while (cursor.moveToNext()) {
            User user = new User();
            user.setId(cursor.getInt(cursor.getColumnIndex("_id")));
            user.setUserName(cursor.getString(cursor.getColumnIndex("userName")));
            user.setPassword(cursor.getString(cursor.getColumnIndex("password")));
            userArrayList.add(user);
        }

        return userArrayList;
    }

    public boolean hasReciverInfo(String username) {
        db = dbHelp.getReadableDatabase();
        String sql = "select contact,mobile,address from " + TABLE + " where userName = ?";
        Cursor cursor = db.rawQuery(sql, new String[]{username});
        cursor.moveToFirst();
        if (cursor.getCount() > 0) {
            String a = cursor.getString(cursor.getColumnIndex("contact"));
            String b = cursor.getString(cursor.getColumnIndex("mobile"));
            String c = cursor.getString(cursor.getColumnIndex("address"));
            return a != null && !a.isEmpty() && b != null && !b.isEmpty() && c != null && !c.isEmpty();
        }

        db.close();
        return false;
    }
}
