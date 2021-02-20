package com.doc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class JDBCHelper {

	private static final String url = "jdbc:mysql://localhost:3306/mydb";
	private static final String username = "root";
	private static final String password = "sudoopen";

	private static Connection con = null;

	// Get a connection to the database
	private static Connection getConnection() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection(url, username, password);

			return con;
		} catch (Exception e) {
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

			if (result.next()) {
				return true;
			}

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

	public static List<Appointment> getAppointments(String dname, String sdate) {
		Date date;
		java.sql.Date sqldate = null;
		String query = "";

		if (sdate.equals("all")) {
			query = "SELECT * FROM appointments WHERE dname='" + dname + "';";
		} else {
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
				sqldate = new java.sql.Date(date.getTime());
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			query = "SELECT * FROM appointments WHERE dname='" + dname + "' AND date='" + sqldate + "';";

		}

		System.out.println(query);
		List<Appointment> appointments = new ArrayList<Appointment>();

		try {
			Statement st = getConnection().createStatement();
			ResultSet result = st.executeQuery(query);

			while (result.next()) {
				appointments.add(new Appointment(result.getString("dname"), result.getString("pname"),
						result.getDate("date"), result.getString("pmobile")));
			}

			appointments.forEach(app -> {
				System.out.println(app.getPname() + "\t" + app.getMobile() + "\t" + app.getDate());
			});
			System.out.println(appointments.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (appointments.size() == 0) {
			return null;
		} else {
			return appointments;
		}
	}

	public static List<String> getAllDoctors() {

		List<String> list = new ArrayList<String>();

		String query = "SELECT dname FROM doctors;";

		System.out.println("\nQuerying doctors list: " + query);

		try {

			Statement st = getConnection().createStatement();
			ResultSet result = st.executeQuery(query);

			while (result.next()) {
				list.add(result.getString("dname"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public static boolean bookAppointment(String dname, Date date, String pname, String pmobile) {
		String query = "INSERT INTO appointments(dname, date, pname, pmobile) VALUES('" + dname + "', '" + date + "', '"
				+ pname + "', '" + pmobile + "');";
		System.out.println("\nCreating Appointment: " + query);

		try {
			Statement st = getConnection().createStatement();
			if (st.executeUpdate(query) == 1) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
