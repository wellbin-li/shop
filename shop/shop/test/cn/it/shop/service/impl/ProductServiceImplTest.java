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
import cn.it.shop.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ProductServiceImplTest {

	@Resource
	private ProductService productService;

//	@Test
//	public void queryJoinCategory() {
//		for(Product product: productService.queryJoinCategory("", 1, 5)){
//			System.out.println(product);
//			product.getCategory().setAccount(null);
//			System.out.println(JSONSerializer.toJSON(product));
//		}
//	}
	
//	@Test
//	public void queryByCid(){
//		for(Product product: productService.queryByCid(1)){
//			System.out.println(product);
//		}
//	}
	
	@Test
	public void get(){
		System.out.println(productService.get(1));
		System.out.println(productService.get(1));
	}
	
	@Test
	public void update(){
		Product product=productService.get(1);
		product.setName("西服2");
		productService.update(product);
	}
	
	@Test
	public void save(){
		Product product=productService.get(2);
		product.setName("西服2xxxxxxxxx");
		productService.save(product);
	}
	
	@Test
	public void delete(){
		productService.delete(1);
	}

}
