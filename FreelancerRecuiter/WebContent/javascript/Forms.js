//document.getElementById('signup').addEventListener('click', SignUpForm);
//document.getElementById('login').addEventListener('click', LoginForm);

var out = 0;

function LoginForm(n) {
	var word="!";
	out=n;
	if(n==1) {
		word="Recruiter";
	} else {
		word="Candidate";
	}
	console.log(word.concat("LoginForm"));
	var myForm = `<div id="head">
			<span id="login">Login</span> <span id="signup">Sign Up</span>
			</div>
			<div id="displayForm">
				<form action="#" method="post" id="LoginForm">
		<div class="form-element">
			<span>Email:</span><br>
			<input type="text" name="username">
		</div>
		<div class="form-element">
			<span>Password:</span><br>
			<input type="password" name="password">
		</div>
		<div class="form-element">
			<input type="submit" value="Login" name="submit">
		</div>
		</form>
		</div>`;
	document.getElementById("content").innerHTML=myForm;
	document.getElementById("signup").addEventListener("click", SignUpForm);
}

function SignUpForm(n) {
	var word = "!";
	if(n==1) {
		word="Recruiter";
	} else {
		word="Candidate";
	}
	console.log(word.concat("SignUpForm"));
	var first = `<div id="head">
			<span id="login">Login</span> <span id="signup">Sign Up</span>
			</div>
			<div id="displayForm">
				<form action="`;
	var last = `SignUpServlet" method="post" id="LoginForm">
		<div class="form-element">
			<span>Email:</span><br>
			<input type="email" name="email">
		</div>
		<div class="form-element">
			<span>Password:</span><br>
			<input type="password" name="password">
		</div>
		<div class="form-element">
			<span>Confirm Password:</span><br>
			<input type="password" name="confirmPassword">
		</div>
		<div class="form-element">
			<input type="submit" value="Sign Up">
		</div>
		</form></div>`;
	let myForm = first.concat(word, last);
	document.getElementById("content").innerHTML=myForm;
	document.getElementById("login").addEventListener("click", LoginForm);
}


