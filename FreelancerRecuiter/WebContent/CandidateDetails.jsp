<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details Form</title>
<style>
form{
padding:1rem;
margin:0.5rem;
}
input{
padding:0.5rem;
margin:0.5rem;
}
label{
padding:1rem;
margin:0.5rem;
}
button{
padding:0.5rem;
margin:0.5rem;
width:7rem;
}
select{
padding:0.5rem;
margin:0.5rem;
width:7rem;
}
.inneredu{
border-bottom: 1px solid black;
}
.innerexp{
border-bottom: 1px solid black;
}
</style>
</head>
<body>
<h1>Fill out personal details</h1>

<form action="CandidateDetailsServlet" method="post">
	<label for="firstname">First Name:</label>
	<input type="text" name="firstname" id="firstname" required> <br>
	
	<label for="lastname">Last Name:</label>
	<input type="text" name="lastname" id="lastname" required> <br>
	
	<label for="photo">Upload photo:</label>
	<input type="file" name="photo" id="photo"> <br>
	
	<label for="gender">Gender:</label>
	<select name="gender" id="gender" required>
	  <option value="M">Male</option>
	  <option value="F">Female</option>
	  <option value="O">Choose not to answer</option> 
	</select> <br>
	
	<label for="workphone">Work Phone:</label>
	<input type="tel" name="workphone" id="workphone" required> <br>
	
	<label for="street">Street:</label>
	<input type="text" name="street" id="street"> <br>
	
	<label for="city">City:</label>
	<input type="text" name="city" id="city" required> <br>
	
	<label for="state">State:</label>
	<input type="text" name="state" id="state" required> <br>
	
	<label for="pin">PINCODE:</label>
	<input type="number" name="pin" id="pin" required oninput=""> <br>
	
	<hr size=3>
	
	<h1>Education details</h1>
	<div id="edu">
	<div class="inneredu">
	<label for="university">Institute:</label>
	<input type="text" name="university" id="university" required> <br>
	
	<label for="degree">Degree:</label>
	<input type="text" name="degree" id="degree"> <br>
	
	<label for="start">Start Date:</label>
	<input type="date" name="start" id="start" required> <br>
	
	<label for="end">End date (expected):</label>
	<input type="date" name="end" id="end" required oninput="checkDateValidity"> <br>
	</div>
	</div>
	<div id="edu1"></div>
	<div id="edu2"></div>
	<div style="display:flex">
	<button  id="eduadd">+ Add</button> 
	<button  id="edudel" style="display:none;">- Sub</button>
	</div>
	
	
	<hr size=3>
	
	<h1>Experience details</h1>
	<div id="exp">
	<div class="innerexp">
	<label for="company">Company:</label>
	<input type="text" name="company" id="company" required> <br>
	
	<label for="title">Title:</label>
	<input type="text" name="title" id="title"> <br>
	
	<label for="Xstart">Start Date:</label>
	<input type="date" name="Xstart" id="Xstart" required> <br>
	
	<label for="Xend">End date (expected):</label>
	<input type="date" name="Xend" id="Xend" required> <br>
	
	<label for="description">Description:</label> <br>
	<textarea id="description" name="description" rows="7" cols="50"></textarea> <br>
	</div>
	</div>
	<div id="exp1"></div>
	<div id="exp2"></div>
	<div style="display:flex">
	<button  id="expadd">+ Add</button> 
	<button  id="expdel" style="display:none;">- Sub</button>
	</div>
	
	<hr size=3>
	
	<input type="submit" value="Submit">
	
</form>
<script src="javascript/educationAdd.js"></script>
<script src="javascript/experienceAdd.js"></script>
<script>
console.log("CandidateDetails.jsp");

const form = document.getElementById("DetailsForm");
form.addEventListener("submit", (e) => {
 	e.preventDefault();
	const data = $('form').serialize();
	axios
	  .post("CandidateDetailsServlet",data , {
	    headers: {
	      "Content-Type": "application/x-www-form-urlencoded"
	    },
	  })
	  .then((res) => {
		if(res.data=="0"){
			window.location="CandidateDashboard.jsp";
		}
		else{
		document.getElementById("err").innerHTML=res.data;
		}
		console.log(res);
	  })
	  .catch((err) => {
	    console.log(err);
	  });
});
</script>
</body>
</html>