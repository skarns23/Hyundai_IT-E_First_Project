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
		}else if(command.equals("delCart")) {
			action = new CartDelAction();
		}else if(command.equals("delAllCart")){
			action = new CartDelAllAction();
		}else if(command.equals("cartListAll")) {
			action = new CartListAllAction();
		}else if(command.equals("cartSelUpdate")) {
			action = new CartSelUpdateAction();
		}else if(command.equals("cartCntUpdate")) {
			action = new CartCntUpdateAction();
		}else if(command.equals("mypage")) {
			action = new MypageFormAction();
		}else if(command.equals("cart")) {
			action = new CartFormAction();
		}else if(command.equals("confirmID")) {
			action = new ConfirmIDAction();
		}else if(command.equals("mypage_searchOrder")) {
			action = new ListOrderFormAction();
		}else if (command.equals("mypage_searchPeriod")) {
			action = new GetOrderListAction();
		}else if (command.equals("productSort")) {
			action = new ProductSortAction();
		}else if (command.equals("mypage_pwConfirmpage")) {
			action = new PwConfirmFormAction();
		}else if (command.equals("mypage_updateForm")) {
			action = new UpdateFormAction();
		}else if (command.equals("updatePW")) {
			action = new UpdatePWAction();
		}else if (command.equals("mypage_OutForm")) {
			action = new MemberOutFormAction();
		}else if (command.equals("mypage_sucession")) {
			action = new MemberOutAction();
		}else if (command.equals("joinsuccess")) {
			action = new JoinSuccessAction();
		}else if(command.equals("orderComplete")) {
			action = new OrderCompleteAction();
		}else if (command.equals("reviewSearch")) {
			action = new ReviewSearchAction();
		}
		
		
		
		return action;
	}
}
