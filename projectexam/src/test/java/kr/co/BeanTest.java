package kr.co;

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BeanTest {
	@Autowired ApplicationContext context;
	@Autowired DataSource ds;
	@Autowired SqlSessionFactoryBean bean;
	
	@Test
	public void contextTest() {
		assertNotNull(context);
	}
	
	@Test
	public void connectionTest() throws SQLException {
		assertNotNull(ds);
		assertNotNull(ds.getConnection());
	}
	@Test
	public void sqlSessionFactoryBeanTest() {
		assertNotNull(bean);
	}
}
