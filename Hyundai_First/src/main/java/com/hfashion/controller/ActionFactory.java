package com.hfashion.controller;

import com.hfashion.controller.action.Action;
import com.hfashion.controller.action.MainAction;

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
		}
		
		return action;
	}
}
