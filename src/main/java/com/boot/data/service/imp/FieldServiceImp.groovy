package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.FieldOfStudy
import com.boot.data.repository.FieldRepo
import com.boot.data.service.FieldService

@Service
class FieldServiceImp implements FieldService{

	@Autowired
	FieldRepo fieldRepo
	
	@Override
	public void add(FieldOfStudy t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FieldOfStudy get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<FieldOfStudy> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FieldOfStudy> getAll() {
		fieldRepo.getAll()
	}

	@Override
	public void update(FieldOfStudy t) {
		// TODO Auto-generated method stub
		
	}

}
