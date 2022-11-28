package com.hfashion.controller;

import com.hfashion.controller.action.*;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	public ActionFactory() {
		super();
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory : " + command);
		if(command==null) {
			action = new MainAction();
		} else if(command.equals("detail")) {
			action = new ProductDetailAction();
		}else if(command.equals("productList")) {
			action = new ProductListAction();
		}else if (command.equals("signup")) {
			action = new SignUpAction();
		}else if (command.equals("join")) {
			action = new JoinAction();
		}else if(command.equals("loginform")) {
			action = new LoginFormAction();
		}else if(command.equals("reviewdetail")) {
			action = new ReviewDetailAction();
		}else if(command.equals("reviewlist")) {
			action = new ReviewListAction();
		}else if(command.equals("reviewwriteform")) {
			action = new ReviewWriteFormAction();
		}else if(command.equals("mypage_reviewwrite")) {
			action = new ReviewWriteAction();
		}else if(command.equals("login")) {
			action = new LoginAction();
		}else if(command.equals("logout")) {
			action = new LogoutAction();
		}else if(command.equals("searchIdForm")) {
			action = new SearchIDFormAction();
		}else if(command.equals("searchID")) {
			action = new SearchIDAction();
		}else if(command.equals("order")) {
			action = new OrderAction();
		}else if(command.equals("cart")) {
			action = new CartAction();
		}else if(command.equals("addCart")) {
			action = new CartInsertAction();
		}else if(command.equals("delCart")) {
			action = new CartDelAction();
		}else if(command.equals("mypage")) {
			action = new MypageFormAction();
		}else if(command.equals("cart")) {
			action = new CartFormAction();
		}else if(command.equals("confirmID")) {
			action = new ConfirmIDAction();
		}
		return action;
	}
}
