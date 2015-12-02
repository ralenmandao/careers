package com.boot.data.service

import com.boot.data.entity.State

interface StateService extends BaseService<State, Long>{
	List<State> getAllByCountryId(Long country)
}
