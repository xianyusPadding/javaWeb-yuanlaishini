package utils;

import java.io.IOException;

import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;


public class ValidatorXML {
	public static final String NAMESPACE="http://www.w3.org/2001/XMLSchema";
	@SuppressWarnings("finally")
	public static boolean validatorXML(String xmlPath){
		boolean result=false;
		
		SchemaFactory sf = SchemaFactory.newInstance(NAMESPACE);
		try {
			Schema schema =sf.newSchema();
			Validator validator =schema.newValidator();
			validator.validate(new StreamSource(xmlPath));
			result=true;
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			return result;	
		}
	}
}
