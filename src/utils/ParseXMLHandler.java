package utils;

import java.util.HashMap;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class ParseXMLHandler extends DefaultHandler {
	private HashMap<String, String> hm=null;
	private StringBuffer sb =null;
	
	public ParseXMLHandler() {
		super();
		hm =new HashMap<String, String>();
		sb =new StringBuffer();
	}

	@Override
	public void characters(char[] ch, int start, int length)
			throws SAXException {
		sb.append(ch,start,length);
		super.characters(ch, start, length);
	}

	@Override
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
		hm.put(qName.toLowerCase(), sb.toString().trim());
		super.endElement(uri, localName, qName);
	}

	@Override
	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		sb.delete(0, sb.length());
		super.startElement(uri, localName, qName, attributes);
	}
	
	public HashMap<String, String> getHm() {
		return hm;
	}

}
