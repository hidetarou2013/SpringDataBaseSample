package com.example.springdatabasesample.controller;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.springdatabasesample.dao.DepartmentsDAO;
import com.example.springdatabasesample.entity.Departments;

/**
 * refs #465 部署リストの出力
 * departmentsデータの登録
 * url:
 * http://localhost:8080/databasesample/deptList
 *
 * @author maekawa
 *
 */
@Controller
public class DepartmentsListController {

	private static ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

	@SuppressWarnings("unchecked")
	private static DepartmentsDAO<Departments> deptDAO = (DepartmentsDAO<Departments>)context.getBean("departmentsDAO");

	@RequestMapping(value="/deptList",method=RequestMethod.GET)
	public String deptList(Model model){
		List<Departments> list = deptDAO.allList();
		model.addAttribute("message","部署リスト");
		model.addAttribute("departmentsList",list);
		return "listDepartmentsData";
	}
}
