package com.boot;

import java.text.SimpleDateFormat

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component

import com.boot.data.repository.JobRepo

@Component
public class ScheduledTasks {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    @Autowired
    private JobRepo jobRepo;
    
    @Scheduled(fixedRate = 3600000L)
    public void reportCurrentTime() {
		def jobs = jobRepo.findAll()
		jobs.each{
			if(it.expiry <= new Date()){
				it.expired = true
				jobRepo.save(it)
			}
		}
    }
}
