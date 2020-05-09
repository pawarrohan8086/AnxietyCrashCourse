
//Disable form submissions if there are invalid fields
(function() {
	'use strict';
	window.addEventListener('load', function() {
//Get the forms we want to add validation styles to
var forms = document.getElementsByClassName('needs-validation');
//Loop over them and prevent submission
var validation = Array.prototype.filter.call(forms, function(form) {
	form.addEventListener('submit', function(event) {
		if (form.checkValidity() === false) {
			event.preventDefault();
			event.stopPropagation();
		}
		form.classList.add('was-validated');
	}, false);
});
}, false);
})();

//validation
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

//When the user clicks on the password field, show the message box
myInput.onfocus = function() {
	document.getElementById("message").style.display = "block";
}

//When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
	document.getElementById("message").style.display = "none";
}

//When the user starts to type something inside the password field
myInput.onkeyup = function() {
//Validate lowercase letters
var lowerCaseLetters = /[a-z]/g;
if(myInput.value.match(lowerCaseLetters)) {  
	letter.classList.remove("invalid");
	letter.classList.add("valid");
} else {
	letter.classList.remove("valid");
	letter.classList.add("invalid");
}

//Validate capital letters
var upperCaseLetters = /[A-Z]/g;
if(myInput.value.match(upperCaseLetters)) {  
	capital.classList.remove("invalid");
	capital.classList.add("valid");
} else {
	capital.classList.remove("valid");
	capital.classList.add("invalid");
}

//Validate numbers
var numbers = /[0-9]/g;
if(myInput.value.match(numbers)) {  
	number.classList.remove("invalid");
	number.classList.add("valid");
} else {
	number.classList.remove("valid");
	number.classList.add("invalid");
}

//Validate length
if(myInput.value.length >=6) {
	length.classList.remove("invalid");
	length.classList.add("valid");
} else {
	length.classList.remove("valid");
	length.classList.add("invalid");
}
}

//password match
var password = document.getElementById("psw")
, confirm_password = document.getElementById("cpsw");

function validatePassword(){
	if(password.value != confirm_password.value) {
		confirm_password.setCustomValidity("Passwords Don't Match");
	} else {
		confirm_password.setCustomValidity('');
	}
}
password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;


var ltr = document.getElementById("uname");
//When the user clicks on the password field, show the message box
ltr.onfocus = function() {
	document.getElementById("username").style.display = "block";
}

//When the user clicks outside of the password field, hide the message box
ltr.onblur = function() {
	document.getElementById("username").style.display = "none";
}

ltr.onkeyup = function() {
var spaces = /\s/g;
if (ltr.value.match(spaces)) {
	space.classList.remove("valid");
	space.classList.add("invalid");
	uname.classList.add("invalid-feedback");
}else{
	space.classList.remove("invalid");
	space.classList.add("valid");
}
}