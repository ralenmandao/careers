package com.boot.data.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.data.entity.Employer;
import com.boot.data.repository.imp.EmployerRepositoryImp;
import com.boot.data.service.EmployerService;

@Service("serEmployer")
@Transactional
public class EmployerServiceImp implements EmployerService{

	@Autowired
	@Qualifier("repEmployer")
	private EmployerRepositoryImp repEmployer;
	
	@Override
	public void add(Employer t) {
		repEmployer.save(t);
	}

	@Override
	public Employer get(Long id) {
		return repEmployer.get(id);
	}

	@Override
	public void addAll(List<Employer> lst) {
		lst.forEach(e -> repEmployer.save(e));
	}

	@Override
	public void remove(Long id) {
		repEmployer.delete(id);
	}

	@Override
	public List<Employer> getAll() {
		return repEmployer.getAll();
	}

	@Override
	public void update(Employer t) {
		repEmployer.persist(t);
	}
}
