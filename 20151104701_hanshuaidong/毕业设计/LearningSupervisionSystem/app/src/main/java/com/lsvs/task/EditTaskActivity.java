package com.lsvs.task;

import android.view.View;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.Toast;

import com.lsvs.BaseActivity;
import com.lsvs.CalendarReminderUtils;
import com.lsvs.DateUtil;
import com.lsvs.R;
import com.lsvs.bean.TaskBean;
import com.lsvs.db.TaskDao;
import com.wdullaer.materialdatetimepicker.date.DatePickerDialog;
import com.wdullaer.materialdatetimepicker.time.TimePickerDialog;

import java.util.Calendar;

import butterknife.BindView;
import butterknife.OnClick;

public class EditTaskActivity extends BaseActivity implements DatePickerDialog.OnDateSetListener, TimePickerDialog.OnTimeSetListener {

    @BindView(R.id.edit_title)
    AutoCompleteTextView editTitle;
    @BindView(R.id.edit_desc)
    AutoCompleteTextView editDesc;
    @BindView(R.id.edit_date)
    AutoCompleteTextView editDate;
    @BindView(R.id.edit_save)
    Button editSave;

    @BindView(R.id.edit_delete)
    Button editDelete;
    private TaskBean taskBean;
    private String date;
    private String time;
    private int type;
    private String userId;
    private String oldTime = "";

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
        return "编辑任务";
    }

    @Override
    public int getContentId() {
        return R.layout.activity_edit;
    }

    @Override
    protected void loadData() {
        type = getIntent().getIntExtra("type", 0);
        if (type == 1) {
            taskBean = (TaskBean) getIntent().getSerializableExtra("data");
        } else {
            userId = getIntent().getStringExtra("userId");
        }
    }

    @Override
    protected void buildView() {
        if (taskBean != null) {
            editTitle.setText(taskBean.getName());
            editDesc.setText(taskBean.getContent());
            editDate.setText(DateUtil.formatDateString(taskBean.getDate()));
            editDelete.setVisibility(View.VISIBLE);
            editDelete.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    loadLayout.setVisibility(View.VISIBLE);
                    TaskDao taskDao = new TaskDao(getBaseContext());
                    if (taskDao.delete(taskBean) &&
                            CalendarReminderUtils.deleteCalendarEvent(getBaseContext(), taskBean.getDate())) {
                        Toast.makeText(EditTaskActivity.this, "删除成功", Toast.LENGTH_SHORT).show();
                        finish();
                    } else {
                        Toast.makeText(EditTaskActivity.this, "删除失败", Toast.LENGTH_SHORT).show();
                        loadLayout.setVisibility(View.GONE);
                    }
                }
            });
        }
    }

    @OnClick({R.id.edit_date, R.id.edit_save})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case R.id.edit_date:
                showDatePicker();
                break;
            case R.id.edit_save:
                if (editTitle.getText().length() == 0 || editDesc.getText().length() == 0 || editDate.getText().length() == 0) {
                    Toast.makeText(this, "请填写完整信息", Toast.LENGTH_SHORT).show();
                    return;
                }

                loadLayout.setVisibility(View.VISIBLE);
                if (type == 0) {
                    taskBean = new TaskBean();
                    taskBean.setUserId(userId);
                } else {
                    oldTime = taskBean.getDate();
                }

                taskBean.setName(editTitle.getText().toString());
                taskBean.setContent(editDesc.getText().toString());
                taskBean.setDate(DateUtil.decodeDateString(editDate.getText().toString()).getTime() + "");
                TaskDao taskDao = new TaskDao(this);

                boolean isOver;
                if (type == 1) {
                    if (!oldTime.isEmpty()) {
                        CalendarReminderUtils.deleteCalendarEvent(this, oldTime);
                    }

                    isOver = taskDao.update(taskBean);
                } else {
                    isOver = taskDao.addTask(taskBean);
                }

                if (isOver && CalendarReminderUtils.addCalendarEvent(this,
                        taskBean.getName(), taskBean.getContent(), Long.valueOf(taskBean.getDate()))) {
                    loadLayout.setVisibility(View.GONE);
                    Toast.makeText(this, "保存成功，记得按时完成哦", Toast.LENGTH_SHORT).show();
                    finish();
                } else {
                    loadLayout.setVisibility(View.GONE);
                    Toast.makeText(this, "保存失败", Toast.LENGTH_SHORT).show();
                }
                break;
        }
    }

    private void showDatePicker() {
        Calendar now = Calendar.getInstance();
        DatePickerDialog dpd = DatePickerDialog.newInstance(this,
                now.get(Calendar.YEAR),
                now.get(Calendar.MONTH),
                now.get(Calendar.DAY_OF_MONTH)
        );

        dpd.setMinDate(Calendar.getInstance());
        dpd.autoDismiss(true);
        dpd.vibrate(false);
        dpd.setOkText("");
        dpd.setCancelText("");

        dpd.setAccentColor(getResources().getColor(R.color.colorPrimary));
        dpd.setOkColor(getResources().getColor(R.color.colorAccent));
        dpd.setCancelColor(getResources().getColor(R.color.colorPrimaryDark));
        dpd.show(getFragmentManager(), "date");
    }

    private void showTimePicker() {
        TimePickerDialog dpd = TimePickerDialog.newInstance(this, true);
        dpd.vibrate(false);
        dpd.setOkText("确定");
        dpd.setCancelText("取消");

        dpd.setAccentColor(getResources().getColor(R.color.colorPrimary));
        dpd.setOkColor(getResources().getColor(R.color.colorAccent));
        dpd.setCancelColor(getResources().getColor(R.color.colorPrimaryDark));
        dpd.show(getFragmentManager(), "time");
    }

    @Override
    public void onDateSet(DatePickerDialog view, int year, int monthOfYear, int dayOfMonth) {
        date = String.format("%d-%d-%d", year, monthOfYear + 1, dayOfMonth);
        showTimePicker();
    }

    @Override
    public void onTimeSet(TimePickerDialog view, int hourOfDay, int minute, int second) {
        time = String.format(" %d:%d:%d", hourOfDay, minute, second);
        editDate.setText(date + time);
    }
}
