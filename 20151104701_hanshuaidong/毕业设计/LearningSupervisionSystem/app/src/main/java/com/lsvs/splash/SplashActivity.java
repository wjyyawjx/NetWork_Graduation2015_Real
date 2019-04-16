package com.lsvs.splash;

import android.Manifest;
import android.content.Intent;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AnticipateOvershootInterpolator;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.lsvs.BaseActivity;
import com.lsvs.R;
import com.lsvs.home.HomeActivity;
import com.lsvs.login.LoginActivity;
import com.lsvs.login.RegisterActivity;
import com.yanzhenjie.permission.Action;
import com.yanzhenjie.permission.AndPermission;

import java.util.List;

import butterknife.BindView;
import butterknife.OnClick;

public class SplashActivity extends BaseActivity {

    @BindView(R.id.flower_icon)
    ImageView flowerIcon;
    @BindView(R.id.flower_text)
    TextView flowerText;
    @BindView(R.id.login)
    Button login;
    @BindView(R.id.register)
    Button register;
    @BindView(R.id.btn_layout)
    LinearLayout btnLayout;
    private String[] permissions = {
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.READ_CALENDAR,
            Manifest.permission.WRITE_CALENDAR
    };
    private boolean firstStart = true;
    private String userName;

    @Override
    protected void loadData() {
        userName = sharedPreferences.getString("loginUserName", "");
    }

    @Override
    protected void onResume() {
        super.onResume();
        AndPermission.with(getBaseContext()).permission(permissions).onDenied(new Action() {
            @Override
            public void onAction(List<String> permissions) {
                Toast.makeText(SplashActivity.this, "请手动开启需要的权限", Toast.LENGTH_SHORT).show();
                AndPermission.permissionSetting(getBaseContext()).execute();
                finish();
            }
        }).onGranted(new Action() {
            @Override
            public void onAction(List<String> permissions) {
                startAnim();
            }
        }).start();
    }

    private void startAnim() {
        if (firstStart) {
            firstStart = false;
            login.setVisibility(View.INVISIBLE);
            register.setVisibility(View.INVISIBLE);
            flowerIcon.animate().rotation(360 * 20)
                    .setDuration(2400).setInterpolator(new AccelerateDecelerateInterpolator())
                    .withEndAction(new Runnable() {
                        @Override
                        public void run() {
                            flowerText.animate().alpha(1).setDuration(900).withEndAction(new Runnable() {
                                @Override
                                public void run() {
                                    if (userName.isEmpty()) {
                                        loginForm();
                                    } else {
                                        startActivity(new Intent(getBaseContext(), HomeActivity.class));
                                        finish();
                                    }
                                }
                            }).start();
                        }
                    }).start();
        }
    }

    private void loginForm() {
        TranslateAnimation animator = new TranslateAnimation(-3000,
                0, 0, 0);
        animator.setDuration(1500);
        animator.setInterpolator(new AnticipateOvershootInterpolator());
        TranslateAnimation animator2 = new TranslateAnimation(3000,
                0, 0, 0);
        animator2.setDuration(1500);
        animator2.setInterpolator(new AnticipateOvershootInterpolator());

        TranslateAnimation animator3 = new TranslateAnimation(0,
                0, 3000, 0);
        animator3.setDuration(1500);
        animator3.setInterpolator(new AnticipateOvershootInterpolator());

        login.setVisibility(View.VISIBLE);
        login.startAnimation(animator);
        register.setVisibility(View.VISIBLE);
        register.startAnimation(animator2);
    }

    @Override
    protected boolean showBack() {
        return false;
    }

    @Override
    protected boolean showAppBar() {
        return false;
    }

    @Override
    protected String appBarTitle() {
        return null;
    }

    @Override
    public int getContentId() {
        return R.layout.activity_splash;
    }

    @Override
    protected void buildView() {

    }

    @OnClick({R.id.login, R.id.register})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case R.id.login:
                startActivityForResult(new Intent(getBaseContext(), LoginActivity.class), 11);
                break;
            case R.id.register:
                startActivityForResult(new Intent(getBaseContext(), RegisterActivity.class), 11);
                break;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == RESULT_OK) {
            finish();
        }
    }

}

