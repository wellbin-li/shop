package cn.it.shop.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import java.util.Set;

/**
 * 容器的关闭 并不会到时session的销毁
 * 当对象存储到硬盘的时候，就需要实现序列化接口，序列化的功能是添加了一个唯一的ID（类主键）
 * 这样在反序列化的时候就可以成功找到相应的对象
 */

public class Forder implements java.io.Serializable {
	// Fields

	private Integer id;
	private String name;
	private String phone;
	private String remark;
	private Timestamp date;
	private Double total;
	private String post;
	private String address;
	private User user;
	private Status status;
	private Set<Sorder> sorderSet;
	
	public Forder(Set<Sorder> sorderSet) {
		super();
		this.sorderSet = sorderSet;
	}

	/** default constructor */
	public Forder() {
	}

	/** minimal constructor */
	public Forder(Timestamp date) {
		this.date = date;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Set<Sorder> getSorderSet() {
		return sorderSet;
	}

	public void setSorderSet(Set<Sorder> sorderSet) {
		this.sorderSet = sorderSet;
	}

	
	

}