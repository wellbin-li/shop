package cn.it.shop.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import net.sf.json.JSONSerializer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.ProductService;
import cn.it.shop.util.EamilUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class MessageUtilImplTest {

	@Resource
	private EamilUtil impl;

	@Test
	public void test(){
		impl.sendEmail("lwb1084514417@sina.com", "10000001");
	}

}
