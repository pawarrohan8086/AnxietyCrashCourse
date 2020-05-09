<html>
<head>
<title>Certificate</title>
<style>
.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	padding: 12px 30px;
	cursor: pointer;
	font-size: 20px;
}

.btn:hover {
	background-color: RoyalBlue;
}

.signature, .title {
	float: left;
	border-top: 1px solid #000;
	width: 200px;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<div id="print-button-div" style="padding: 0 40%;">
			<input type="button" onClick="window.print()" class="btn"
				value="Print Certificate" /> <br> <br> <br>
		</div>
		<%
			String name = request.getParameter("sname");
			if (name == null)
				name = "";
			String course = request.getParameter("course");
			if (course == null)
				course = "";
			String date = request.getParameter("date");
			if (date == null)
				date = "";
			String perc = request.getParameter("perc");
			if (perc == null)
				perc = "";
		%>
		<div
			style="width: 800px; height: 600px; padding: 20px; text-align: center; border: 10px solid #787878; background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 81%);">
			<div
				style="width: 750px; height: 550px; padding: 20px; text-align: center; border: 5px solid #787878">
				<span style="font-size: 50px; font-weight: bold;color:#CF9625">Certificate
					of Completion</span> <br> <br> <span style="font-size: 25px"><i>This
						is to certify that</i></span> <br> <br> <span
					style="font-size: 30px; text-transform: capitalize;color:#0F2557;"><b><%=name%></b></span><br />
				<br /> <span style="font-size: 25px"><i>has completed
						the course</i></span> <br /> <br /> <span
					style="font-size: 30px; text-transform: capitalize;color:#FB8122;"><%=course%></span>
				<br /> <br /> <span style="font-size: 20px">with score of  <b><%=perc%>%</b></span>
				<br /> <br /> <br /> <br /> <span style="font-size: 25px"><i>Completed
						Date</i></span><br><br> <span style="font-size: 25px;color:#FAF1CF;"><i><%=date%></i></span><br>
				<table style="margin-top: 40px; float: left;">
					<tr>
						<td style="text-align: center"><span><b>Awarded by</b></span></td>
					</tr>
					<tr>
						<td
							style="width: 200px; float: right; border: 0; border-bottom: 0px solid #000;"></td>
					</tr>
					<tr>
						<td style="text-align: center;color:tomato;"><span><b>Anxiety Crash Course</b></span></td>
					</tr>
				</table>
				<table style="margin-top: 40px; float: right;">
					<tr>
						<td style="text-align: center;color:#1BA098;"><span><b><%=name%></b></span></td>
					</tr>
					<tr>
						<td
							style="width: 200px; float: right; border: 0; border-bottom: 1px solid #000;"></td>
					</tr>
					<tr>
						<td style="text-align: center"><span><b>Signature</b></span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>