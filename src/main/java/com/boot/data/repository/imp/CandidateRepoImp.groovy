package com.boot.data.repository.imp

import groovy.sql.Sql

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Repository

import com.boot.data.entity.Candidate
import com.boot.data.entity.FieldOfStudy
import com.boot.data.entity.Location
import com.boot.data.entity.Qualification
import com.boot.data.entity.Specialization
import com.boot.data.entity.User
import com.boot.data.repository.CandidateRepo

@Repository
class CandidateRepoImp implements CandidateRepo{

	@Autowired
	Sql sql
	
	def convertToCandidate = { t ->
		return new Candidate(candidateId: t.candidateId, firstName: t.firstName, lastName: t.lastName, contactNo: t.contactNo,
			title: t.title, user: new User(userId: t.userId), birthdate: t.birthdate, location: new Location(locationId:t.locationId),
			specialization: new Specialization(specializationId: t.specializationId), qualification: new Qualification(qualificationId: t.qualificationId),
			expectedSalary: t.expectedSalary, field: new FieldOfStudy(fieldId: t.fieldId))
	}
	
	@Override
	public void add(Candidate t) {
		sql.execute("""
			INSERT INTO candidate
			VALUES(?,?,?,?,?,?,?,?,?,?,?,?)
		""", [null,t.firstName, t.lastName, t.contactNo, t.title, t?.user?.userId, t.birthdate, t?.location?.locationId,
			  t?.specialization?.specializationId, t?.qualification?.qualificationId, t.expectedSalary, t?.field?.fieldId])
	}

	@Override
	public Candidate get(Long pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAll(List<Candidate> lst) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Long pk) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Candidate> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Candidate t) {
		sql.executeUpdate("""UPDATE candidate SET firstName=${t.firstName}, lastName=${t.lastName},contactNo=${t.contactNo},
							title=${t.title},userId=${t?.user?.userId},birthdate=${t.birthdate},locationId=${t?.location?.locationId},
							specializationId=${t?.specialization?.specializationId},qualificationId=${t?.qualification?.qualificationId},
							expectedSalary=${t.expectedSalary},fieldId=${t?.field?.fieldId}
							WHERE candidateId=${t.candidateId}""")
	}

	@Override
	public Candidate findByUserId(Long id) {
		def row = sql.firstRow("SELECT * FROM candidate WHERE userId=${id}")
		if(!row) null
		convertToCandidate row
	}

//	

}
