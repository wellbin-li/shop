<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf"%>
  	<style type="text/css">
  		.searchbox {
		  margin:-3;
		}
  	</style>
  	<script type="text/javascript">
  		$(function(){
  			$('#dg').datagrid({ 
  			//加载等待信息
  			loadMsg:'请等待..........',
  			//请求url的地址   
		    url:'product_queryJoinCategory.action',
		 	//在请求远程数据的时候发送额外的参数
		 	queryParams:{name:''},
		 	//指定id字段为标识字段，在删除、更新时有用，如果配置此字段，在翻页的时候被选中的记录不会丢失
		 	idField:'id',
		 	//显示斑马线
		 	striped:true,
		 	//如果为true，则只允许选择一行，全选会功能失效
		 	singleSelect:false,
		 	//如果为true，则在同一行中显示数据。设置为true可以提高加载性能。默认true
		 	nowrap:true,
		 	toolbar: [{
				iconCls: 'icon-add',
				text:'添加商品',
				handler: function(){
					parent.$("#win").window({
						title:'添加商品',
						width:500,
						height:600,
						content:'<iframe src="send_product_save.action" frameborder="0" width="100%" height="100%"/>'
					});
				}
			},'-',{
				iconCls: 'icon-edit',
				text:'更新商品',
				handler: function(){
					alert("--自己实现--");
				}
			},'-',{
				iconCls: 'icon-remove',
				text:'删除商品',
				handler: function(){
					alert("--自己实现--");
				}
			},'-',{
				text:"<input id='ss' name='search'/>",
			}],
		 	
		 	/* rowStyler: function(index,row){
		 		//返回的字符串交给style
				if (index%2==0){
					return 'background-color:#fedcbd;color:#000;';
				}else{
					return 'background-color:#7bbfea;color:#000;';
				}
			}, */
			//pagePosition:'both',
			pageSize:5,
			pageList:[5,10,15,20],
			//在底部显示分页工具箱
			pagination:true,
			//自动适应列,如果设置，则不会显示水平滚动条，在显示冻结列时此参数不要设置
			fitColumns:true,
		    //同列属性，但是这些列将会被冻结在左侧。
		    frozenColumns:[[
		    	//xyz任意取的  但不能为空
		    	{field:'xyz',checkbox:true},
		    	{field:'id',title:'商品编号',width:100},
		    ]],
		    //配置dg得到列字段field:列字段的名称，与json的key捆绑title:列标题   
		    columns:[[  
		        {field:'name',title:'商品名称',width:200},    
		        {field:'remark',title:'简单介绍',width:300},
		        {field:'category.type',title:'所属类别',width:200,
		        	formatter: function(value,row,index){
		        		if(row.category!=null && row.category.type!=null){
		        			return row.category.type;
		        		}
					}
		        }    
		    ]]    
			});
		
			//把普通的文本框转换为搜索文本框
			$('#ss').searchbox({
				//触发查询时间
				searcher:function(value,name){
				//获取当前查询的关键字，通过dg加载相应的信息 
				//alert(value + "," + name); 
				$('#dg').datagrid('load',{
					name: value,
				});
				}, 
				prompt:'变形金刚' 
			}); 
  		});
  	</script>
  </head>
  
  <body>
  	<table id="dg"></table>  
  	
  </body>
</html>
