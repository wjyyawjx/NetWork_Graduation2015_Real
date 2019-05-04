package com.lsvs.login;

import android.content.Intent;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.Toast;

import com.lsvs.BaseActivity;
import com.lsvs.R;
import com.lsvs.bean.User;
import com.lsvs.db.UserDao;
import com.lsvs.home.HomeActivity;

import butterknife.BindView;
import butterknife.OnClick;



public class RegisterActivity extends BaseActivity {

    @BindView(R.id.email)
    AutoCompleteTextView email;
    @BindView(R.id.password)
    EditText password;
    @BindView(R.id.password2)
    EditText password2;
    @BindView(R.id.register_in_button)
    Button emailSignInButton;
    @BindView(R.id.email_register_form)
    ScrollView emailRegisterForm;

    @Override
    protected boolean showAppBar() {
        return true;
    }

    @Override
    protected boolean showBack() {
        return true;
    }

    @Override
    protected String appBarTitle() {
        return "注册";
    }

    @Override
    public int getContentId() {
        return R.layout.activity_register;
    }

    @Override
    protected void loadData() {

    }

    @Override
    protected void buildView() {
    }

    private void attemptLogin() {
        String name = email.getText().toString();
        String passwordStr = password.getText().toString();
        String password2Str = password2.getText().toString();

        boolean cancel = false;
        View focusView = null;

        if (TextUtils.isEmpty(passwordStr)) {
            password.setError(getString(R.string.error_invalid_password));
            focusView = password;
            cancel = true;
        }

        if (TextUtils.isEmpty(password2Str)) {
            password2.setError(getString(R.string.error_invalid_password));
            focusView = password2;
            cancel = true;
        }

        if (TextUtils.isEmpty(name)) {
            email.setError(getString(R.string.error_field_required));
            focusView = email;
            cancel = true;
        }

        if (cancel) {
            focusView.requestFocus();
        } else {
            showProgress(true);
            doRegister(name, passwordStr, password2Str);
        }
    }

    private void doRegister(String name, String passwordStr, String password2Str) {
        UserDao userDao = new UserDao(getBaseContext());
        if (userDao.hasName(name)) {
            Toast.makeText(this, "用户已存在", Toast.LENGTH_SHORT).show();
            showProgress(false);
        } else if (userDao.hasName(name)) {
            Toast.makeText(this, "用户已存在", Toast.LENGTH_SHORT).show();
            showProgress(false);
        } else if (!passwordStr.contentEquals(password2Str)) {
            Toast.makeText(this, "两次输入密码不一样", Toast.LENGTH_SHORT).show();
            showProgress(false);
        } else {
            User newUser = new User(name, passwordStr);
            if (userDao.register(newUser)) {
                Toast.makeText(this, "注册成功", Toast.LENGTH_SHORT).show();
                sharedPreferences.edit().putString("loginUserName", newUser.getUserName()).apply();
                startActivity(new Intent(this, HomeActivity.class));
                setResult(RESULT_OK);
                finish();
            } else {
                Toast.makeText(this, "注册失败", Toast.LENGTH_SHORT).show();
                showProgress(false);
            }
        }
    }

    private void showProgress(boolean show) {
        emailRegisterForm.setVisibility(show ? View.GONE : View.VISIBLE);
    }

    @OnClick(R.id.register_in_button)
    public void onViewClicked() {
        attemptLogin();
    }

}

