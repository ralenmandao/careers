package com.boot.data.repository;

import java.io.Serializable;

import com.boot.data.entity.Employee;
import com.boot.data.entity.EntityObject;

public abstract class EmployeeRepository<T extends EntityObject, PK extends Serializable> extends AbstractDAO<T, PK> {

}
