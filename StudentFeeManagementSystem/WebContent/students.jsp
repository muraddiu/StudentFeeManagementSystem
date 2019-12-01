<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file="jsp/header.jsp"%>

    <section class="page-section cta">
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <div class="cta-inner text-center rounded">

              <h2 class="section-heading mb-5">
                <span class="section-heading-upper">Our</span>
                <span class="section-heading-lower">Student List</span>
              </h2>
              <%
                String Host = "jdbc:mysql://localhost:3306/db_sfms";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                try {
                  Class.forName("com.mysql.jdbc.Driver");
                  System.out.println("Driver loaded");
                  connection = DriverManager.getConnection(Host, "root", "");
                  System.out.println("Connected to database");
                  statement = connection.createStatement();
                  String Data = "select * from student_g026074";
                  rs = statement.executeQuery(Data);
                  while (rs.next()) {
              %>
              <ul class="list-unstyled list-hours mb-5 text-left mx-auto">
                <li class="list-unstyled-item list-hours-item d-flex">
                  ID
                  <span class="ml-auto"><%=rs.getString("id")%></span>
                </li>
                <li class="list-unstyled-item list-hours-item d-flex">
                  Name
                  <span class="ml-auto"><%=rs.getString("name")%></span>
                </li>
                <li class="list-unstyled-item list-hours-item d-flex">
                  Email
                  <span class="ml-auto"><%=rs.getString("email")%></span>
                </li>
                <li class="list-unstyled-item list-hours-item d-flex">
                  Phone
                  <span class="ml-auto"><%=rs.getString("phone")%></span>
                </li>
                <li class="list-unstyled-item list-hours-item d-flex">
                  Address
                  <span class="ml-auto"><%=rs.getString("address")%></span>
                </li>
              </ul>
              <%
                       }
                   } catch(Exception e) {
                       out.print(e.getMessage());
                   } finally {
                       rs.close();
                       statement.close();
                       connection.close();
                   }
               %>
              <p class="address mb-5">
                <em>
                  <strong>Created By </strong>
                  <br>
                 Sheznan Tayab Navid
                </em>
              </p>
              <p class="mb-0">
                <small>
                  <em>Call Anytime</em>
                </small>
                <br>
                (317) 585-8468
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>


<%@include file="jsp/footer.jsp"%>