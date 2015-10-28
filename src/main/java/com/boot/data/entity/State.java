package com.boot.data.entity;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class State implements EntityObject{
	private long entityId;
	private String name;
	
	public long getEntityId() {
		return entityId;
	}
	public void setEntityId(long entityId) {
		this.entityId = entityId;
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
			.append("entityId", entityId)
			.append("name", name)
			.build();
	}
	
	@Override
	public int hashCode(){
		return HashCodeBuilder.reflectionHashCode(this, "entityId", "name");
	}
	
	@Override
	public boolean equals(Object that){
		return EqualsBuilder.reflectionEquals(this, that, "entityId");
	}
}
