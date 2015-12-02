package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.Qualification
import com.boot.data.repository.QualificationRepo
import com.boot.data.service.QualificationService

@Service
class QualificationServiceImp implements QualificationService{

	@Autowired QualificationRepo qualificationRepo
	
	@Override
	public void add(Qualification t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Qualification get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Qualification> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Qualification> getAll() {
		qualificationRepo.getAll()
	}

	@Override
	public void update(Qualification t) {
		// TODO Auto-generated method stub
		
	}

}
