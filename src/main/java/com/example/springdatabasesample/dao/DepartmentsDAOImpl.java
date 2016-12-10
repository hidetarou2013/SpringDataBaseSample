package com.example.springdatabasesample.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.example.springdatabasesample.entity.Departments;

public class DepartmentsDAOImpl implements DepartmentsDAO<Departments> {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Departments> allList() {
		// TODO 自動生成されたメソッド・スタブ
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Departments");
		List<Departments> deptList = query.list();
		session.close();
 		return deptList;
	}

}
