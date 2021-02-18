package com.doc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCHelper {

	private static final String url = "jdbc:mysql://localhost:3306/mydb";
	private static final String username = "root";
	private static final String password = "sudoopen";
	
	private static Connection con = null;
	
	//Get a connection to the database
	private static Connection getConnection() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
			
			return con;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static Boolean getDoctor(String dname, String dpass) {

		String query = "SELECT dname FROM doctors WHERE dname=\"" + dname + "\" AND dpassword=\"" + dpass + "\";";
				
		System.out.println("Querying data: " + query);
		
		try {

			Statement st = getConnection().createStatement();
			ResultSet result = st.executeQuery(query);
			
			if(result.next()) {return true; }

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	public static Boolean insertDoctor(Doctor doctor) {

		String query = "INSERT INTO doctors(dname, dpassword, name) " + "VALUES(\"" + doctor.getDname() + "\", \""
				+ doctor.getPassword() + "\", \"" + doctor.getName() + "\");";
		System.out.println("Inserting data: " + query);
		
		try {
			Statement st = getConnection().createStatement();
			st.executeUpdate(query);
			System.out.println("Registration success!");

			con.close();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
