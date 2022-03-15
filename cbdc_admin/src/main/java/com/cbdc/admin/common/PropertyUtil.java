package com.cbdc.admin.common;

import org.springframework.context.ApplicationContext;

import com.cbdc.admin.ApplicationContextServe;

public class PropertyUtil {
	public static String getProperty(String propertyName) {
		return getProperty(propertyName, null);
	}

	public static String getProperty(String propertyName, String defaultValue) {
		String value = defaultValue;
		ApplicationContext applicationContext = ApplicationContextServe.getApplicationContext();
		if (applicationContext.getEnvironment().getProperty(propertyName) == null) {
			//do nothing
		} else {
			//value = applicationContext.getEnvironment().getProperty(propertyName).toString();
			value = applicationContext.getEnvironment().getProperty(propertyName);
		}
		return value;
	}
}
