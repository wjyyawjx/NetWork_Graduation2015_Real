package com.lsvs.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import com.lsvs.bean.TaskBean;
import com.lsvs.bean.User;

import java.util.ArrayList;
import java.util.List;

public class TaskDao {

    private DBHelper dbHelp;
    private SQLiteDatabase db;

    private static final String TABLE = "Task";

    public TaskDao(Context context) {
        dbHelp = new DBHelper(context);
    }

    public boolean addTask(TaskBean taskBean) {
        db = dbHelp.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("userId", taskBean.getUserId());
        values.put("name", taskBean.getName());
        values.put("content", taskBean.getContent());
        values.put("date", taskBean.getDate());
        long id = db.insert(TABLE, null, values);
        db.close();
        return id != -1;
    }

    public List<TaskBean> findAllForUser(int id) {
        List<TaskBean> list = new ArrayList<>();
        db = dbHelp.getReadableDatabase();
        String sql = "select * from " + TABLE + " where userId = ? order by date";
        Cursor cursor = db.rawQuery(sql, new String[]{id + ""});

        while (cursor.moveToNext()) {
            TaskBean taskBean = new TaskBean();
            taskBean.setId(cursor.getInt(cursor.getColumnIndex("_id")));
            taskBean.setUserId(cursor.getString(cursor.getColumnIndex("userId")));
            taskBean.setName(cursor.getString(cursor.getColumnIndex("name")));
            taskBean.setContent(cursor.getString(cursor.getColumnIndex("content")));
            taskBean.setDate(cursor.getString(cursor.getColumnIndex("date")));
            list.add(taskBean);
        }

        db.close();
        return list;
    }

    public boolean update(TaskBean taskBean) {
        db = dbHelp.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("name", taskBean.getName());
        contentValues.put("content", taskBean.getContent());
        contentValues.put("date", taskBean.getDate());
        int a = db.update(TABLE, contentValues,
                "_id=?", new String[]{taskBean.getId() + ""});
        db.close();
        return a != -1;
    }

    public boolean delete(TaskBean taskBean) {
        db = dbHelp.getWritableDatabase();
        int code = db.delete(TABLE, "_id=?", new String[]{taskBean.getId() + ""});
        boolean has = code != 0;
        db.close();
        return has;
    }

}
