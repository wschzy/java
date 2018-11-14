package com.sweet.datasource;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@Configuration // ×¢²áµ½springbootÈÝÆ÷ÖÐ
@MapperScan(basePackages = "com.sweet.hzy.mapper", sqlSessionFactoryRef = "hzySqlSessionFactory")
public class DataSourcehzyConfig {

	@Bean(name = "hzyDataSource")
	@ConfigurationProperties(prefix = "spring.datasource.hzy")
	public DataSource testDataSource() {
		return DataSourceBuilder.create().build();
	}

	@Bean(name = "hzySqlSessionFactory")
	public SqlSessionFactory testSqlSessionFactory(@Qualifier("hzyDataSource") DataSource dataSource)
			throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		// bean.setMapperLocations( new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mapper/hzy/*.xml"));

		return bean.getObject();
	}

	@Bean(name = "hzyTransactionManager")
	public DataSourceTransactionManager testTransactionManager(@Qualifier("hzyDataSource") DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

	@Bean(name = "hzySqlSessionTemplate")
	public SqlSessionTemplate testSqlSessionTemplate(
			@Qualifier("hzySqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
