package com.lsvs;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.AppBarLayout;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;

import butterknife.BindView;
import butterknife.ButterKnife;


public abstract class BaseActivity extends AppCompatActivity {

    @BindView(R.id.toolbar)
    Toolbar toolbar;
    @BindView(R.id.appbar_layout)
    AppBarLayout appbarLayout;

    protected FrameLayout contentLayout;
    protected RelativeLayout loadLayout;
    protected SharedPreferences sharedPreferences;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_base);
        loadView();
        ButterKnife.bind(this);
        if (showAppBar()) {
            setSupportActionBar(toolbar);
            if (showBack()) {
                getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            }

            if (!TextUtils.isEmpty(appBarTitle())) {
                getSupportActionBar().setTitle(appBarTitle());
            }
        } else {
            appbarLayout.setVisibility(View.GONE);
        }

        sharedPreferences = getSharedPreferences(getResources().getString(R.string.app_id), Context.MODE_PRIVATE);
        loadData();
        buildView();
    }

    protected abstract boolean showAppBar();

    protected abstract boolean showBack();

    protected abstract String appBarTitle();

    public abstract int getContentId();

    protected abstract void loadData();

    protected abstract void buildView();

    private void loadView() {
        contentLayout = findViewById(R.id.content_layout);
        loadLayout = findViewById(R.id.load_layout);
        loadLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(BaseActivity.this, "别慌，再等等。", Toast.LENGTH_SHORT).show();
            }
        });
        contentLayout.removeAllViews();
        contentLayout.addView(getLayoutInflater()
                .inflate(getContentId(), null, true));
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            onBackPressed();
        }

        return super.onOptionsItemSelected(item);
    }
}
