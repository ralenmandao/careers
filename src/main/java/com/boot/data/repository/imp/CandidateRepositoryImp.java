package com.boot.data.repository.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public CandidateRepositoryImp(){
		setupRepository();
	}
	
	@PostConstruct
	@Override
	public void setupRepository() {
		final Candidate candidate1 = new Candidate();
		candidate1.setCandidateId(candidateId++);
		candidate1.setFirstName("Ralen");
		candidate1.setLastName("Mandap");
		candidate1.setEmail("candidate@yahoo.com");
		candidate1.setUserId(1);
		
		final Candidate candidate2 = new Candidate();
		candidate2.setCandidateId(candidateId++);
		candidate2.setFirstName("Rafael");
		candidate2.setLastName("Manuel");
		candidate2.setUserId(2);
		
		final Candidate candidate3 = new Candidate();
		candidate3.setCandidateId(candidateId++);
		candidate3.setFirstName("Judith");
		candidate3.setLastName("Dela Cruz");
		candidate3.setUserId(3);
		
		candidates.put(candidate1.getCandidateId(), candidate1);
		candidates.put(candidate2.getCandidateId(), candidate2);
		candidates.put(candidate3.getCandidateId(), candidate3);
	}

	@Override
	public Candidate update(Long id, Map<String, Object> keyValues) throws RecordNotFound {
		return null;
	}

	@Override
	public long count() {
		return candidates.size();
	}

	@Override
	public void delete(Long arg0) throws RecordNotFound {
		if(candidates.containsKey(arg0)){
			candidates.remove(arg0);
		}else{
			throw new RecordNotFound("Cannot find candidate with ID " + arg0);
		}
	}

	@Override
	public void delete(Candidate arg0) throws RecordNotFound {
		delete(arg0.getCandidateId());
	}

	@Override
	public void delete(Iterable<? extends Candidate> targets) {
		targets.forEach(e -> {
			try {
				delete(e);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		});
	}

	@Override
	public void deleteAll() {
		candidates.clear();
	}

	@Override
	public boolean exists(Long arg0) {
		return candidates.containsKey(arg0);
	}

	@Override
	public Iterable<? extends Candidate> findAll() {
		return candidates.values();
	}

	@Override
	public Iterable<? extends Candidate> findAll(Iterable<Long> targets) {
		final List<Candidate> c = new ArrayList<Candidate>();
		targets.forEach(key -> {
			Candidate candidate = candidates.get(key);
			if(candidate != null) c.add(candidate);
		});
		return c;
	}

	@Override
	public Candidate findOne(Long arg0) {
		return candidates.get(arg0);
	}

	@Override
	public <S extends Candidate> S save(S candidate) {
		candidate.setCandidateId(candidateId++);
		candidates.put(candidate.getCandidateId(), candidate);
		return candidate;
	}

	@Override
	public <S extends Candidate> Iterable<S> save(Iterable<S> targets) {
		targets.forEach(c -> {
			save(c);
		});
		return targets;
	}

	@Override
	public Candidate findByUserId(Long userId) {
		Iterator<Candidate> i = candidates.values().iterator();
		while(i.hasNext()){
			Candidate candidate = i.next();
			if(candidate.getUserId() == userId){
				return candidate;
			}
		}
		return null;
	}

	@Override
	public Candidate update(Candidate object, Map<String, Object> keyValues) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Candidate findByEmail(String email) {
		Iterator<Candidate> i = candidates.values().iterator();
		while(i.hasNext()){
			Candidate candidate = i.next();
			if(candidate.getEmail().equals(email)) return candidate;
		}
		return null;
	}

}
