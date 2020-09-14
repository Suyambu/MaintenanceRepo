<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
.topnav {
	background-color: #C9C7AF;
	overflow: hidden;
	margin-bottom: 20px;
}

/* Style the links inside the navigation bar */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

/* Add an active class to highlight the current page */
.topnav a.active {
	background-color: #FFA000;
	color: white;
}

/* Hide the link that should open and close the topnav on small screens */
.topnav .icon {
	display: none;
}

@media screen and (max-width: 600px) {
	.topnav a:not (:first-child ) {
		display: none;
	}
	.topnav a.icon {
		float: right;
		display: block;
	}
}

/* The "responsive" class is added to the topnav with JavaScript when the user clicks on the icon. This class makes the topnav look good on small screens (display the links vertically instead of horizontally) */
@media screen and (max-width: 600px) {
	.topnav.responsive {
		position: relative;
	}
	.topnav.responsive a.icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	.topnav.responsive a {
		float: none;
		display: block;
		text-align: left;
	}
}
</style>


<div class="topnav" id="myTopnav">
	<a href="${pageContext.request.contextPath}/purchase/newPurchase" id="newPurchase">New Purchase</a>
	 <a href="${pageContext.request.contextPath}/purchase/getPurchase" id="getPurchase">History</a>  
	  <a
		href="javascript:void(0);" class="icon" onclick="myFunction()"> <i
		class="fa fa-bars"></i>
	</a>
</div>


<script>

function myFunction() {
	  var x = document.getElementById("myTopnav");
	  if (x.className === "topnav") {
	    x.className += " responsive";
	  } else {
	    x.className = "topnav";
	  }
	}
</script>