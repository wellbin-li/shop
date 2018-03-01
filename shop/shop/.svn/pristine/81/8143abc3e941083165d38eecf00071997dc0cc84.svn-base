package cn.it.shop.action;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.BackData;
import cn.it.shop.model.Forder;
import cn.it.shop.model.SendData;
import cn.it.shop.model.Status;
import cn.it.shop.model.User;
/*
 * Struts处理流程：获取请求后，先创建Action代理， 在创建代理的时候顺便创建Action，执行18个拦截器，
 * 拦截器执行成功后再调用action方法，action方法执行完毕后，再返回调用拦截器
 * 请求-->action-->拦截器-->action方法-->拦截器-->
 * 
 * 创建Action--->servletConfig--->modelDriven
 * 
 * 实现ParameterAware接口，就会从actionCntext中取得类型为request的map进行传入，会将请求的参数放入其中（此例中为map名为parameters）
 * */
@Controller
@Scope("prototype")
public class PayAction extends BaseAction<Object> implements ParameterAware {

	@Override
	public Object getModel() {
		//请求参数中有银行（pd_FrpId），而返回参数中没有，根据参数中是否有银行来判断该用哪个model模型
		if(parameters.get("pd_FrpId")!=null){
			model=new SendData();
		}else{
			model=new BackData();
		}
		return model;
	}

	private Map<String, String[]> parameters;
	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters=parameters;
	}
	
	public String goBank() {
		SendData sendData =(SendData)model;
		//1:补全参数 P2 p3 pd Pa需要从session中获取
		Forder forder=(Forder)session.get("oldForder");
		User user=(User)session.get("user");
		sendData.setP2_Order(forder.getId().toString());
		sendData.setP3_Amt(forder.getTotal().toString());
		sendData.setPa_MP(user.getEmail() + "," + user.getPhone());
		//2:对参数进行追加
		//3:加密获取签名
		//4:存储到request域中
		payService.saveDataToRequest(request, sendData);
		//5:跳转到支付页面
		return "pay";
	}
	
	public String backBank(){
		BackData backData=(BackData)model;
		System.out.println(backData);
		boolean isOk=payService.checkBackData(backData);
		if(isOk){
			//1.更新订单状态
			forderService.updateStatusById(Integer.parseInt(backData.getR6_Order()), 2);
			//2.根据user邮箱地址，发送邮件
			String emailAddress=backData.getR8_MP().split(",")[0];
			emailUtil.sendEmail(emailAddress, backData.getR6_Order());
			//3.发送手机短信httpClient
			messageUtil.sendMessage(backData.getR8_MP().split(",")[1], backData.getR6_Order());
			System.out.println("----success----");
			return "success";
		}else{
			System.out.println("----fail----");
			return "fail";
		}
	}

}
