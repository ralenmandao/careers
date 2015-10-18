package com.boot.data.jdbc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

@Component
public class JdbcOperations implements DataOperations{
	
	private JdbcTemplate template;
	
	public JdbcOperations(){};
	
	@Autowired
	public JdbcOperations(JdbcTemplate template){
		this.template = template;
	}

	@Override
	public long save(PreparedStatementCreator ps) {
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		template.update(ps , keyHolder);
		return (long) keyHolder.getKey();
	}

	@Override
	public Object queryForObject(String sql, Class<?> clazz) {
		final Object object = template.queryForObject(sql, clazz);
		return object;
	}

	@Override
	public <T>T queryForObject(String sql, Object[] args, RowMapper<T> rm) {
		return template.queryForObject(sql, args, rm);
	}

	@Override
	public <T> T queryForObject(String sql, Object[] args, Class<T> type) {
		return template.queryForObject(sql, args, type);
	}
}
