package com.boot.data.repository.imp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.boot.data.entity.Candidate;
import com.boot.data.jdbc.DataOperations;
import com.boot.data.repository.CandidateRepository;
import com.boot.data.repository.UserRepository;
import com.boot.exception.repository.RecordNotFound;

@Repository
public class CandidateRepositoryImp implements CandidateRepository{

	@Autowired
	private DataOperations operations;
	@Autowired
	private UserRepository userRepo;
	HashMap<Long, Candidate> candidates = new HashMap<Long, Candidate>();
	private long candidateId = 1;
	
	@Override
	public Candidate findUserById(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Candidate findUserByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private class CandidateRowMapper implements RowMapper<Candidate>{

		@Override
		public Candidate mapRow(ResultSet rs, int row) throws SQLException {
			Candidate candidate = new Candidate();
			
			return null;
		}
		
	}
}
