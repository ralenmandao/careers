package com.boot.data.repository

import com.boot.data.entity.State

interface StateRepo extends BaseRepository<State, Long>{
	List<State> getAllByCountryId(Long countryId)
}
