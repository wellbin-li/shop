package cn.it.shop.service.impl;


import org.springframework.stereotype.Service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.ForderService;
@Service("forderService")
public class ForderServiceImpl extends BaseServiceImpl<Forder> implements
		ForderService {

	@Override
	public double cluTotal(Forder forder) {
		double total=0.0;
		for(Sorder temp:forder.getSorderSet()){
			total+=temp.getNumber()*temp.getPrice();
		}
		return total;
	}

	@Override
	public void updateStatusById(int id, int sid) {
		String hql="UPDATE Forder f SET f.status.id=:sid WHERE f.id=:id";
		getSession().createQuery(hql)
		.setInteger("sid", sid)
		.setInteger("id", id)
		.executeUpdate();
	}
	
}
