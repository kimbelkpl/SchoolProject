package com.java.plyd.service;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

@Service
public class SpringBeanFactory implements ApplicationContextAware {

	/**
	 * Application Context.
	 */
	private static ApplicationContext CONTEXT;


	/**
	 * <p>
	 * Set <code>ApplicationContext</code> of .
	 * </p>
	 * 
	 * @param commandName
	 *            : A <code>String<code> value of commandName.
	 */
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		CONTEXT = context;
	}


	public static Object getBean(String beanName) {
		return CONTEXT.getBean(beanName);
	}

}
