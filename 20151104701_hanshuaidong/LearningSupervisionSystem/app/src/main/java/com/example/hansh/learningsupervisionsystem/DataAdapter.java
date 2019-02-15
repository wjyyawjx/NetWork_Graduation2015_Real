package com.example.hansh.learningsupervisionsystem;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * Created by SwithunHan on 2019/2/13.
 */

public abstract class DataAdapter extends BaseAdapter {
    private Context mContext;
    private LayoutInflater inflater;
    private List<Renwu> renwuList;
    private View view;

    public void setRenwuList(List<Renwu> renwuList) {

    }

    public DataAdapter(Context mContext) {
        this.mContext = mContext;
        this.inflater = LayoutInflater.from(mContext);
    }

    @Override
    public int getCount() {
        return renwuList.size();
    }

    @Override
    public Object getItem(int position) {
        return position;
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder viewHolder = null;
        if (view == null) {
            viewHolder = new ViewHolder();
            view = inflater.inflate(R.layout.item, parent, false);
            viewHolder.item_tv_content = (TextView) view.findViewById(R.id.item_tv_content);
            viewHolder.item_tv_date = (TextView)view.findViewById(R.id.item_tv_date);
            viewHolder.item_tv_time = (TextView)view.findViewById(R.id.item_tv_time);

        }
        return view;
    }

    class ViewHolder {
        TextView item_tv_content;
        TextView item_tv_date;
        TextView item_tv_time;
    }
}
