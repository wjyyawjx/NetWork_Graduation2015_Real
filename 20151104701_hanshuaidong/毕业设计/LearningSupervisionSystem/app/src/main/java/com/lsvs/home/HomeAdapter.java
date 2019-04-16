package com.lsvs.home;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.card.MaterialCardView;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.lsvs.DateUtil;
import com.lsvs.R;
import com.lsvs.bean.TaskBean;
import com.lsvs.task.EditTaskActivity;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class HomeAdapter extends RecyclerView.Adapter<HomeAdapter.ViewHolder> {
    private List<TaskBean> list;

    public HomeAdapter(List<TaskBean> list) {
        this.list = list;
    }

    @NonNull
    @Override
    public HomeAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.task_item, viewGroup, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull HomeAdapter.ViewHolder viewHolder, int i) {
        final TaskBean taskBean = list.get(i);
        viewHolder.taskItemTitle.setText(taskBean.getName());
        viewHolder.taskItemDesc.setText(taskBean.getContent());
        viewHolder.taskItemDate.setText(DateUtil.formatDateString(taskBean.getDate()));
        long taskTime = Long.valueOf(taskBean.getDate());
        long currTime = System.currentTimeMillis();

        if (taskTime >= currTime) {
            viewHolder.taskItemTitle.setBackgroundColor(viewHolder.taskItemTitle.getResources().getColor(R.color.bg_blue));
            viewHolder.taskItemDesc.setBackgroundColor(viewHolder.taskItemDesc.getResources().getColor(R.color.bg_blue));
        } else {
            viewHolder.taskItemTitle.setBackgroundColor(viewHolder.taskItemTitle.getResources().getColor(R.color.bg_gary));
            viewHolder.taskItemDesc.setBackgroundColor(viewHolder.taskItemDesc.getResources().getColor(R.color.bg_gary));
        }

        viewHolder.shortcutItemView.setOnClickListener(
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent intent = new Intent(v.getContext(), EditTaskActivity.class);
                        intent.putExtra("type", 1);
                        intent.putExtra("data", taskBean);
                        v.getContext().startActivity(intent);
                    }
                }
        );
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        @BindView(R.id.task_item_title)
        TextView taskItemTitle;
        @BindView(R.id.task_item_desc)
        TextView taskItemDesc;
        @BindView(R.id.task_item_date)
        TextView taskItemDate;
        @BindView(R.id.task_item_view)
        MaterialCardView shortcutItemView;

        ViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
        }
    }
}
