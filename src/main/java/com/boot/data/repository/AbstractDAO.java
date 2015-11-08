package com.boot.data.repository;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDAO<PK extends Serializable, T> {
	private final Class<T> persistentClass;
	
	@SuppressWarnings("unchecked")
	public AbstractDAO(){
		this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	}
	
	@Autowired
    private SessionFactory sessionFactory;
 
    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
 
    @SuppressWarnings("unchecked")
    public T getByKey(PK key) {
        return (T) getSession().get(persistentClass, key);
    }
 
    public void persist(T entity) {
        getSession().persist(entity);
    }
 
    public void delete(T entity) {
        getSession().delete(entity);
    }
    
    public void save(T entity){
    	getSession().save(entity);
    }
     
    abstract protected String getTableName();
    
    // TODO get a clean solution
    public void delete(PK id){
    	getSession().createSQLQuery("delete from " + getTableName() + " where " + getIdColumnName() + " = " + id)
    		//.setParameter(0, id)
    		.executeUpdate();
    }
    
    protected Criteria createEntityCriteria(){
        return getSession().createCriteria(persistentClass);
    }
    
    abstract protected String getIdColumnName();
    
    @SuppressWarnings("unchecked")
	public T get(PK id){
    	Criteria crit = createEntityCriteria();
    	crit.add(Restrictions.eq(getIdColumnName(), id));
    	return (T) crit.uniqueResult();
    }
    
    public List<T> getAll(){
    	Criteria crit = createEntityCriteria();
    	return crit.list();
    }
}
