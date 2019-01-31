package com.example.hansh.learningsupervisionsystem;

import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    private TextView title, item_shouye, item_tianjiarenwu, item_me, item_shezhi;
    private ViewPager vp;
    private OneFragment oneFragment;
    private TwoFragment twoFragment;
    private ThreeFragment threeFragment;
    private FourFragment fourFragment;
    private List<Fragment> mFragmentList = new ArrayList<Fragment>();
    private FragmentAdapter mFragmentAdapter;

    String[] titles = new String[]{"首页", "添加任务", "我", "设置"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);
        initViews();

        mFragmentAdapter = new FragmentAdapter(this.getSupportFragmentManager(), mFragmentList);
        vp.setOffscreenPageLimit(4);
        vp.setAdapter(mFragmentAdapter);
        vp.setCurrentItem(0);
        item_shouye.setTextColor(Color.parseColor("#66CDAA"));
        vp.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                title.setText(titles[position]);
                changeTextColor(position);
            }

            @Override
            public void onPageScrollStateChanged(int state) {
            }
        });
    }

    private void initViews() {
        title = (TextView) findViewById(R.id.title);
        item_shouye = (TextView) findViewById(R.id.item_shouye);
        item_tianjiarenwu = (TextView) findViewById(R.id.item_tianjiarenwu);
        item_me = (TextView) findViewById(R.id.item_me);
        item_shezhi = (TextView) findViewById(R.id.item_shezhi);

        item_shouye.setOnClickListener(this);
        item_tianjiarenwu.setOnClickListener(this);
        item_me.setOnClickListener(this);
        item_shezhi.setOnClickListener(this);


        vp = (ViewPager) findViewById(R.id.mainViewPager);
        oneFragment = new OneFragment();
        twoFragment = new TwoFragment();
        threeFragment = new ThreeFragment();
        fourFragment = new FourFragment();


        mFragmentList.add(oneFragment);
        mFragmentList.add(twoFragment);
        mFragmentList.add(threeFragment);
        mFragmentList.add(fourFragment);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.item_shouye:
                vp.setCurrentItem(0, true);
                break;
            case R.id.item_tianjiarenwu:
                vp.setCurrentItem(1, true);
                break;
            case R.id.item_me:
                vp.setCurrentItem(2, true);
                break;
            case R.id.item_shezhi:
                vp.setCurrentItem(3, true);
                break;
        }
    }

    public class FragmentAdapter extends FragmentPagerAdapter {

        List<Fragment> fragmentList = new ArrayList<Fragment>();

        public FragmentAdapter(FragmentManager fm, List<Fragment> fragmentList) {
            super(fm);
            this.fragmentList = fragmentList;
        }

        @Override
        public Fragment getItem(int position) {
            return fragmentList.get(position);
        }

        @Override
        public int getCount() {
            return fragmentList.size();
        }

    }

    private void changeTextColor(int position) {
        if (position == 0) {
            item_shouye.setTextColor(Color.parseColor("#66CDAA"));
            item_tianjiarenwu.setTextColor(Color.parseColor("#000000"));
            item_me.setTextColor(Color.parseColor("#000000"));
            item_shezhi.setTextColor(Color.parseColor("#000000"));

        } else if (position == 1) {
            item_tianjiarenwu.setTextColor(Color.parseColor("#66CDAA"));
            item_shouye.setTextColor(Color.parseColor("#000000"));
            item_me.setTextColor(Color.parseColor("#000000"));
            item_shezhi.setTextColor(Color.parseColor("#000000"));
        } else if (position == 2) {
            item_me.setTextColor(Color.parseColor("#66CDAA"));
            item_shouye.setTextColor(Color.parseColor("#000000"));
            item_tianjiarenwu.setTextColor(Color.parseColor("#000000"));
            item_shezhi.setTextColor(Color.parseColor("#000000"));
        } else if (position == 3) {
            item_shezhi.setTextColor(Color.parseColor("#66CDAA"));
            item_me.setTextColor(Color.parseColor("#000000"));
            item_shouye.setTextColor(Color.parseColor("#000000"));
            item_tianjiarenwu.setTextColor(Color.parseColor("#000000"));

        }
    }

}
