<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html>
<head>
<title>Searching</title>
<%@ page
	import="com.anxiety.dao.QuestionOperation,java.util.ArrayList,com.anxiety.bean.bo.QuestionBO,java.util.ListIterator"%>
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
			<h2>Question Data</h2>
			<br>
			<%!String alert = "";%>
			<%
				String searchq = request.getParameter("sq");
				ServletContext sc1 = getServletContext();
				QuestionOperation qo1 = new QuestionOperation(sc1.getInitParameter("driver"), sc1.getInitParameter("dburl"),
						sc1.getInitParameter("dbuser"), sc1.getInitParameter("dbpswd"));
				ArrayList<QuestionBO> qal1 = qo1.searchQuestion(searchq);
				if (qal1 == null) {
			%>
			<p class="text-center">
				<strong style="color: blue;"><i>No question found</i></strong>
			</p>
			<%
				} else {
			%>
			<p class="text-center">
				<strong style="color: blue;"><i><%=qal1.size()%>.question
						found</i></strong>
			</p>
			<table class=" table  table-warning table-sm">
				<thead class="thead-dark">
					<tr>
						<th>SUBJECT NAME</th>
						<th>QUESTION ID</th>
						<th>QUESTION TYPE</th>
						<th>QUESTION MARK</th>
						<th>QUESTION</th>
						<th>ANSWER</th>
						<th colspan="2">MODIFY</th>
					</tr>
				</thead>
				<%
					ListIterator<QuestionBO> li1 = qal1.listIterator();
						QuestionBO qd1 = null;
						while (li1.hasNext()) {
							qd1 = li1.next();
				%>

				<tbody>
					<tr>
					<tr>
						<td><%=qd1.getSub_name()%></td>
						<td><%=qd1.getQue_id()%></td>
						<td><%=qd1.getQuestion_type()%></td>
						<td><%=qd1.getQue_marks()%></td>
						<td><%=qd1.getQuetext()%></td>
						<td><%=qd1.getAnstext()%></td>
						<td>
							<form action="UpdateQuestion.jsp" method="post">
								<input type="hidden" name=id value="<%=qd1.getQue_id()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<td>
							<form action="../DeleteQuestion" method="post">
								<input type="hidden" name=id value="<%=qd1.getQue_id()%>">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						<%
							}
								qo1.closeConnection();
							}
						%>
					</tr>
				</tbody>
			</table>

			<form action="SearchQuestion.jsp">
				<div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
					<div class="input-group">
						<input type="search" name=sq
							placeholder="Don't find Question the click me?"
							pattern="^(?!\s*$).+" aria-describedby="button-addon1"
							class="form-control border-0 bg-light" required>
						<div class="input-group-append">
							<button id="button-addon1" type="submit"
								class="btn btn-link text-primary">
								<i class="fa fa-search"> Search Question</i>
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
				QuestionOperation qo = new QuestionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<QuestionBO> qal = qo.getAllQuestion();
				if (qal == null) {
			%>
			<p class="text-center">
				<strong style="color: #009e73;"><i>Sorry no data
						found...please insert subject.</i></strong>
			</p>

			<%
				} else {
			%>
						<div class="table-wrapper-scroll-y my-custom-scrollbar">
			<table class=" table  table-warning table-sm">
				<thead class="thead-dark">
					<tr>
						<th>SUBJECT NAME</th>
						<th>QUESTION ID</th>
						<th>QUESTION TYPE</th>
						<th>QUESTION MARK</th>
						<th>QUESTION</th>
						<th>ANSWER</th>
						<th colspan="2">MODIFY</th>
					</tr>
				</thead>
				<%
					ListIterator<QuestionBO> li = qal.listIterator();
						QuestionBO qd = null;
						while (li.hasNext()) {
							qd = li.next();
				%>


				<tbody>
					<tr>
						<td><%=qd.getSub_name()%></td>
						<td><%=qd.getQue_id()%></td>
						<td><%=qd.getQuestion_type()%></td>
						<td><%=qd.getQue_marks()%></td>
						<td><%=qd.getQuetext()%></td>
						<td><%=qd.getAnstext()%></td>
						<td>
							<form action="UpdateQuestion.jsp" method="post">
								<input type="hidden" name=id value="<%=qd.getQue_id()%>">
								<button type="submit" class="btn btn-secondary">Edit</button>
							</form>
						</td>
						<td>
							<form action="../DeleteQuestion" method="post">
								<input type="hidden" name=id value="<%=qd.getQue_id()%>">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
						<%
							}
								qo.closeConnection();
						%>
					</tr>
				</tbody>
			</table>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<%@include file="/commonfiles/Footer.jsp"%>
</body>
</html>
