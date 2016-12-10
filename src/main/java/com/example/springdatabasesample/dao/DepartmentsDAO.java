package com.example.springdatabasesample.dao;

import java.util.List;

public interface DepartmentsDAO<T> {

		public List<T> allList();
}
