package com.boot.data.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.boot.data.entity.EntityObject;
import com.boot.data.repository.AbstractDAO;

@Component
public abstract class AbstractService<T extends EntityObject, PK extends Serializable> {

	private AbstractDAO<T, PK> dao;

	@PostConstruct
	public void setDao(){
		dao = getRepository();
	}
	
	public abstract AbstractDAO<T, PK> getRepository();


	public List<T> getAll() {
		return (List<T>) dao.getAll();
	}

	public T get(PK id) {
		return dao.get(id);
	}

	public void remove(PK id) {
		dao.delete(id);
	}

	public void remove(T t) {
		dao.delete(t);
	}

	public void update(T t) {
		dao.persist(t);
	}

	public void add(T t) {
		dao.save(t);
	}
}
