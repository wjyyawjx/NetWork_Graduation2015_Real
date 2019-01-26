package com.example.hansh.learningsupervisionsystem;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class LoginActivity extends AppCompatActivity {
    private TextView tv_main_title;
    private TextView tv_back, tv_register, tv_find_psw;
    private Button btn_login;
    private String userName, psw, spPsw;
    private EditText et_user_name, et_psw;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        init();
    }

    private void init() {
        tv_main_title = findViewById(R.id.tv_main_title);
        tv_main_title.setText("登录");
        tv_back = findViewById(R.id.tv_back);
        tv_register = findViewById(R.id.tv_register);
        tv_find_psw = findViewById(R.id.tv_find_psw);
        btn_login = findViewById(R.id.btn_login);
        et_user_name = findViewById(R.id.et_user_name);
        et_psw = findViewById(R.id.et_psw);
        tv_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                LoginActivity.this.finish();
            }
        });

        tv_register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(LoginActivity.this, RegisterActivity.class);
                startActivityForResult(intent, 1);
            }
        });
        tv_find_psw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
            }
        });
        btn_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                userName = et_user_name.getText().toString().trim();
                psw = et_psw.getText().toString().trim();
                String md5Psw = MD5Utils.md5(psw);
                spPsw = readPsw(userName);
                if (TextUtils.isEmpty(userName)) {
                    Toast.makeText(LoginActivity.this, "请输入用户名", Toast.LENGTH_SHORT).show();
                    return;
                } else if (TextUtils.isEmpty(psw)) {
                    Toast.makeText(LoginActivity.this, "请输入密码", Toast.LENGTH_SHORT).show();
                    return;
                } else if (md5Psw.equals(spPsw)) {
                    Toast.makeText(LoginActivity.this, "登录成功", Toast.LENGTH_SHORT).show();
                    saveLoginStatus(true, userName);
                    Intent data = new Intent();
                    data.putExtra("isLogin", true);
                    setResult(RESULT_OK, data);
                    LoginActivity.this.finish();
                    startActivity(new Intent(LoginActivity.this, MainActivity.class));
                    return;
                } else if ((spPsw != null && !TextUtils.isEmpty(spPsw) && !md5Psw.equals(spPsw))) {
                    Toast.makeText(LoginActivity.this, "输入的用户名和密码不一致", Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    Toast.makeText(LoginActivity.this, "此用户名不存在", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    /**
     * 从SharedPreferences中根据用户名读取密码
     */
    private String readPsw(String userName) {
        SharedPreferences sp = getSharedPreferences("loginInfo", MODE_PRIVATE);
        return sp.getString(userName, "");
    }

    /**
     * 保存登录状态和登录用户名到SharedPreferences中
     */
    private void saveLoginStatus(boolean status, String userName) {
        SharedPreferences sp = getSharedPreferences("loginInfo", MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putBoolean("isLogin", status);
        editor.putString("loginUserName", userName);
        editor.commit();
    }

    /**
     * 注册成功的数据返回至此
     *
     * @param requestCode 请求码
     * @param resultCode  结果码
     * @param data        数据
     */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (data != null) {
            String userName = data.getStringExtra("userName");
            if (!TextUtils.isEmpty(userName)) {
                et_user_name.setText(userName);
                et_user_name.setSelection(userName.length());
            }
        }
    }
}