package com.hfashion.controller;

import com.hfashion.controller.action.Action;
import com.hfashion.controller.action.CartAction;
import com.hfashion.controller.action.CartDelAction;
import com.hfashion.controller.action.CartDelAllAction;
import com.hfashion.controller.action.CartFormAction;
import com.hfashion.controller.action.CartListAllAction;
import com.hfashion.controller.action.ConfirmIDAction;
import com.hfashion.controller.action.GetOrderListAction;
import com.hfashion.controller.action.JoinAction;
import com.hfashion.controller.action.ListOrderFormAction;
import com.hfashion.controller.action.LoginAction;
import com.hfashion.controller.action.LoginFormAction;
import com.hfashion.controller.action.LogoutAction;
import com.hfashion.controller.action.MainAction;
import com.hfashion.controller.action.MypageFormAction;
import com.hfashion.controller.action.OrderAction;
import com.hfashion.controller.action.ProductDetailAction;
import com.hfashion.controller.action.ProductListAction;
import com.hfashion.controller.action.ReviewDetailAction;
import com.hfashion.controller.action.ReviewListAction;
import com.hfashion.controller.action.ReviewWriteAction;
import com.hfashion.controller.action.ReviewWriteFormAction;
import com.hfashion.controller.action.SearchIDAction;
import com.hfashion.controller.action.SearchIDFormAction;
import com.hfashion.controller.action.SignUpAction;

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
		}else if(command.equals("delCart")) {
			action = new CartDelAction();
		}else if(command.equals("delAllCart")){
			action = new CartDelAllAction();
		}else if(command.equals("mypage")) {
			action = new MypageFormAction();
		}else if(command.equals("cart")) {
			action = new CartFormAction();
		}else if(command.equals("confirmID")) {
			action = new ConfirmIDAction();
		}else if(command.equals("cartListAll")) {
			action = new CartListAllAction();
		}else if(command.equals("mypage_searchOrder")) {
			action = new ListOrderFormAction();
		}else if (command.equals("mypage_searchPeriod")) {
			action = new GetOrderListAction();

		}
		return action;
	}
}
