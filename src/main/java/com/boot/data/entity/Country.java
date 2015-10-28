package com.boot.data.entity;

import java.util.List;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class Country implements EntityObject{
	private long countryId;
	private String name;
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
