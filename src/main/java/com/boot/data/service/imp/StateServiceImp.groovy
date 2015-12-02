package com.boot.data.service.imp

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

import com.boot.data.entity.State
import com.boot.data.repository.StateRepo
import com.boot.data.service.StateService

@Service
class StateServiceImp implements StateService{

	@Autowired
	StateRepo stateRepo
	
	@Override
	public void add(State t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public State get(Long pk) {
		stateRepo.get(pk) as State
	}

	@Override
	public void addAll(List<State> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<State> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(State t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<State> getAllByCountryId(Long country) {
		stateRepo.getAllByCountryId(country) as List<State>
	}

}
