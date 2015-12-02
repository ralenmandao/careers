package com.boot.data.service.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.Skill
import com.boot.data.repository.SkillRepo
import com.boot.data.service.SkillService

@Service
class SkillServiceImp implements SkillService{
	
	@Autowired
	SkillRepo skillRepo
	
	@Override
	public void add(Skill t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Skill get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Skill> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Skill> getAll() {
		skillRepo.getAll()
	}

	@Override
	public void update(Skill t) {
		// TODO Auto-generated method stub
		
	}

}
