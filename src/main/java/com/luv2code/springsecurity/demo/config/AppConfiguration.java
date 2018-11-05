package com.luv2code.springsecurity.demo.config;

import java.beans.PropertyVetoException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.luv2code.springsecurity.demo.entity.Authority;
import com.luv2code.springsecurity.demo.entity.InboundDocument;
import com.luv2code.springsecurity.demo.entity.OutboundDocument;
import com.luv2code.springsecurity.demo.entity.User;
import com.luv2code.springsecurity.demo.entity.UsersFilterPerson;
import com.luv2code.springsecurity.demo.entity.UsersFilterType;
import com.mchange.v2.c3p0.ComboPooledDataSource;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages="com.luv2code.springsecurity.demo")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfiguration extends WebMvcConfigurerAdapter{

	@Autowired
	private Environment env;
	
	private Logger logger = Logger.getLogger(getClass().getName());
	
//##################################################################
	@Bean
	public ViewResolver viewResolver() {
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");
		
		return viewResolver;
	}
//###################################################################
	@Bean
	   public DataSource getDataSource() {
	      BasicDataSource dataSource = new BasicDataSource();
	      dataSource.setDriverClassName(env.getProperty("jdbc.driver"));
	      dataSource.setUrl(env.getProperty("jdbc.url"));
	      dataSource.setUsername(env.getProperty("jdbc.user"));
	      dataSource.setPassword(env.getProperty("jdbc.password"));
	      return dataSource;
	   }
	
	   @Bean
	   public LocalSessionFactoryBean getSessionFactory() {
	      LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
	      factoryBean.setDataSource(getDataSource());
	      
	      Properties props=new Properties();
	      props.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
	      props.put("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
	      props.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
	      factoryBean.setHibernateProperties(props);
	      factoryBean.setAnnotatedClasses(User.class,
	    		  						  Authority.class,
	    		  						  InboundDocument.class,
	    		  						  OutboundDocument.class,
	    		  						  UsersFilterType.class,
	    		  						  UsersFilterPerson.class);
	      return factoryBean;
	   }

	   @Bean
	   public HibernateTransactionManager getTransactionManager() {
	      HibernateTransactionManager transactionManager = new HibernateTransactionManager();
	      transactionManager.setSessionFactory(getSessionFactory().getObject());
	      return transactionManager;
	   }
//##################################################################	
	@Bean
	public DataSource securityDataSource() {
		
		ComboPooledDataSource securityDataSource = new ComboPooledDataSource();
		
		try {
			securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}
		
		logger.info("=> jdbc.url= " + env.getProperty("jdbc.url"));
		logger.info("=> jdbc.user= " + env.getProperty("jdbc.user"));
		logger.info("=> jdbc.password= " + env.getProperty("jdbc.password"));
		
		securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		securityDataSource.setUser(env.getProperty("jdbc.user"));
		securityDataSource.setPassword(env.getProperty("jdbc.password"));
		securityDataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
		securityDataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
		securityDataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
		securityDataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));
		
		return securityDataSource;
	}
//##################################################################################################
	@Bean
	public PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}
//##################################################################################################	
//##################################################################################################
	private int getIntProperty(String propName) {
		String propval = env.getProperty(propName);
		int intPropVal = Integer.parseInt(propval);
		return intPropVal;
	}
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/styles/**").addResourceLocations("/WEB-INF/resources/css/").setCachePeriod(31556926);
        registry.addResourceHandler("/scripts/**").addResourceLocations("/WEB-INF/resources/js/").setCachePeriod(31556926);
        registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/resources/images/").setCachePeriod(31556926);
    }
	
	 @SuppressWarnings("unused")
	private MessageSource messageSource() {
	        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
	        messageSource.setBasename("classpath:/ValidationMessages");
	        messageSource.setDefaultEncoding("UTF-8");
	        return messageSource;
	    }
}
