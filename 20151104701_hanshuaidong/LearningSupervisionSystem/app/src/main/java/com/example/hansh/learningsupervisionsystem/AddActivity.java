package com.example.hansh.learningsupervisionsystem;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.TimePicker;

public class AddActivity extends Activity {
    TextView tv_main_title,tv_back;
    TextView tv_date = null;
    TextView tv_time = null;
    int year = 2016;
    int month = 10;
    int day = 8;
    int houre = 15;
    int minute = 20;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add);
        initView();
    }

    private void initView() {
        tv_main_title = findViewById(R.id.tv_main_title);
        tv_main_title.setText("添加任务");
        tv_main_title.setTextColor(this.getResources().getColor(R.color.colorPrimary));
        tv_date = (TextView) findViewById(R.id.dialog_tv_date);
        tv_time = (TextView) findViewById(R.id.dialog_tv_time);
        tv_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AddActivity.this.finish();
            }
        });
    }


    public void getDate(View v) {

        new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() {

            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear,
                                  int dayOfMonth) {
                AddActivity.this.year = year;
                month = monthOfYear;
                day = dayOfMonth;
            }
        }, 2016, 10, 8).show();
        showDate();
    }

    public void getTime(View v) {
        new TimePickerDialog(this, new TimePickerDialog.OnTimeSetListener() {

            @Override
            public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
                houre = hourOfDay;
                AddActivity.this.minute = minute;
            }
        }, 15, 20, true).show();
        showTime();
    }

    private void showDate() {
        tv_date.setText("你选择的日期是：" + year + "年" + month + "月" + day + "日");
    }

    private void showTime() {
        tv_time.setText("你选择的时间是：" + houre + "时" + minute + "分");
    }

}

