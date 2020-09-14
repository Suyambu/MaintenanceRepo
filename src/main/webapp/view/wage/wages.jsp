
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.suyambu.construction.model.Wages"%>
    <style>
    
    #myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}
    
    
    table { 
  width: 100%; 
  border-collapse: collapse; 
}
/* Zebra striping */
tr:nth-of-type(odd) { 
  background: #eee; 
}
th { 
  background: #F8C764; 
  color: white; 
  font-weight: bold; 
  padding: 8px; 
  border: 1px solid #ccc; 
  text-align: left; 
  padding: 10px; 
}
td { 
  padding: 8px; 
  border: 1px solid #ccc; 
  text-align: left; 
}
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}
	
	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
	}
	
	/*
	Label the data
	*/
	td:nth-of-type(1):before { content: "Worker name"; }
	td:nth-of-type(2):before { content: "Work Name"; }
	td:nth-of-type(3):before { content: "Amount"; }
	td:nth-of-type(3):before { content: "Date"; }
	td:nth-of-type(4):before { content: "Edit"; }
	td:nth-of-type(5):before { content: "Delete"; }
}
    
    </style>
    
    	
  
<jsp:include page="header.jsp" />

			 <script type="text/javascript">

  $(document).ready(function(){

	  $("#getWage").addClass("active");
	  $("#newWage").removeClass("active");

	  
	});
  </script>
  <div>
<span>Grant Total</span>
<input type="number"  readonly="true" id="grantTotal" value="${grantTotal}" style="border: none;text-align: center;background: fixed;color: coral;"/></div>
  
    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
	<table id="myTable">
				<thead>
					<tr>
						<th>Worker Name</th>
						<th>Work Name</th>
						<th>Amount</th>
						<th>Date</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach  items = "${wageList}" var="wage">
					<tr>
					
						
						
						<td>${wage.workerName}</td>
						<td>${wage.workName}</td>
						<td>${wage.amount}</td>
						<td>${wage.date}</td>
						<td><a href="<c:url value='/wage/edit/${wage.id}' />" ><img src="https://img.icons8.com/office/16/000000/edit.png"/></a></td>
						<td><a href="<c:url value='/wage/delete/${wage.id}' />" ><img src="https://img.icons8.com/officexs/16/000000/delete-sign.png"/></a></td>
					
					</tr>
				   	</c:forEach>
				</tbody>
			</table>
		

<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  // Loop through all table rows, and hide those who don't match the search query
  var total = 0;
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
    	  var tt = tr[i].getElementsByTagName("td")[2];
    	    if(tt){
    	    	 total =  +total + +tt.textContent || tt.innerText;
    	    	  
    	    }
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
  
  document.getElementById("grantTotal").value = total;
  
}
</script>

<jsp:include page="footer.jsp" />



