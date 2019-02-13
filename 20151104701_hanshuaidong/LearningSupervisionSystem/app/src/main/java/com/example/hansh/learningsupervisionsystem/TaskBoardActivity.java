package com.example.hansh.learningsupervisionsystem;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.litepal.LitePal;
import org.litepal.crud.LitePalSupport;
import org.litepal.exceptions.DataSupportException;
import org.litepal.tablemanager.Connector;

import java.util.List;

public class TaskBoardActivity extends AppCompatActivity {
    private static final String TAG = "TaskBoardActivity";
    List<Renwu> RenwuList;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_taskboard);
        RenwuList = LitePal.findAll(Renwu.class);
        for(Renwu renwu:RenwuList){
            Log.e("TaskBoardActivity","Task conten is" + renwu.getTask_content());
            Log.e("TaskBoardActivity","Date is" + renwu.getDate());
            Log.e("TaskBoardActivity","TIme is" + renwu.getTime());
        }

        /*LinearLayout ll=(LinearLayout) findViewById(R.id.ll);
        for(Renwu renwu:RenwuList)
        {
            //1.集合中每有一条数据，就new一个TextView
            TextView tv=new TextView(this);
            //2.把人物的信息设置为文本的内容
            tv.setText(renwu.toString());
            tv.setTextSize(18);
            //3.把TextView设置成线性布局的子节点
            ll.addView(tv);
        }*/
    }
}
