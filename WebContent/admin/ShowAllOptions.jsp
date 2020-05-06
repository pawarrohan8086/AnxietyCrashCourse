<!DOCTYPE html>
<html>
<head>
<title>Option Data</title>
<%@ page
	import="com.anxiety.dao.OptionOperation,java.util.ArrayList,com.anxiety.bean.bo.OptionBO,java.util.ListIterator"%>
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

			<h2>Option Data</h2>
			<br>
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
				OptionOperation opo = new OptionOperation(sc.getInitParameter("driver"), sc.getInitParameter("dburl"),
						sc.getInitParameter("dbuser"), sc.getInitParameter("dbpswd"));
				ArrayList<OptionBO> opal = opo.getAllOption();
				if (opal == null) {
			%>
			<p class="text-center">
				<strong style="color: #009e73;"><i>Sorry no data
						found...please Add Question.</i></strong>
			</p>

			<%
				} else {
			%>
			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class=" table  table-secondary table-bordered table-sm">
					<thead class="thead-dark">
						<tr>
							<th>ANSWER_ID</th>
							<th>QUESTION_ID</th>
							<th>OPTION_1</th>
							<th>OPTION_2</th>
							<th>OPTION_3</th>
							<th>OPTION_4</th>
						</tr>
					</thead>
					<%
						ListIterator<OptionBO> li = opal.listIterator();
							OptionBO opd = null;
							while (li.hasNext()) {
								opd = li.next();
					%>
					<tbody>

						<tr>
							<td><%=opd.getOption_id()%></td>
							<td><a href="ShowQueByID.jsp?id=<%=opd.getQue_id()%>"
								Style="color: blue;"><%=opd.getQue_id()%></a></td>
							<td><%=opd.getOption1()%></td>
							<td><%=opd.getOption2()%></td>
							<td><%=opd.getOption3()%></td>
							<td><%=opd.getOption4()%></td>
							<%
								}
									opo.closeConnection();
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
