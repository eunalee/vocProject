package com.bitcamp.NaverLogin;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonStringParse {
	
	public JSONObject stringToJson(String jsonStr, String key) throws ParseException {
		JSONParser parser = new JSONParser();
		Object obj = null;
		
		obj = parser.parse(jsonStr);
		JSONObject jsonobj = (JSONObject) obj;
		JSONObject response = (JSONObject)jsonobj.get(key);
		
		return response;
		
	}
	
	public String JsonToString(JSONObject jsonobj, String key) {
		String str =(String)jsonobj.get(key);
		return str;
	}

}
