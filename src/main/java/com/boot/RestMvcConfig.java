package com.boot;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

import com.boot.data.entity.Country;
import com.boot.data.entity.State;

@Configuration
public class RestMvcConfig extends RepositoryRestMvcConfiguration{
	@Override
    protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config)
    {
        config.exposeIdsFor(Country.class, State.class);
    }
}
