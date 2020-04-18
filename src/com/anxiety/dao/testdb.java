package com.anxiety.dao;

import java.util.ArrayList;
import java.util.ListIterator;
import java.util.UUID;

public class testdb {
	
	public static void main(String[] args) {
	
	StudentOpration so=new StudentOpration("oracle.jdbc.driver.OracleDriver","jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	System.out.println("table created");
	ArrayList<Long> mob=so.contactCheck();
	ListIterator<Long> ltr=mob.listIterator();
	while(ltr.hasNext()) {
		Long contact=ltr.next();
		System.out.println(contact);
	}
	String[] uid = UUID.randomUUID().toString().split("-");
	
	String sid=uid[0];
	System.out.println(+UUID.randomUUID().hashCode());
	}

}
