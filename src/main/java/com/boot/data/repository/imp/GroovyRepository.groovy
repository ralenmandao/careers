package com.boot.data.repository.imp

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Component

import com.boot.data.entity.Employer
import com.boot.data.entity.EmployerG
import com.boot.data.jdbc.GroovyOperations


@Component
class GroovyRepository {
	@Autowired
	@Qualifier("GO")
	GroovyOperations GO;
	
	List<Employer> getAllEmployer(){
		def m = { employer ->
			employers << new EmployerG(id: employer.id, name: employer.name)
		}
		GO.select("""SELECT * FROM employer""", m)
	}
}
