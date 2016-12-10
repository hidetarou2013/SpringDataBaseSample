package com.example.springdatabasesample.dao;

import java.util.List;

import com.example.springdatabasesample.entity.Employees;

public interface EmployeesDAO<T> {
	public List<T> allList();
	public Employees getbyId(int id);
	public List<T> getByName(String name);
	public boolean insertEmployeesData(Employees employees);
	public int updateEmployeesData(Employees employees);
	public int deleteEmployeesData(int id);
}
