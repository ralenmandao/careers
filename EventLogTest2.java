package io.exigence.dataaccesscomponents;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;

import com.fasterxml.jackson.databind.node.ObjectNode;

import io.exigence.dataaccesscomponents.entity.EventAnalysis;
import io.exigence.dataaccesscomponents.entity.EventClientCommunication;
import io.exigence.dataaccesscomponents.entity.EventClientFeedback;
import io.exigence.dataaccesscomponents.entity.EventEscalation;
import io.exigence.dataaccesscomponents.entity.EventFix;
import io.exigence.dataaccesscomponents.entity.EventLog;
import io.exigence.dataaccesscomponents.entity.EventManualExecution;
import io.exigence.dataaccesscomponents.entity.EventStatus;
import io.exigence.dataaccesscomponents.entity.EventWorkflow;
import io.exigence.dataaccesscomponents.entity.Manual;
import io.exigence.dataaccesscomponents.entity.Service;
import io.exigence.dataaccesscomponents.entity.Workflow;

public class EventLogTest2 extends ApplicationTest{
	private String URL;
	private String findByTimestampBeforeURL;
	private String findByTimestampAfterURL;
	private String findByTimestampBetweenURL;

	@Before
	public void init() {
		URL = BASE_URL + "/events/1/logs";
		String search = URL + "/search/";
		findByTimestampBeforeURL = search + "findByTimestampBefore?";
		findByTimestampAfterURL = search + "findByTimestampAfter?";
		findByTimestampBetweenURL = search + "findByTimestampBetween?";
	}
	
	@Test
	public void addEventLogTest() {
		EventLog entity = new EventLog(1, 100, 
				new EventAnalysis(1, new Service("ralen", 1), "awe", 1, 1, 1, 1), 
				new EventFix("desc", "resc", 1, 1, 2, 2), 
				new EventClientFeedback(1, "ralen", "good", 100, 1, 1), 
				new EventWorkflow(1, new Workflow("work", 1), 1, 2, 2),
				new EventClientCommunication(1, 1, "mes", "ralen", 1, 1, 2, 2), 
				new EventManualExecution(1, new Manual("ralen", "http", 1), 1, 1, 1, 1, 1), 
				new EventEscalation(1, 1, "ralen", 1, 1), 
				new EventStatus(1, 1, 100, 1));
		
		ObjectNode node = restTemplate.postForObject(URL, entity, ObjectNode.class);

		assertNotNull(node);
		int id = node.get("id").asInt();
		EventLog result = eventLogRepo.findOne(id);
		assertNotNull(result);
		assertEquals(entity.getEventAnalysis().getFindings(), result.getEventAnalysis().getFindings());
		assertEquals(entity.getEventAnalysis().getDoneByUserId(), result.getEventAnalysis().getDoneByUserId());
		assertEquals(entity.getEventAnalysis().getEndTime(), result.getEventAnalysis().getEndTime());
		assertEquals(entity.getEventAnalysis().getEventId(), result.getEventAnalysis().getEventId());
		assertEquals(entity.getEventAnalysis().getReportedByUserId(), result.getEventAnalysis().getReportedByUserId());
		assertEquals(entity.getEventAnalysis().getService().getCustomerId(), result.getEventAnalysis().getService().getCustomerId());
		assertEquals(entity.getEventAnalysis().getService().getName(), result.getEventAnalysis().getService().getName());
		assertEquals(entity.getEventAnalysis().getStartTime(), result.getEventAnalysis().getStartTime());
		assertEquals(entity.getEventClientCommunication().getClientCommunicationTypeId(), result.getEventClientCommunication().getClientCommunicationTypeId());
		assertEquals(entity.getEventClientCommunication().getClientName(), result.getEventClientCommunication().getClientName());
		assertEquals(entity.getEventClientCommunication().getDoneByUserId(), result.getEventClientCommunication().getDoneByUserId());
		assertEquals(entity.getEventClientCommunication().getEndTime(), result.getEventClientCommunication().getEndTime());
		assertEquals(entity.getEventClientCommunication().getEventId(), result.getEventClientCommunication().getEventId());
		assertEquals(entity.getEventClientCommunication().getMessage(), result.getEventClientCommunication().getMessage());
		assertEquals(entity.getEventClientCommunication().getReportedByUserId(), result.getEventClientCommunication().getReportedByUserId());
		assertEquals(entity.getEventClientCommunication().getStartTime(), result.getEventClientCommunication().getStartTime());
		assertEquals(entity.getEventEscalation().getDoneByUserId(), result.getEventEscalation().getDoneByUserId());
		assertEquals(entity.getEventEscalation().getEventId(), result.getEventEscalation().getEventId());
		assertEquals(entity.getEventEscalation().getName(), result.getEventEscalation().getName());
		assertEquals(entity.getEventEscalation().getReportedByUserId(), result.getEventEscalation().getReportedByUserId());
		assertEquals(entity.getEventEscalation().getTimestamp(), result.getEventEscalation().getTimestamp());
		assertEquals(entity.getEventFix().getDescription(), result.getEventFix().getDescription());
		assertEquals(entity.getEventFix().getDoneByUserId(), result.getEventFix().getDoneByUserId());
		assertEquals(entity.getEventFix().getEndTime(), result.getEventFix().getEndTime());
		assertEquals(entity.getEventFix().getReportedByUserId(), result.getEventFix().getReportedByUserId());
		assertEquals(entity.getEventFix().getResult(), result.getEventFix().getResult());
		assertEquals(entity.getEventFix().getStartTime(), result.getEventFix().getStartTime());
		assertEquals(entity.getEventManualExecution().getDoneByUserId(), result.getEventManualExecution().getDoneByUserId());
		assertEquals(entity.getEventManualExecution().getEndTime(), result.getEventManualExecution().getEndTime());
		assertEquals(entity.getEventManualExecution().getEventId(), result.getEventManualExecution().getEventId());
		assertEquals(entity.getEventManualExecution().getManual().getName(), result.getEventManualExecution().getManual().getName());
		assertEquals(entity.getEventManualExecution().getManual().getUrl(), result.getEventManualExecution().getManual().getUrl());
		assertEquals(entity.getEventManualExecution().getManual().getCustomerId(), result.getEventManualExecution().getManual().getCustomerId());
		assertEquals(entity.getEventManualExecution().getManualExecutionResultId(), result.getEventManualExecution().getManualExecutionResultId());
		assertEquals(entity.getEventManualExecution().getReportedByUserId(), result.getEventManualExecution().getReportedByUserId());
		assertEquals(entity.getEventManualExecution().getStartTime(), result.getEventManualExecution().getStartTime());
		assertEquals(entity.getEventStatus().getDoneByUserId(), result.getEventStatus().getDoneByUserId());
		assertEquals(entity.getEventStatus().getEventId(), result.getEventStatus().getEventId());
		assertEquals(entity.getEventStatus().getEventStatusTypeId(), result.getEventStatus().getEventStatusTypeId());
		assertEquals(entity.getEventStatus().getTimestamp(), result.getEventStatus().getTimestamp());
		assertEquals(entity.getEventWorkflow().getEndTime(), result.getEventWorkflow().getEndTime());
		assertEquals(entity.getEventWorkflow().getEventId(), result.getEventWorkflow().getEventId());
		assertEquals(entity.getEventWorkflow().getEventManagerUserId(), result.getEventWorkflow().getEventManagerUserId());
		assertEquals(entity.getEventWorkflow().getStartTime(), result.getEventWorkflow().getStartTime());
		assertEquals(entity.getEventWorkflow().getWorkflow().getCustomerId(), result.getEventWorkflow().getWorkflow().getCustomerId());
		assertEquals(entity.getEventWorkflow().getWorkflow().getName(), result.getEventWorkflow().getWorkflow().getName());
	}

	@Test
	public void editEventLogTest() {
		EventLog entity = new EventLog(2, 500, 
				new EventAnalysis(2, new Service("awwasds", 1), "awe", 1, 1, 1, 1), 
				new EventFix(2,"daw", "resc", 1, 1, 2, 2), 
				new EventClientFeedback(2, "awdawdsad", "good", 100, 1, 1), 
				new EventWorkflow(2, new Workflow("awdawsd", 1), 1, 2, 2),
				new EventClientCommunication(2, 1, "awdawdas", "ralen", 1, 1, 2, 2), 
				new EventManualExecution(2, new Manual("awdaws", "http", 1), 1, 1, 1, 1, 1), 
				new EventEscalation(2, 1, "dddddd", 1, 1), 
				new EventStatus(2, 1, 100, 1));
		
		restTemplate.put(BASE_URL + "/events/" + entity.getEventId() + "/logs/" + 2, entity);

		EventLog result = eventLogRepo.findOne(2);
		assertNotNull(result);
		assertEquals(entity.getEventAnalysis().getFindings(), result.getEventAnalysis().getFindings());
		assertEquals(entity.getEventAnalysis().getDoneByUserId(), result.getEventAnalysis().getDoneByUserId());
		assertEquals(entity.getEventAnalysis().getEndTime(), result.getEventAnalysis().getEndTime());
		assertEquals(entity.getEventAnalysis().getEventId(), result.getEventAnalysis().getEventId());
		assertEquals(entity.getEventAnalysis().getReportedByUserId(), result.getEventAnalysis().getReportedByUserId());
		assertEquals(entity.getEventAnalysis().getService().getCustomerId(), result.getEventAnalysis().getService().getCustomerId());
		assertEquals(entity.getEventAnalysis().getService().getName(), result.getEventAnalysis().getService().getName());
		assertEquals(entity.getEventAnalysis().getStartTime(), result.getEventAnalysis().getStartTime());
		assertEquals(entity.getEventClientCommunication().getClientCommunicationTypeId(), result.getEventClientCommunication().getClientCommunicationTypeId());
		assertEquals(entity.getEventClientCommunication().getClientName(), result.getEventClientCommunication().getClientName());
		assertEquals(entity.getEventClientCommunication().getDoneByUserId(), result.getEventClientCommunication().getDoneByUserId());
		assertEquals(entity.getEventClientCommunication().getEndTime(), result.getEventClientCommunication().getEndTime());
		assertEquals(entity.getEventClientCommunication().getEventId(), result.getEventClientCommunication().getEventId());
		assertEquals(entity.getEventClientCommunication().getMessage(), result.getEventClientCommunication().getMessage());
		assertEquals(entity.getEventClientCommunication().getReportedByUserId(), result.getEventClientCommunication().getReportedByUserId());
		assertEquals(entity.getEventClientCommunication().getStartTime(), result.getEventClientCommunication().getStartTime());
		assertEquals(entity.getEventEscalation().getDoneByUserId(), result.getEventEscalation().getDoneByUserId());
		assertEquals(entity.getEventEscalation().getEventId(), result.getEventEscalation().getEventId());
		assertEquals(entity.getEventEscalation().getName(), result.getEventEscalation().getName());
		assertEquals(entity.getEventEscalation().getReportedByUserId(), result.getEventEscalation().getReportedByUserId());
		assertEquals(entity.getEventEscalation().getTimestamp(), result.getEventEscalation().getTimestamp());
		assertEquals(entity.getEventFix().getDescription(), result.getEventFix().getDescription());
		assertEquals(entity.getEventFix().getDoneByUserId(), result.getEventFix().getDoneByUserId());
		assertEquals(entity.getEventFix().getEndTime(), result.getEventFix().getEndTime());
		assertEquals(entity.getEventFix().getEventId(), result.getEventFix().getEventId());
		assertEquals(entity.getEventFix().getReportedByUserId(), result.getEventFix().getReportedByUserId());
		assertEquals(entity.getEventFix().getResult(), result.getEventFix().getResult());
		assertEquals(entity.getEventFix().getStartTime(), result.getEventFix().getStartTime());
		assertEquals(entity.getEventManualExecution().getDoneByUserId(), result.getEventManualExecution().getDoneByUserId());
		assertEquals(entity.getEventManualExecution().getEndTime(), result.getEventManualExecution().getEndTime());
		assertEquals(entity.getEventManualExecution().getEventId(), result.getEventManualExecution().getEventId());
		assertEquals(entity.getEventManualExecution().getManual().getName(), result.getEventManualExecution().getManual().getName());
		assertEquals(entity.getEventManualExecution().getManual().getUrl(), result.getEventManualExecution().getManual().getUrl());
		assertEquals(entity.getEventManualExecution().getManual().getCustomerId(), result.getEventManualExecution().getManual().getCustomerId());
		assertEquals(entity.getEventManualExecution().getManualExecutionResultId(), result.getEventManualExecution().getManualExecutionResultId());
		assertEquals(entity.getEventManualExecution().getReportedByUserId(), result.getEventManualExecution().getReportedByUserId());
		assertEquals(entity.getEventManualExecution().getStartTime(), result.getEventManualExecution().getStartTime());
		assertEquals(entity.getEventStatus().getDoneByUserId(), result.getEventStatus().getDoneByUserId());
		assertEquals(entity.getEventStatus().getEventId(), result.getEventStatus().getEventId());
		assertEquals(entity.getEventStatus().getEventStatusTypeId(), result.getEventStatus().getEventStatusTypeId());
		assertEquals(entity.getEventStatus().getTimestamp(), result.getEventStatus().getTimestamp());
		assertEquals(entity.getEventWorkflow().getEndTime(), result.getEventWorkflow().getEndTime());
		assertEquals(entity.getEventWorkflow().getEventId(), result.getEventWorkflow().getEventId());
		assertEquals(entity.getEventWorkflow().getEventManagerUserId(), result.getEventWorkflow().getEventManagerUserId());
		assertEquals(entity.getEventWorkflow().getStartTime(), result.getEventWorkflow().getStartTime());
		assertEquals(entity.getEventWorkflow().getWorkflow().getCustomerId(), result.getEventWorkflow().getWorkflow().getCustomerId());
		assertEquals(entity.getEventWorkflow().getWorkflow().getName(), result.getEventWorkflow().getWorkflow().getName());
	}

	@Test
	public void deleteEventLogTest() {
		restTemplate.delete(BASE_URL + "/events/1/logs/3");
		assertEquals(true, eventLogRepo.exists(3));
	}
	
	@Test
	public void viewEventLogTest(){
		ObjectNode objectNode = restTemplate.getForObject(URL, ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 1);
		assertEquals(objectNode.findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventEscalation").findValue("name").asText(), "esc1");
		assertEquals(objectNode.findValue("eventEscalation").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventEscalation").findValue("timestamp").asInt(), 100);
		assertEquals(objectNode.findValue("eventEscalation").findValue("eventId").asInt(), 1);
		assertEquals(objectNode.findValue("eventEscalation").findValue("doneBy").findValue("id").asInt(), 8);
		assertEquals(objectNode.findValue("eventEscalation").findValue("reportedBy").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventClientFeedback").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventClientFeedback").findValue("timestamp").asInt(), 100);
		assertEquals(objectNode.findValue("eventClientFeedback").findValue("doneBy").findValue("id").asInt(), 10);
		assertEquals(objectNode.findValue("eventClientFeedback").findValue("reportedBy").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventClientCommunication").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventClientCommunication").findValue("startTime").asInt(), 100);
		assertEquals(objectNode.findValue("eventClientCommunication").findValue("endTime").asInt(), 200);
		assertEquals(objectNode.findValue("eventClientCommunication").findValue("doneBy").findValue("id").asInt(), 2);
		assertEquals(objectNode.findValue("eventClientCommunication").findValue("reportedBy").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventManualExecution").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventManualExecution").findValue("startTime").asInt(), 100);
		assertEquals(objectNode.findValue("eventManualExecution").findValue("endTime").asInt(), 200);
		assertEquals(objectNode.findValue("eventManualExecution").findValue("manual").findValue("name").asText(), "Ralen1");
		assertEquals(objectNode.findValue("eventManualExecution").findValue("manual").findValue("url").asText(), "URL1");
		assertEquals(objectNode.findValue("eventManualExecution").findValue("manual").findValue("customerId").asInt(), 1);
		assertEquals(objectNode.findValue("eventManualExecution").findValue("doneBy").findValue("id").asInt(), 5);
		assertEquals(objectNode.findValue("eventManualExecution").findValue("reportedBy").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventWorkflow").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventWorkflow").findValue("startTime").asInt(), 100);
		assertEquals(objectNode.findValue("eventWorkflow").findValue("endTime").asInt(), 200);
		assertEquals(objectNode.findValue("eventWorkflow").findValue("eventManagerUser").findValue("firstName").asText(), "user1");
		assertEquals(objectNode.findValue("eventWorkflow").findValue("eventManagerUser").findValue("lastName").asText(), "user1");
		assertEquals(objectNode.findValue("eventWorkflow").findValue("eventManagerUser").findValue("awsCognitoId").asText(), "user1");
		assertEquals(objectNode.findValue("eventWorkflow").findValue("eventManagerUser").findValue("email").asText(), "user1");
		assertEquals(objectNode.findValue("eventWorkflow").findValue("eventManagerUser").findValue("slackName").asText(), "user1");
		assertEquals(objectNode.findValue("eventWorkflow").findValue("eventManagerUser").findValue("position").asText(), "user1");
		assertEquals(objectNode.findValue("eventStatus").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventStatus").findValue("timestamp").asInt(), 100);
		assertEquals(objectNode.findValue("eventStatus").findValue("eventId").asInt(), 1);
		assertEquals(objectNode.findValue("eventStatus").findValue("doneBy").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventStatus").findValue("statusType").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventFix").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventFix").findValue("result").asText(), "result1");
		assertEquals(objectNode.findValue("eventFix").findValue("startTime").asInt(), 100);
		assertEquals(objectNode.findValue("eventFix").findValue("description").asText(), "eventFix1");
		assertEquals(objectNode.findValue("eventFix").findValue("endTime").asInt(), 200);
		assertEquals(objectNode.findValue("eventFix").findValue("doneBy").findValue("id").asInt(), 5);
		assertEquals(objectNode.findValue("eventFix").findValue("reportedBy").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventAnalysis").findValue("id").asInt(), 1);
		assertEquals(objectNode.findValue("eventAnalysis").findValue("startTime").asInt(), 100);
		assertEquals(objectNode.findValue("eventAnalysis").findValue("endTime").asInt(), 200);
		assertEquals(objectNode.findValue("eventAnalysis").findValue("eventId").asInt(), 1);
		assertEquals(objectNode.findValue("eventAnalysis").findValue("findings").asText(), "COOL");
		assertEquals(objectNode.findValue("eventAnalysis").findValue("doneBy").findValue("id").asInt(), 5);
		assertEquals(objectNode.findValue("eventAnalysis").findValue("reportedBy").findValue("id").asInt(), 1);
	}
	
	@Test
	public void findByTimestampBeforeTest() {
		ObjectNode objectNode = restTemplate.getForObject(findByTimestampBeforeURL + "time=500", ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 1);
	}
	
	@Test
	public void findByTimestampBeforeTest2() {
		ObjectNode objectNode = restTemplate.getForObject(findByTimestampBeforeURL + "time=20", ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 0);
	}
	
	@Test
	public void findByTimestampAfterTest() {
		ObjectNode objectNode = restTemplate.getForObject(findByTimestampAfterURL + "time=20", ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 1);
	}
	
	@Test
	public void findByTimestampAfterTest2() {
		ObjectNode objectNode = restTemplate.getForObject(findByTimestampAfterURL + "time=400", ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 1);
	}
	
	@Test
	public void findByTimestampBetweenTest() {
		ObjectNode objectNode = restTemplate.getForObject(findByTimestampBetweenURL + "startTime=10&endTime=200", ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 1);
	}
	
	@Test
	public void findByTimestampBetweenTest2() {
		ObjectNode objectNode = restTemplate.getForObject(findByTimestampBetweenURL + "startTime=102&endTime=200", ObjectNode.class);
		assertEquals(objectNode.findValue("totalPages").asInt(), 0);
	}
}
