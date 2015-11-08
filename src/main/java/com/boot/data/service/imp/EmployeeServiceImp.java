package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Employee;
import com.boot.data.repository.AbstractDAO;
import com.boot.data.repository.imp.EmployeeRepositoryImp;
import com.boot.data.service.EmployeeService;

@Service("serEmployee")
@Transactional
public class EmployeeServiceImp implements EmployeeService{

	@Autowired
	@Qualifier("repEmployee")
	private EmployeeRepositoryImp repEmeployee;
	
	@Override
	public void add(Employee t) {
		repEmeployee.save(t);
	}

	@Override
	public void addAll(List<Employee> lst) {
		lst.forEach(e -> repEmeployee.save(e));
	}

	@Override
	public void remove(Long id) {
		repEmeployee.delete(id);
	}

	@Override
	public void update(Employee t) {
		repEmeployee.persist(t);
	}

	@Override
	public Employee get(Long id) {
		return repEmeployee.get(id);
	}

	@Override
	public List<Employee> getAll() {
		return repEmeployee.getAll();
	}

}
