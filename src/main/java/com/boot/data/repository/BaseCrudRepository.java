package com.boot.data.repository;

import com.boot.data.entity.EntityObject;
import com.boot.exception.repository.RecordNotFound;

import java.io.Serializable;
import java.util.Map;

/**
 * To add framework level elements to the vanilla
 * Repository provided by spring data.
 *
 * @author: Y Kamesh Rao
 * @created: 3/25/12 10:40 PM
 * @company: &copy; 2012, Kaleidosoft Labs
 */
public interface BaseCrudRepository<T extends EntityObject, ID extends Serializable>{
    /**
     * Method to be implemented for providing the
     * repository with needed external resources
     */
    public void setupRepository();

    /**
     * Method to update the given key value pairs
     * in the object with the given ID
     *
     * @param id
     * @param keyValues
     * @return
     * @throws RecordNotFound 
     */
    public T update(ID id, Map<String, Object> keyValues) throws RecordNotFound;


    /**
     * Method to update the given key value pairs
     * in the given object
     *
     * @param object
     * @param keyValues
     * @return
     */
    public T update(T object, Map<String, Object> keyValues);
    
    /**
     * Method to count all the records
     * 
     * @return total number of records
     */
	public long count();
	
	/**
	 * Method to delete record using its ID
	 * 
	 * @param ID of record
	 * @return
	 * @throws RecordNotFound 
	 */
	public void delete(ID arg0) throws RecordNotFound;
	
	/**
	 * Method to delete a record
	 * 
	 * @param object of the record to delete
	 * @return
	 * @throws RecordNotFound 
	 */
	public void delete(T arg0) throws RecordNotFound;
	
	/**
	 * Delete multiple records
	 * 
	 * @param objects to delete
	 * @return
	 */
	public void delete(Iterable<? extends T> arg0);
	
	/**
	 * Delete all records
	 * 
	 * @return
	 */
	public void deleteAll();
	
	/**
	 * Check if the records exist using its ID
	 * 
	 * @param id of the record
	 * @return 
	 */
	public boolean exists(ID arg0) ;

	/**
	 * Fetch all the records
	 * 
	 * @return all the records
	 */
	public Iterable<? extends T> findAll() ;
	
	/**
	 * Fetch all the records using their ID
	 * 
	 * @return users with the given id
	 */
	public Iterable<? extends T> findAll(Iterable<Long> arg0);
	
	/**
	 * Find a single record using its ID
	 * 
	 * @param records ID
	 * @return record's object
	 */
	public <S extends T>S findOne(ID arg0);

	/**
	 * Save object to the records
	 * @param object
	 * @return record's object
	 */
	public <S extends T> S save(S user);
	
	/**
	 * Save
	 * @param arg0
	 * @return
	 */
	public <S extends T> Iterable<S> save(Iterable<S> arg0);
}
