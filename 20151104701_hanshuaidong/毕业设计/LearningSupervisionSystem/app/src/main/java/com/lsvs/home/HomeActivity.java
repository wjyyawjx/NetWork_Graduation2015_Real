package com.lsvs.home;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.lsvs.R;
import com.lsvs.bean.TaskBean;
import com.lsvs.bean.User;
import com.lsvs.db.TaskDao;
import com.lsvs.db.UserDao;
import com.lsvs.splash.SplashActivity;
import com.lsvs.task.EditTaskActivity;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class HomeActivity extends AppCompatActivity {

    @BindView(R.id.toolbar)
    Toolbar toolbar;
    @BindView(R.id.task_list)
    RecyclerView taskList;
    @BindView(R.id.fab)
    FloatingActionButton fab;
    private SharedPreferences sharedPreferences;
    private String userName;
    private User user;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        ButterKnife.bind(this);
        sharedPreferences = getSharedPreferences(getResources().getString(R.string.app_id), Context.MODE_PRIVATE);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        userName = sharedPreferences.getString("loginUserName", "");
        getSupportActionBar().setTitle(userName + "的任务列表");
        if (userName.isEmpty()) {
            return;
        }

        user = new UserDao(this).findByName(userName);
        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getBaseContext(), EditTaskActivity.class);
                intent.putExtra("type", 0);
                intent.putExtra("userId", user.getId() + "");
                startActivity(intent);
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        List<TaskBean> list = new TaskDao(this).findAllForUser(user.getId());
        taskList.setAdapter(new HomeAdapter(list));
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.home_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.user_out) {
            sharedPreferences.edit().putString("loginUserName", "").apply();
            startActivity(new Intent(this, SplashActivity.class));
            finish();
        }
        return super.onOptionsItemSelected(item);
    }
}
