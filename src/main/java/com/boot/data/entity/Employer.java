package com.boot.data.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name="employer")
public class Employer implements EntityObject{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long employerId;
//	
//	@OneToMany(mappedBy="employer")
//	@PrimaryKeyJoinColumn
//	private List<Employee> employees;
	
	private String name;
	public long getEmployerId() {
		return employerId;
	}
	public void setEmployerId(long employerId) {
		this.employerId = employerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString(){
		return new ToStringBuilder(this)
			.append("employeeId", employerId)
			.append("name", name)
			.build();
	}
}
