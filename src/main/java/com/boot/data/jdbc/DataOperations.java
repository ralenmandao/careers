package com.boot.data.jdbc;

import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;

public interface DataOperations {
	public long save(PreparedStatementCreator ps);
	public Object queryForObject(String sql, Class<?> clazz);
	public <T>T queryForObject(String sql, Object[] args, RowMapper<T> rm);
	public <T>T queryForObject(String sql, Object[] args, Class<T> type);
}
