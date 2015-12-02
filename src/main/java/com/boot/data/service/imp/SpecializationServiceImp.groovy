package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.Specialization
import com.boot.data.repository.SpecializationRepo
import com.boot.data.service.SpecializationService

@Service
class SpecializationServiceImp implements SpecializationService{

	@Autowired
	SpecializationRepo specializationRepo
	
	@Override
	public void add(Specialization t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Specialization get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Specialization> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Specialization> getAll() {
		specializationRepo.getAll()
	}

	@Override
	public void update(Specialization t) {
		// TODO Auto-generated method stub
		
	}

}
