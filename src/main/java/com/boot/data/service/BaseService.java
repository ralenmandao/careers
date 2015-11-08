package com.boot.data.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import com.boot.data.entity.EntityObject;

public interface BaseService<T extends EntityObject, ID extends Serializable> {
	public void add(T t);
	public T get(ID id);
	public void addAll(List<T> lst);
	public void remove(ID id);
	public List<T> getAll();
	public void update(T t);
}
