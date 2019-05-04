package com.lsvs.login;

import android.content.Intent;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.EditorInfo;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.lsvs.BaseActivity;
import com.lsvs.R;
import com.lsvs.bean.User;
import com.lsvs.db.UserDao;
import com.lsvs.home.HomeActivity;


/**
 * A login screen that offers login via email/password.
 */
public class LoginActivity extends BaseActivity {

    // UI references.
    private AutoCompleteTextView mEmailView;
    private EditText mPasswordView;
    private View mProgressView;
    private View mLoginFormView;

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
        return "登录";
    }

    @Override
    public int getContentId() {
        return R.layout.activity_login;
    }

    @Override
    protected void loadData() {

    }

    @Override
    protected void buildView() {
        mEmailView = findViewById(R.id.email);
        mPasswordView = findViewById(R.id.password);
        mPasswordView.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int id, KeyEvent keyEvent) {
                if (id == EditorInfo.IME_ACTION_DONE || id == EditorInfo.IME_NULL) {
                    attemptLogin();
                    return true;
                }
                return false;
            }
        });

        Button mEmailSignInButton = findViewById(R.id.email_sign_in_button);
        mEmailSignInButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                attemptLogin();
            }
        });

        mLoginFormView = findViewById(R.id.email_login_form);
        mProgressView = findViewById(R.id.login_progress);
    }

    private void attemptLogin() {
        mEmailView.setError(null);
        mPasswordView.setError(null);
        String email = mEmailView.getText().toString();
        String password = mPasswordView.getText().toString();

        boolean cancel = false;
        View focusView = null;

        if (TextUtils.isEmpty(password)) {
            mPasswordView.setError(getString(R.string.error_invalid_password));
            focusView = mPasswordView;
            cancel = true;
        }

        if (TextUtils.isEmpty(email)) {
            mEmailView.setError(getString(R.string.error_field_required));
            focusView = mEmailView;
            cancel = true;
        }

        if (cancel) {
            focusView.requestFocus();
        } else {
            showProgress(true);
            doLogin(email, password);
        }
    }

    private void doLogin(String email, String password) {
        UserDao userDao = new UserDao(getBaseContext());
        User user = userDao.findByNamePwd(email, password);
        if (user == null) {
            Toast.makeText(this, "用户不存在", Toast.LENGTH_SHORT).show();
            showProgress(false);
        } else {
            if (user.getPassword().contentEquals(password)) {
                Toast.makeText(this, "登录成功", Toast.LENGTH_SHORT).show();
                sharedPreferences.edit().putString("loginUserName", user.getUserName()).apply();
                startActivity(new Intent(this, HomeActivity.class));
                setResult(RESULT_OK);
                finish();
            } else {
                Toast.makeText(this, "密码不正确", Toast.LENGTH_SHORT).show();
                showProgress(false);
            }
        }
    }

    private void showProgress(boolean show) {
        mProgressView.setVisibility(show ? View.VISIBLE : View.GONE);
        mLoginFormView.setVisibility(show ? View.GONE : View.VISIBLE);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                finish();
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

}

