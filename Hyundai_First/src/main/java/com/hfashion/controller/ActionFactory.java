package com.hfashion.controller;

import com.hfashion.controller.action.Action;
import com.hfashion.controller.action.JoinAction;
import com.hfashion.controller.action.LoginFormAction;
import com.hfashion.controller.action.MainAction;
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
		}else if (command.equals("signup")) {
			action = new SignUpAction();
		}else if (command.equals("join")) {
			action = new JoinAction();
		}else if(command.equals("loginform")) {
			action = new LoginFormAction();
		}
		
		return action;
	}
}
