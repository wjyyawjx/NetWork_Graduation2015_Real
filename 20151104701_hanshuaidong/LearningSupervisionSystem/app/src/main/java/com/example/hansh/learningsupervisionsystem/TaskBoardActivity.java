package com.example.hansh.learningsupervisionsystem;

import android.content.Context;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import org.litepal.LitePal;
import org.litepal.crud.LitePalSupport;
import org.litepal.exceptions.DataSupportException;
import org.litepal.tablemanager.Connector;

import java.util.ArrayList;
import java.util.List;

public class TaskBoardActivity extends AppCompatActivity {
    private static final String TAG = "TaskBoardActivity";
    private ListView lv;
    private List<Renwu> renwulist;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_taskboard);
        renwulist = LitePal.findAll(Renwu.class);
        lv = (ListView) findViewById(R.id.lv);
    }






}
