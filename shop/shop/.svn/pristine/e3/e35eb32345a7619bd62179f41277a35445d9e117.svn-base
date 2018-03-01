package cn.it.shop.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component("emailUtil")
public class EmailUtilImpl implements EamilUtil {
	@Value("#{prop.emailHost}")
	private String emailHost;
	@Value("#{prop.emailUser}")
	private String emailUser;
	@Value("#{prop.emailPass}")
	private String emailPass;
	
	/* (non-Javadoc)
	 * @see cn.it.shop.util.MessageUtil#sendEmail(java.lang.String, java.lang.String)
	 */
	@Override
	public void sendEmail(String emailAddress,String id){
		//登录邮件客户端（创建回话session）
		Properties props=new Properties();
		Session session=null;
		Message message=null;
		Transport transport=null;
		try{
		props.setProperty("mail.transport.protocol", "smtp");
		//创建了session会话
		session=Session.getDefaultInstance(props);
		//设置debug模式调试发送信息
		session.setDebug(true);
		//创建一封邮件对象
		message=new MimeMessage(session);
		//写信
		message.setSubject("订单支付成功邮件！");
		//正文内容
		message.setContent("订单" + id + "已经支付成功！", "text/html;charset=utf-8");
		//发件人地址
		message.setFrom(new InternetAddress("lwb1084514417@sina.com"));
		//链接邮件服务器的认证信息
		transport=session.getTransport();
		//设置参数
		transport.connect(emailHost, emailUser, emailPass);
		//设置收件人地址,并且发送邮件
		transport.sendMessage(message, new Address []{new InternetAddress(emailAddress)});
		}catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			try {
				transport.close();
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}		
	}
//	public static void main (String[] args) throws Exception{
//		//登录邮件客户端（创建回话session）
//		Properties props=new Properties();
//		props.setProperty("mail.transport.protocol", "smtp");
//		//创建了session会话
//		Session session=Session.getDefaultInstance(props);
//		//设置debug模式调试发送信息
//		session.setDebug(true);
//		//创建一封邮件对象
//		Message message=new MimeMessage(session);
//		//写信
//		message.setSubject("订单支付成功邮件！");
//		//正文内容
//		message.setContent("订单123455已经支付成功！", "text/html;charset=utf-8");
//		//发件人地址
//		message.setFrom(new InternetAddress("lwb1084514417@sina.com"));
//		//链接邮件服务器的认证信息
//		Transport transport=session.getTransport();
//		transport.connect("smtp.sina.com", "lwb1084514417", "lwb940804");
//		//设置收件人地址,并且发送邮件
//		transport.sendMessage(message, new Address []{new InternetAddress("lwb1084514417@sina.com"),new InternetAddress("1084514417@qq.com")});
//		transport.close();
//	}
	
}
