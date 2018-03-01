<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 引入公共的JSP片段 -->
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			//自定义验证方法 向validatebox.defaults.relus中注册新函数
			$.extend($.fn.validatebox.defaults.rules, { 
				//函数的名称:函数实现体(又是一个json对象，里面包括函数的实现，和错误的消息设置)   
			    format: {  
			    	//函数实现,如果返回为false，则验证失败 
			        validator: function(value,param){    
			         	//alert(value + "," + param.length);
			         	//获取当前文件的后缀名
			         	var ext=value.substring(value.lastIndexOf('.') + 1);
			         	//转换为小写
			         	ext=ext.toLowerCase();
			         	//获取支持的文件后缀名，然后比较即可
			         	var arr=param[0].split(",");
			         	for(var i=0;i<arr.length;i++){
			         		if(ext==arr[i])
			         			return true;
			         	}
			         	return false;  
			        },   
			        //错误消息 
			        message: '文件必须为：{0}格式'   
			    }   
			});
			//对管理员的下拉列表框进行远程加载
  			$('#cc').combobox({    
			    url:'category_query.action',    
			    valueField:'id',    
			    textField:'type',
			    panelHeight:'auto',
			    panelWidth:150,
			    width:150,
			    editable:false,
			    required:true,
  				missingMessage:'请选择所属类别'
			});  
			$("input[name=name]").validatebox({
  				required:true,
  				missingMessage:'请输入商品名称'
  			});
			$("input[name=price]").numberbox({
  				required:true,
  				missingMessage:'请输入商品价格',
  				min:0,    
    			precision:2,    
  				prefix:'￥'
  			});
			$("input[name='fileImage.upload']").validatebox({
  				required:true,
  				missingMessage:'请上传商品图片',
  				//设置自定义方法
  				validType:"format['gif,jpg,jpeg,png']"	
  			});
  			//当文件域内容发生变化时，则调用验证方法（默认单击提交时调用验证）
  			$("input[name='fileImage.upload']").change(function(){
  				//验证文本框的内容是否有效
  				$(this).validatebox("validate");
  			});
  			$("textarea[name=remark]").validatebox({
  				required:true,
  				missingMessage:'请输入商品的简单描述'
  			});
  			//默认禁止验证功能
  			$("#ff").form("disableValidation");
  			//添加提交按钮监听事件
  			$("#submit").click(function(){
  				//开启验证
  				$("#ff").form("enableValidation");
  				if($("#ff").form("validate")){
  					//提交数据
  					$('#ff').form('submit', {
						url:'product_save.action',
						success: function(){
							//关闭当前窗体
							parent.$("#win").window("close");
							//iframe 中的dg对象
  							var dg=parent.$("iframe[title='商品管理']").get(0).contentWindow.$("#dg");
							dg.datagrid("reload");
						}
					});
  					
  				}
  			});
  			//添加重置按钮监听事件
  			$("#reset").click(function(){
  				//重置当前表单数据
  				$("#ff").form("reset");
  			});
		});
	</script>
</head>

<body>
<form title="添加商品" id="ff" method="post" enctype="multipart/form-data">
	<div>
		<label>商品名称:</label> <input type="text" name="name" />
	</div>
	<div>
		<label>商品价格:</label> <input type="text" name="price" />
	</div>
	<div>
		<label>图片上传:</label> <input type="file" name="fileImage.upload" />
	</div>
	<div>
		<label>所属类别：</label> 
		<input id="cc" name="category.id" />
	</div>
	<div>
		<label>加入推荐:</label> 
		推荐:<input type="radio" name="commend" checked="checked" value="true" />  
		不推荐:<input type="radio" name="commend" value="false" /> 
	</div>
	<div>
		<label>是否有效:</label>
		上架:<input type="radio" name="open" checked="checked"value="true" />
		下架:<input type="radio" name="open" value="false" />
				
	</div>
	<div>
		<label>简单描述:</label>
		<textarea name="remark" cols="40" rows="4"></textarea>
	</div>
	<div>
		<label>详细描述:</label>
		<textarea name="xremark" cols="40" rows="8"></textarea>
	</div>
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form>
</body>
</html>
