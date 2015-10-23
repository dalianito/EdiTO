package com.ito.edito.action;

import java.io.IOException;
import java.io.StringWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;

public final class JacksonJsonMapper {

	private static volatile ObjectMapper objectMapper = null;

	private JacksonJsonMapper() {
	}

	public static ObjectMapper getInstance() {
		if (objectMapper == null) {
			synchronized (ObjectMapper.class) {
				objectMapper = new ObjectMapper();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SerializationConfig sc = objectMapper.getSerializationConfig();
				sc.setDateFormat(df);
			}
		}
		return objectMapper;
	}
	
	public static String getJsonFromMap(Map mapObject) {
	    objectMapper = new ObjectMapper();
	    
	    StringWriter sw = new StringWriter();
	    try {
            objectMapper.writeValue(sw, mapObject);
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	    
	    return sw.toString();
	}
}
