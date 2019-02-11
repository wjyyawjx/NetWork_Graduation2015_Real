package com.example.hansh.learningsupervisionsystem;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TimePicker;

import org.litepal.LitePal;

public class AddActivity extends Activity {
    private static final String TAG = "RegistActivity";
    private String str_task_content, str_tv_date, str_tv_time;
    private TextView tv_main_title, tv_back;
    private TextView tv_date = null;
    private TextView tv_time = null;
    private int year = 2016;
    private int month = 10;
    private int day = 8;
    private int houre = 15;
    private int minute = 20;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add);
        initView();
    }

    private void initView() {
        tv_main_title = findViewById(R.id.tv_main_title);
        tv_main_title.setText("添加任务");
        tv_back = findViewById(R.id.tv_back);
        tv_main_title.setTextColor(this.getResources().getColor(R.color.colorPrimary));
        tv_date = (TextView) findViewById(R.id.dialog_tv_date);
        tv_time = (TextView) findViewById(R.id.dialog_tv_time);
        Button btn_add = (Button) findViewById(R.id.btn_add);
        btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText et_task_content = (EditText) findViewById(R.id.et_task_content);
                TextView dialog_tv_date = (TextView) findViewById(R.id.dialog_tv_date);
                TextView dialog_tv_time = (TextView) findViewById(R.id.dialog_tv_time);
                str_task_content = et_task_content.getText().toString().trim();
                str_tv_date = dialog_tv_date.getText().toString().trim();
                str_tv_time = dialog_tv_time.getText().toString().trim();
                Log.e(TAG, "任务内容：" + str_task_content);
                Log.e(TAG, "日期：" + str_tv_date);
                Log.e(TAG, "时间：" + str_tv_time);
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
