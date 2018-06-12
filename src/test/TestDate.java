package test;

public class TestDate {
	public static void main(String[] args) {
		java.util.Date javaDate = new java.util.Date();
		long javaTime = javaDate.getTime();
		System.out.println("The Java Date is: " + javaDate.toString());

		java.sql.Date sqlDate = new java.sql.Date(javaTime);
		System.out.println("The SQL DATE is: " + sqlDate.toString());

		java.sql.Time sqlTime = new java.sql.Time(javaTime);
		System.out.println("The SQL TIME is: " + sqlTime.toString());

		java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(javaTime);
		System.out.println("The SQL TIMESTAMP is: " + sqlTimestamp.toString());
	}
}
