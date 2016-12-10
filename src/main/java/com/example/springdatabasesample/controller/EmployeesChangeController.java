package com.example.springdatabasesample.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.springdatabasesample.dao.EmployeesDAO;
import com.example.springdatabasesample.entity.Employees;
import com.example.springdatabasesample.model.EmployeesModel;

@Controller
@RequestMapping("change")
public class EmployeesChangeController {
	private static ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

	@SuppressWarnings("unchecked")
	private static EmployeesDAO<Employees> empDAO = (EmployeesDAO<Employees>) context.getBean("employeesDAO");

	@RequestMapping(method = RequestMethod.GET)
	public String changeList(Model model) {
		EmployeesModel eModel = new EmployeesModel();
		model.addAttribute("employeesModel", eModel);

		List<Employees> list = empDAO.allList();
		model.addAttribute("changeEmployeesList", list);

		return "changeEmployeesData";
	}
}
