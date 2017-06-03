package utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.HashMap;

import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

public class ParserXML {
	@SuppressWarnings("finally")
	public static HashMap<String, String> parserXML(String xmlPath) {
    	URL uri=ParserXML.class.getResource(xmlPath);
		HashMap<String, String> hm =null;
		ParseXMLHandler pxh =new ParseXMLHandler();
		SAXParserFactory spf =SAXParserFactory.newInstance();
    	try {
    		XMLReader xmlReader=spf.newSAXParser().getXMLReader();
    		xmlReader.setContentHandler(pxh);
    		xmlReader.parse(new InputSource(new StringReader(getStringFromXML(uri.toString().substring(5)))));
    		hm=pxh.getHm();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return hm;
		}
	}
	
	@SuppressWarnings({ "resource", "null", "finally" })
	private static String getStringFromXML(String xmlPath){
		String result="";
		String line =null;
		BufferedReader buffer =null;
		try {
			FileInputStream fis =new FileInputStream(new File(xmlPath));
			buffer =new BufferedReader (new InputStreamReader(fis,"UTF8"));
			while((line=buffer.readLine())!=null){
				result+=line;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			return result;
		}
	}
}
