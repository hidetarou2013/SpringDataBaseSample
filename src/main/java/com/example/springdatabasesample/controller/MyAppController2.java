package com.example.springdatabasesample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.springdatabasesample.model.FormModel;

@Controller
public class MyAppController2 {

	@RequestMapping(value = "/helo2", method = RequestMethod.GET)
	public String helo(Model model) {
		FormModel fm = new FormModel();
		fm.setInput1("ここに書く");
		model.addAttribute("formModel", fm);
		model.addAttribute("message", "何か書いてください。");
		return "showMessage2";
	}

//	@RequestMapping(value = "/helo2", method = RequestMethod.POST,produces="text/plain;charset=UTF-8")
	@RequestMapping(value = "/helo2", method = RequestMethod.POST)
	public String form(@ModelAttribute FormModel fm,Model model){

		System.out.println(fm.getInput1());

		model.addAttribute("message", "you typed:" + fm.getInput1());
		return "showMessage2";
	}
}
