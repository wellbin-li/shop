package cn.it.shop.util;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Component;
@Component("messageUtil")
public class MessageUtilImpl implements MessageUtil {
	
	/* (non-Javadoc)
	 * @see cn.it.shop.util.MessageUtil#sendMessage(java.lang.String, java.lang.String)
	 */
	@Override
	public void sendMessage(String phone,String id){
		//1:打开浏览器
		HttpClient client=new HttpClient();
		//2:创建请求方式，get/post
		PostMethod post=new PostMethod("http://utf8.sms.webchinese.cn/");
		//3：设置请求的参数信息
		post.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
		post.setParameter("Uid", "lwb1084514417");
		post.setParameter("Key", "506f8ee65b4b7426de48");
		post.setParameter("smsMob", phone);
		post.setParameter("smsText", "订单" +id+ "支付成功");
		try {
			//4：提交请求
			int code=0;
			code=client.executeMethod(post);
			System.out.println("http返回的状态码：" + code);	
			//5:获取服务器返回的数据信息
			String s=post.getResponseBodyAsString();
			System.out.println("短信发送结果为：" + s);		
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			post.releaseConnection();
		}
		
	}
	
//	public static void main(String[] args) throws Exception{
//		//1:打开浏览器
//		HttpClient client=new HttpClient();
//		//2:创建请求方式，get/post
//		PostMethod post=new PostMethod("http://utf8.sms.webchinese.cn/");
//		//3：设置请求的参数信息
//		post.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
//		post.setParameter("Uid", "lwb1084514417");
//		post.setParameter("Key", "506f8ee65b4b7426de48");
//		post.setParameter("smsMob", "15629168655");
//		post.setParameter("smsText", "订单111111支付成功");
//		//4：提交请求
//		int code=client.executeMethod(post);
//		System.out.println("http返回的状态码：" + code);
//		//5:获取服务器返回的数据信息
//		String s=post.getResponseBodyAsString();
//		System.out.println("短信发送结果为：" + s);
//	}
}
