package net.koreate.user.session;

import java.util.Hashtable;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@Component
public class SessionListner implements HttpSessionListener, HttpSessionAttributeListener {

	public static Hashtable<String,Object> sessionRepository;
	
	public SessionListner() {
		if(sessionRepository == null) {
			sessionRepository = new Hashtable<>();
		}
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		/*
		if(event.getName().equals("userInfo")) {
			HttpSession session = event.getSession();
			System.out.println("userInfo regist : "+session.getId());
			sessionRepository.put(event.getName(), event.getValue());
		}
		*/
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {

	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}

}
