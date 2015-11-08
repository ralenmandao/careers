package com.boot.data.repository;

import java.io.Serializable;
import java.util.List;

import com.boot.data.entity.EntityObject;

public interface BaseRepository<T extends EntityObject,PK extends Serializable>{
	public void add(T t);
	public T get(PK pk);
	public void addAll(List<T> lst);
	public void remove(PK pk);
	public List<T> getAll();
}
