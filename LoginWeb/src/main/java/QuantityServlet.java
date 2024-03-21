

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class QuantityServlet
 */
public class QuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuantityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
	        //read and establish connection.
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/pagelogin", "root", "sharda1234@");
	        Statement statement=connection.createStatement(); 
	        ResultSet resultSet=statement.executeQuery("SELECT * FROM stockeditems");

	        // Generate HTML for the table
	        out.println("<!DOCTYPE html>");
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<meta charset=\"ISO-8859-1\">");
	        out.println("<title>Stocked Items</title>");
	        out.println("<style>");
	        out.println("body { background-color: #000; color: #fff; font-family: Arial, sans-serif; transition: background-color 0.5s ease; }");
	        out.println("table { border-collapse: collapse; width: 100%; border: 1px solid #000; }");
	        out.println("th, td { border: 1px solid #000; padding: 8px; text-align: left; transition: background-color 0.3s ease; }");
	        out.println("th { background-color: #347b34; color: #fff; }");
	        out.println("td { background-color: #222; color: #fff; }");
	        out.println("tr:hover { background-color: #444; }");
	        out.println("</style>");
	        out.println("</head>");
	        out.println("<body>");
	        out.println("<h1>Available Items</h1>");
	        out.println("<table>");
	        // Table header
	        out.println("<tr><th>Name</th><th>Price</th></tr>");
	        // Table data
	        while(resultSet.next()) {
	            out.println("<tr><td>" + resultSet.getString(2) + "</td><td>" + resultSet.getString(4) + "</td></tr>");
	        }
	        out.println("</table>");
	        out.println("</body>");
	        out.println("</html>");

	    } catch (Exception e) {
	        e.printStackTrace(out);
	    }
	}
	
	
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
