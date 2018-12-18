package cn.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
 
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.IOException;
import java.util.Properties;
 
/**
 * created by viking on 2018/07/17
 * 测试邮件发送controller
 */
@RestController
public class SendMailController {
    @Autowired
    private JavaMailSender javaMailSender;//在spring中配置的邮件发送的bean

    @RequestMapping("send.action")
    public Object sendMail03(){
        MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        try {
            mMessageHelper=new MimeMessageHelper(mMessage,true);
            mMessageHelper.setFrom("912987977@qq.com");//发件人邮箱
            mMessageHelper.setTo("mnb7706@163.com");//收件人邮箱
            mMessageHelper.setSubject("Spring的邮件发送");//邮件的主题
            mMessageHelper.setText("<p>这是使用spring的邮件功能发送的一封邮件</p><br/>" +
                    "<img src='cid:fengye'>",true);//邮件的文本内容，true表示文本以html格式打开
//            File file=new File("F:/img/枫叶.png");//在邮件中添加一张图片
//            FileSystemResource resource=new FileSystemResource(file);
//            mMessageHelper.addInline("fengye", resource);//这里指定一个id,在上面引用
//            mMessageHelper.addAttachment("枫叶.png", resource);//在邮件中添加一个附件
            javaMailSender.send(mMessage);//发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "Send Success!";
    }
}
