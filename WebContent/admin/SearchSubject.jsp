<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html>
<head>
<title>Searching</title>
<%@ page
	import="com.anxiety.dao.SubjectOperation,java.util.ArrayList,com.anxiety.bean.bo.SubjectBO,java.util.ListIterator"%>
<%@include file="/commonfiles/link.jsp"%>
</head>
<body>
	<%@include file="common/Header.jsp"%>
	<div class="wrapper">

		<%@include file="common/asidebar.jsp"%>

		<!-- Page Content Holder -->
		<div id="content">
			<button type="button" id="asidebarCollapse"
				class="btn btn-danger navbar-btn">
				<i class="glyphicon glyphicon-align-justify"> </i>
			</button>
			<br> <br>
			<h2>Subject Data</h2>
			<br>
			<%!String alert = "";%>
			<%
				String searchq = request.getParameter("sq");
				ServletContext sc1 = getServletContext();
				SubjectOperation subo1 = new SubjectOperation(sc1.getInitParameter("driver"), sc1.getInitParameter("dburl"),
						sc1.getInitParameter("dbuser"), sc1.getInitParameter("dbpswd"));
				ArrayList<SubjectBO> subal1 = subo1.searchSubject(searchq);
				if (subal1 == null) {
			%>
			<p class="text-center">
				<strong style="color: blue;"><i>No subject found</i></strong>
			</p>
			<%
				} else {
			%>
			<p class="text-center">
				<strong style="color: blue;"><i><%=subal1.size()%>.subject
						found</i></strong>
			</p>
			<table class=" table table-condensed table-success">
				<thead class="table-dark">
					<tr>
						<th>SUBJECT ID</th>
						<th>SUBJECT NAME</th>
						<th>TOTAL MARKS</th>
						<th>PASSING MARKS</th>
						<th>QUESTION</th>
						<th>FEES</th>
						<th>DISCOUNT</th>
						<th>DURATION</th>
						<th colspan="2">MODIFY</th>
					</tr>
				</thead>
				<%
					ListIterator<SubjectBO> li1 = subal1.listIterator();
						SubjectBO subd1 = null;
						while (li1.hasNext()) {
							subd1 = li1.next();
				%>

				<tbody>
					<tr>
						<td><%=subd1.getSub_id()%></td>
						<td><%=subd1.getSub_name()%></td>
						<td><%=subd1.getSub_tmarks()%></td>
						<td><%=subd1.getSub_pmarks()%></td>
						<td><%=subd1.getSub_question()%></td>
						<td><%=subd1.getSub_fees()%></td>
						<td><%=subd1.getSub_offer()%></td>
						<td><%=subd1.getSub_duration()%></td>
						<td>
							<form action="UpdateSubject.jsp" method="post">
								<input type="hidden" name=id value="<%=subd1.getSub_id()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<td>
							<form action="../DeleteSubject" method="post">
								<input type="hidden" name=id value="<%=subd1.getSub_id()%>">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						<%
							}
								subo1.closeConnection();
							}
						%>
					</tr>
				</tbody>
			</table>

			<form action="SearchSubject.jsp" method="post">
				<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
					<div class="input-group">
						<input type="search" name=sq
							placeholder="Don't find subject the click me?"
							pattern="^(?!\s*$).+" aria-describedby="button-addon1"
							class="form-control border-0 bg-light" required>
						<div class="input-group-append">
							<button id="button-addon1" type="submit"
								class="btn btn-link text-primary">
								<i class="fa fa-search"> Search subject</i>
							</button>
						</div>
					</div>
				</div>
			</form>
			<%
				String deleteAlert = request.getParameter("alert");
				if (deleteAlert == null) {
					deleteAlert = "";
				}
			%>
			<p class="text-center">
				<strong style="color: tomato;"><i><%=deleteAlert%></i></strong>
			</p>


			<%
				ServletContext sc = getServletContext();
				SubjectOperation subo = new SubjectOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<SubjectBO> subal = subo.getAllSubject();
				if (subal == null) {
			%>
			<p class="text-center">
				<strong style="color: #009e73;"><i>Sorry no data
						found...please insert subject.</i></strong>
			</p>

			<%
				} else {
			%>
			<table class=" table table-condensed table-success">
				<thead class="table-dark">
					<tr>
						<th>SUBJECT ID</th>
						<th>SUBJECT NAME</th>
						<th>TOTAL MARKS</th>
						<th>PASSING MARKS</th>
						<th>QUESTION</th>
						<th>FEES</th>
						<th>DISCOUNT</th>
						<th>DURATION</th>
						<th colspan="2">MODIFY</th>
					</tr>
				</thead>
				<%
					ListIterator<SubjectBO> li = subal.listIterator();
						SubjectBO subd = null;
						while (li.hasNext()) {
							subd = li.next();
				%>


				<tbody>

					<tr>
						<td><%=subd.getSub_id()%></td>
						<td><%=subd.getSub_name()%></td>
						<td><%=subd.getSub_tmarks()%></td>
						<td><%=subd.getSub_pmarks()%></td>
						<td><%=subd.getSub_question()%></td>
						<td><%=subd.getSub_fees()%></td>
						<td><%=subd.getSub_offer()%></td>
						<td><%=subd.getSub_duration()%></td>
						<td>
							<form action="UpdateSubject.jsp" method="post">
								<input type="hidden" name=id value="<%=subd.getSub_id()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<td>
							<form action="../DeleteSubject" method="post">
								<input type="hidden" name=id value="<%=subd.getSub_id()%>">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						<%
							}
								subo.closeConnection();
						%>
					</tr>
				</tbody>
			</table>
			<%
				}
			%>
		</div>
	</div>
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>
