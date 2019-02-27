package com.example.hansh.learningsupervisionsystem;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private TextView tv_taskboard;
    private TextView tv_addtask;
    private TextView tv_mytask;
    private TextView tv_setting;

    @Override

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);
        initViews();
    }

    private void initViews() {
        tv_taskboard = (TextView) findViewById(R.id.tv_taskboard);
        tv_addtask = (TextView) findViewById(R.id.tv_addtask);
        tv_mytask = (TextView) findViewById(R.id.tv_mytask);
        tv_setting = (TextView) findViewById(R.id.tv_setting);

        tv_taskboard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, TaskBoardActivity.class);
                startActivity(intent);

            }
        });

        tv_addtask.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, AddActivity.class);
                startActivity(intent);
            }
        });
    }
}
