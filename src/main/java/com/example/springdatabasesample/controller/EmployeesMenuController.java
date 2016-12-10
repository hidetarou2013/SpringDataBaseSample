package com.example.springdatabasesample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("menu")
public class EmployeesMenuController {

	@RequestMapping(method = RequestMethod.GET)
	public String menu() {
		return "topMenu";
	}
}
