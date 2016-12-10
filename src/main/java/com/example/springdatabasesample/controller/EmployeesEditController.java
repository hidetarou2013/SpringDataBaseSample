package com.example.springdatabasesample.controller;

import java.util.List;

import javax.validation.GroupSequence;
import javax.validation.groups.Default;

import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.springdatabasesample.dao.DepartmentsDAO;
import com.example.springdatabasesample.dao.EmployeesDAO;
import com.example.springdatabasesample.entity.Departments;
import com.example.springdatabasesample.entity.Employees;
import com.example.springdatabasesample.model.EmployeesModel;
import com.example.springdatabasesample.model.ErrorCheckGroup1;

@Controller
@RequestMapping("edit")
public class EmployeesEditController {
	private static ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

	@SuppressWarnings("unchecked")
	private static EmployeesDAO<Employees> empDAO = (EmployeesDAO<Employees>) context.getBean("employeesDAO");

	private DepartmentsDAO<Departments> deptDAO = null;

	@GroupSequence({ Default.class, ErrorCheckGroup1.class })
	interface GroupOrder {
	}

	@RequestMapping(method = RequestMethod.GET)
	public String toEdit(@RequestParam int paramId, Model model) {
		Employees emp = empDAO.getbyId(paramId);
		EmployeesModel eModel = new EmployeesModel();

		BeanUtils.copyProperties(emp, eModel);
		eModel.setDepartment_id(emp.getDepartment_id());
		eModel.setEmployee_id(new Integer(paramId).toString());

		model.addAttribute("employeesModel", eModel);
		model.addAttribute("deptList", this.makeSelectDepartments());

		return "editEmployeesData";
	}

	@RequestMapping(method = RequestMethod.POST, params = "edit")
	public String edit(@RequestParam int employee_id,
			@Validated(GroupOrder.class) @ModelAttribute EmployeesModel eModel, BindingResult result, Model model) {
		if (result.hasErrors() == true) {
			eModel.setEmployee_id(new Integer(employee_id).toString());

			model.addAttribute("employeesModel", eModel);
			model.addAttribute("deptList", this.makeSelectDepartments());

			return "editEmployeesData";

		} else {
			Employees emp = new Employees();

			BeanUtils.copyProperties(eModel, emp);

			emp.setEmployee_id(Integer.parseInt(eModel.getEmployee_id()));
			emp.setDepartment_id(eModel.getDepartment_id());

			if (empDAO.updateEmployeesData(emp) == 1) {
				return "redirect:/change";

			} else {
				model.addAttribute("errorMessage", "SQLエラーが発生しています。");
				model.addAttribute("deptList", this.makeSelectDepartments());

				return "editEmployeesData";
			}
		}
	}

	@RequestMapping(method = RequestMethod.POST, params = "reset")
	public String reset(@RequestParam int employee_id, Model model) {
		Employees emp = empDAO.getbyId(employee_id);
		EmployeesModel eModel = new EmployeesModel();

		BeanUtils.copyProperties(emp, eModel);
		eModel.setDepartment_id(emp.getDepartment_id());
		eModel.setEmployee_id(new Integer(employee_id).toString());

		model.addAttribute("employeesModel", eModel);
		model.addAttribute("deptList", this.makeSelectDepartments());

		return "editEmployeesData";
	}

	@SuppressWarnings("unchecked")
	private List<Departments> makeSelectDepartments() {
		if (deptDAO == null) {
			deptDAO = (DepartmentsDAO<Departments>) context.getBean("departmentsDAO");
		}

		return deptDAO.allList();
	}
}
