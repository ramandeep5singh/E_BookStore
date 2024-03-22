package adminInitializationBean;

import adminInitializationBean.Type;
import java.sql.*;

public class AdminDashboardBean {
	private Type java;
	private Type python;
	private Type cpp;
	private Type c;
	
	public AdminDashboardBean(){
		this.java = new Type("java");
		this.python = new Type("python");
		this.cpp = new Type("cpp");
		this.c = new Type("c");
	}
	
	public Type getJava() {
		return this.java;
	}
	public Type getPython() {
		return this.python;
	}
	public Type getCpp() {
		return this.cpp;
	}
	public Type getC() {
		return this.c;
	}
}
