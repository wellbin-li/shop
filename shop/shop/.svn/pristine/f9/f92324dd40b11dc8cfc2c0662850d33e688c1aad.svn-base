package cn.it.shop.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Status;
import cn.it.shop.model.User;

@Controller
@Scope("prototype")
public class ForderAction extends BaseAction<Forder> {

//	//重写model，将model(forder)转换为session中的forder，此方式在此处不安全
//	@Override
//	public Forder getModel() {
//		model=(Forder)session.get("forder");
//		return super.getModel();
//	}

	//实现购物车（订单）与购物项（订单项）级联入库功能
	public String save(){
		//把session中的购物项，交给当前的model对象
		Forder forder=(Forder)session.get("forder");
		//model.setSorderSet(forder.getSorderSet());
		forder.setAddress(model.getAddress());
		forder.setName(model.getName());
		forder.setPhone(model.getPhone());
		forder.setRemark(model.getRemark());
		forder.setPost(model.getPost());
		/*级联入库（需要在映射文件xml中配置），需要sorder关联forder，在SorderServiceImpl业务逻辑类中，
		    追加sorder.setForder(forder),并且forderservice只能存储session中的forder，可以重写model（forder）,
		    或者如上面的一个个属性设置	  
		 */
//		forderService.save(forder);
		forder.setUser((User)session.get("user"));
		forder.setStatus(new Status(1));
		forderService.save(forder);
		session.put("oldForder", session.remove("forder"));
		//此时购物车已经入库，那么原来session中的购物车就应该清空
		//session.put("forder", null);
		return "bank";
	}
}
