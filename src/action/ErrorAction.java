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
			case MyConstant.STATUS_LOGIN_ERROR:
				message="账号或密码错误！";
				link="index.jsp";
				break ;
			case MyConstant.STATUS_REGISTER_ERROR:
				message="用户名已存在！";
				link="index.jsp";
				break ;
		}
		return this;
	}
	
}
