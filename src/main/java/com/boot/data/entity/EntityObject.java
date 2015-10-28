package com.boot.data.entity;

/**
 * Proxy interface for all the concrete
 * entities to extend from.
 *
 * @author: Y Kamesh Rao
 * @created: 4/7/12 11:56 AM
 * @company: &copy; 2012, Kaleidosoft Labs
 */
public interface EntityObject {
	public boolean equals(Object that);
	public int hashCode();
}
