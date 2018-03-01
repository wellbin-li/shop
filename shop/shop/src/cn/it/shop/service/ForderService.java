package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Category;
import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;

public interface ForderService extends BaseService<Forder> {
	//计算购物总价格
	public double cluTotal(Forder forder);
	//根据订单编号，更新订单状态
	public void updateStatusById(int id,int sid);
}
