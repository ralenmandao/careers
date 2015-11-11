package com.boot.data.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name="country")
public class Country implements EntityObject{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long countryId;
	@Column(name="countryName")
	private String name;
	
	@OneToMany(mappedBy="country")
	@PrimaryKeyJoinColumn
	private List<State> states;
	
	public long getCountryId() {
		return countryId;
	}
	public void setCountryId(long countryId) {
		this.countryId = countryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public List<State> getStates() {
		return states;
	}
	public void setStates(List<State> states) {
		this.states = states;
	}
	@Override
	public int hashCode(){
		return HashCodeBuilder.reflectionHashCode(this, "countryId");
	}
	
	
	
	@Override
	public String toString(){
		return new ToStringBuilder(this).append("countryId", countryId)
					.append("name", name)
					.append("states", states)
					.build();
	}
	
	@Override
	public boolean equals(Object that){
		return EqualsBuilder.reflectionEquals(this, that, "countryId", "name");
	}
}
