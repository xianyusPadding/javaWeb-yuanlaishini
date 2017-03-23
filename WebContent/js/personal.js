$(function() {
	//封面width随着容器大小变化	
	$(".fl-cover-img img").css("width", $(".container").width() + "px");
	$(window).resize(function() {
		$(".fl-cover-img img").css("width", $(".container").width() + "px");
	})

	$(".fl-cover-float").css("left", ($(".fl-cover-img img").width() - $(".fl-cover-float").width()) / 2 + "px");
	$(".fl-cover-float").css("top", ($(".fl-cover-img img").height() - $(".fl-cover-float").height()) / 2 + "px");
	$(".fl-tabs-link").css("width", $(".container").width() / 3 - 8 + "px");
	$(".fl-tab1-publishMain").css("width", $(".container").width() - 35 + "px");
	$(".fl-tabs-link a").css("margin-left", ($(".fl-tabs-link").width() - $(".fl-tabs-link a").width()) / 2 + "px");
	var arrH = [];
	var arrW = [];
	$.each($("#fl-tab2 ul li img"), function(index, value) {
//		alert(index);
		arrH[index] = $(value).height() + 14 + "px";
		arrW[index] = $(value).width() + 14 + "px";
		$("#fl-tab2 ul").find("img").eq(index).css("height", arrH[index]);
		$("#fl-tab2 ul").find("img").eq(index).css("width", arrW[index]);
	})

	//$(".fl-tabPhoto-link").css("width",$(".container").width()/3-8+"px");
	$(window).resize(function() {
		$(".fl-cover-float").css("left", ($(".fl-cover-img img").width() - $(".fl-cover-float").width()) / 2 + "px");
		$(".fl-cover-float").css("top", ($(".fl-cover-img img").height() - $(".fl-cover-float").height()) / 2 + "px");
		$(".fl-tabs-link").css("width", $(".container").width() / 3 - 8 + "px");
		$(".fl-tab1-publishMain").css("width", $(".container").width() - 35 + "px");
		$(".fl-tabs-link a").css("margin-left", ($(".fl-tabs-link").width() - $(".fl-tabs-link a").width()) / 2 + "px");
	})

	//个人中心的选项卡
	$("#fl-tabs").tabs({
		active: 1,
	});

	//创建相册的dialog
	$(".fl-photoalbum-btn").click(function() {
		$("#fl-bulid-photoalbum").dialog("open");
		$("#fl-upload-photo").dialog("close");
	})

	$("#fl-bulid-photoalbum").dialog({
		title: "创建相册",
		width: 300,
		height: 200,
		autoOpen: false,
	})

	//上传图片的dialog
	$(".fl-uploadPhoto-btn").click(function() {
		$("#fl-upload-photo").dialog("open");
		$("#fl-bulid-photoalbum").dialog("close");
	})

	$("#fl-upload-photo").dialog({
		title: "上传图片",
		width: 500,
		height: 400,
		autoOpen: false,
	})

	//点击dialog里面的“确认”和“上传”按钮，关闭对话框
	$(".fl-btn-closeBulidAlbum").click(function() {
		$("#fl-bulid-photoalbum").dialog("close");
	})

	$(".fl-btn-closeBulidUpload").click(function() {
		$("#fl-upload-photo").dialog("close");
	})

	$("#fl-tab2 ul li img:nth-of-type(1)").toggle(function(){
		$("#fl-tab2 ul li img").show();		
	},function(){
		$("#fl-tab2 ul li img").hide();	
	})
	
		

	//显示image的方法
	function show_image() {
		var file_img = document.getElementById("show");
		iptfileupload = document.getElementById('img');
		//以下即为完整客户端路径
		getPath(file_img, iptfileupload, file_img);
	}

	function getPath(obj, fileQuery, transImg) {
		var imgSrc = '',
			imgArr = [],
			strSrc = '';
		// IE浏览器判断
		if(window.navigator.userAgent.indexOf("MSIE") >= 1) {
			if(obj.select) {
				obj.select();
				var path = document.selection.createRange().text;
				obj.removeAttribute("src");
				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.setAttribute("src", transImg);
					obj.style.filter =
						"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + path + "', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
				} else {
					throw new Error('File type Error! please image file upload..');
				}
			} else {
				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.src = fileQuery.value;
				} else {
					throw new Error('File type Error! please image file upload..');
				}

			}
		} else {
			// 支持360浏览器 支持谷歌浏览器 支持火狐浏览器
			var file = fileQuery.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {

				imgSrc = fileQuery.value;
				imgArr = imgSrc.split('.');
				strSrc = imgArr[imgArr.length - 1].toLowerCase();
				if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
					obj.setAttribute("src", e.target.result);
				} else {
					throw new Error('File type Error! please image file upload..');
				}

			}
			reader.readAsDataURL(file);
		}
	}

})