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
	<div id="print-button-div" style="padding:0 40%;">
		<input type="button" onClick="window.print()" class="btn"
			value="Print Certificate" /> <br>
		<br>
		<br>
	</div>
	<div
		style="width: 800px; height: 600px; padding: 20px; text-align: center; border: 10px solid #787878; background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 81%);">
		<div
			style="width: 750px; height: 550px; padding: 20px; text-align: center; border: 5px solid #787878">
			<span style="font-size: 50px; font-weight: bold">Certificate
				of Completion</span> <br>
			<br> <span style="font-size: 25px"><i>This is to
					certify that</i></span> <br>
			<br> <span style="font-size: 30px"><b>$student.getFullName()</b></span><br />
			<br /> <span style="font-size: 25px"><i>has completed the
					course</i></span> <br />
			<br /> <span style="font-size: 30px">$course.getName()</span> <br />
			<br /> <span style="font-size: 20px">with score of <b>$grade.getPoints()%</b></span>
			<br />
			<br />
			<br />
			<br /> <span style="font-size: 25px"><i>Completed Date</i></span><br>
			<span style="font-size: 25px"><i>01-Sep-2018</i></span><br>
			<table style="margin-top: 40px; float: right;">
				<tr>
					<td><span><b>$student.getFullName()</b></span></td>
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