$(function(){	
	var bootstrapButton = $.fn.button.noConflict();
	$.fn.bootstrapBtn = bootstrapButton;

	$(".navbar-toggle").click(function(){
		$("#navbar-collapse").css("background","#eee");
	});
	
	$("#fl-registerreg").dialog({
		title: "会员注册",
		modal: true,
		width: 330,
		height: 360,
		resizable: false,
		buttons: {
			"提交": function() {
				$(this).submit();
			},
		},
		autoOpen:false
	})

	$("#fl-loginreg").dialog({
		title: "会员登陆",
		modal: true,
		width: 330,
		height: 210,
		resizable: false,
		buttons: {
			"确认登陆": function() {
				$(this).submit();
			},
			"忘记密码？": function() {
				
			},
		},
		autoOpen:false
	})
	// $(window).reset(function(){
	// 	$(".myerror").html("");
	// 	$("#fl-registerreg").dialog("option","height",340);
	// });


	// $(".ui-dialog-titlebar-close").addClass("fl-dialog-close");

	// $(".fl-dialog-close").on("click",function(){
	// 		$(".myerror").html("");
	// 		$("#fl-registerreg").dialog("option","height",340);
	// })
	
	
	$("#fl-register").click(function(){
//		$("#fl-registerreg").resetForm();
		$("#fl-registerreg").dialog("open");
		$("#fl-loginreg").dialog("close");
	})




	$("#fl-login").click(function(){
		$("#fl-loginreg").dialog("open");
		$("#fl-registerreg").dialog("close");
	})

	$("#fl-registerreg").validate({
		showErrors:function(){
			var errors=this.numberOfInvalids();
			// alert(errors);
			if(errors > 0){
				$("#fl-registerreg").dialog("option","width",120+330);
			}else{
				$("#fl-registerreg").dialog("option","width",330);
			}
			this.defaultShowErrors();
		},
		// errorLabelContaine:"p.myerror",
		// wrapper:'li',
		rules:{
			username:{
				required:true,
				minlength:2
			},
			user:{
				required:true,
				minlength:3
			},
			pass:{
				required:true,
				minlength:8
			},
			password:{
				required:true,
				minlength:8,
				equalTo:"#fl-pass"
			},
			email:{
				required:true,
				email:true
			},
		},
		messages:{
			username:{
				required:"昵称不得为空！",
				minlength:"昵称不得少于2位！"
			},
			user:{
				required:"账号不得为空！",
				minlength:"账号不得少于3位！"
			},
			pass:{
				required:"密码不得为空！",
				minlength:"密码不得少于8位！"
			},
			password:{
				required:"密码不得为空！",
				minlength:"密码不得少于8位！",
				equalTo:"请再次输入密码！"
			},
			email:{
				required:"邮箱不得为空！",
				email:"请输入正确的邮箱！"
			},
		}
	})


	$("#fl-loginreg").validate({
		showErrors:function(){
			var errors=this.numberOfInvalids();
			// alert(errors);
			if(errors > 0){
				$("#fl-loginreg").dialog("option","width",120+330);
			}else{
				$("#fl-loginreg").dialog("option","width",330);
			}
			this.defaultShowErrors();
		},
		// errorLabelContainer:"p.myerror",
		// wrapper:'li',
		rules:{
			user:{
				required:true,
				minlength:3
			},
			pass:{
				required:true,
				minlength:8
			}
		},
		messages:{
			user:{
				required:"账号不得为空！",
				minlength:"账号不得少于3位！"
			},
			pass:{
				required:"密码不得为空！",
				minlength:"密码不得少于8位！"
			}
		}
	})

	$("#fl-email").autocomplete({
		delay: 0, //延迟
		source: function(request, response) {
			//获取用户输入的内容
			//alert(request.term); 
			var hosts = ["qq.com", "163.com", "sina.cn.com", "hostemail.com"],
				term = request.term, //获取用户输入的内容
				name = term, //邮箱的用户名
				host = "", //邮箱的域名
				ix = term.indexOf("@"); //@的位置
			result = []; //最终呈现的邮箱列表

			//当有@的时候，重新分配用户名和域名
			if (ix > -1) {
				name = term.slice(0, ix);
				host = term.slice(ix + 1);
			}

			if (name) {
				//入如果用户已经输入@和后面的域名， 
				//那么就找到相关的域名提示
				var findedHosts = (host ? $.grep(hosts, function(value, index) {
					return value.indexOf(host) > -1
				}) : hosts);

				var findedResult = $.map(findedHosts, function(value, index) {
					return name + "@" + value;
				});
				result = findedResult;
			}
			response(result);
		}
	})
	
	//登陆回车submit
	$('#fl-pass-keydown').keydown(function(event){
		var pass_keyCode=event.keyCode;
		if(pass_keyCode==13){
			$('#fl-loginreg').submit();
		}
	})
})