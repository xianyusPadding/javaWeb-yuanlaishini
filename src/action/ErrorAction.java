package action;

import utils.MyConstant;

public class ErrorAction {
	private String message;
	private String link;
	private int status;
	public String getMessage() {
		return message;
	}

	public String getLink() {
		return link;
	}
	public ErrorAction(int status){
		this.status=status;
	}
	public ErrorAction error(){
		switch(status){
			case MyConstant.STATUS_AUTHOR:
				message="请先登录！";
				link="index.jsp";
				break ;
			case MyConstant.STATUS_LOGIN_ERROR:
				message="账号或密码错误！";
				link="index.jsp";
				break ;
			case MyConstant.STATUS_REGISTER_ERROR:
				message="用户名已存在！";
				link="index.jsp";
				break ;
			case MyConstant.STATUS_ALBUM_INSERT:
				message="创建相册失败！";
				link="personal.jsp";
				break ;
			case MyConstant.STATUS_ALBUM_INSERT_EMPTY:
				message="相册名称不能为空！";
				link="personal.jsp";
				break ;
			case MyConstant.STATUS_UPLOAD_PHOTO:
				message="上传相片出错！";
				link="personal.jsp";
				break ;
			case MyConstant.STATUS_UPLOAD_INSERTPHOTO:
				message="未知错误！";
				link="personal.jsp";
				break ;
			case MyConstant.STATUS_SHARE_CONTENT_EMPTY:
				message="分享内容不能为空！";
				link="personal.jsp";
				break ;
			case MyConstant.STATUS_SHARE_INSERT:
				message="分享失败！";
				link="personal.jsp";
				break ;
			case MyConstant.STATUS_USER_UPDATE:
				message="保存失败！";
				link="personal.jsp";
				break ;
		}
		return this;
	}
	
}
