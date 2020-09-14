
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.suyambu.construction.model.Purchase"%>
    
    <style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid blue;
  border-bottom: 16px solid blue;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
    <style>
    
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
	td:nth-of-type(1):before { content: "Material Name"; }
	td:nth-of-type(2):before { content: "Qty"; }
	td:nth-of-type(3):before { content: "Amount"; }
	td:nth-of-type(4):before { content: "Total"; }
	td:nth-of-type(5):before { content: "Paid"; }
	td:nth-of-type(6):before { content: "Bending"; }
	td:nth-of-type(7):before { content: "OutStanding"; }
	td:nth-of-type(8):before { content: "Coolie"; }
	td:nth-of-type(9):before { content: "Date"; }
	td:nth-of-type(10):before { content: "User Name"; }
	td:nth-of-type(11):before { content: "Edit"; }
	td:nth-of-type(12):before { content: "Delete"; }
}
    
    </style>
    
    	
  
<jsp:include page="header.jsp" />

			 <script type="text/javascript">

  $(document).ready(function(){

	  $("#getPurchase").addClass("active");
	  $("#newPurchase").removeClass("active");

	  
	});
  </script>
  
  <script>
  $(document).on("change", "#searchMaterial", function(){
		 
	  var materialId =  $(this).val();
	  
	  if(materialId != 0){
		  
		  $("#tableMain").hide();
		  
		  $("#loader").addClass("loader");
		  
	  $.ajax({
		    type : "GET",
		    url : "/purchase/searchByMaterial",
		    data : {
		        "materialId" : materialId
		    },
		    success: function(data){
		    	 $("#loader").removeClass("loader");
		    	
		    	$("#tableMain").empty();
		    	
		    	$('#tableMain').append(
		    			
'<tr>'+
						'<th>Material name</th>'+
						'<th>Qty load/kg/unit</th>'+
						'<th>Rate</th>'+
						'<th>Total</th>'+
						'<th>Paid</th>'+
						'<th>Bending</th>'+
						'<th>OutStanding</th>'+
						'<th>Coolie</th>'+
						'<th>Date</th>'+
						'<th>User Name</th>'+
						'<th>Edit</th>'+
						'<th>Delete</th>'+
		    			'</tr>'
		    	
		    	);
		    	
		    	var total = 0;
		    	
		    	 for ( var i = 0, len = data.length; i < len; ++i) {
		    		 
		    		 total = total + data[i].total + data[i].coolie;
		    	
		    	$('#tableMain').append( 
		    			
		    			'<tr>'+
		    			'<td>' + data[i].materialName + '</td>'+
		    			'<td>' + data[i].qty + '</td>'+
		    			'<td>' + data[i].rate + '</td>'+
		    			'<td>' + data[i].total + '</td>'+
		    			'<td>' + data[i].paid + '</td>'+
		    			'<td>' + data[i].bending + '</td>'+
		    			'<td>' + data[i].outStanding + '</td>'+
		    			'<td>' + data[i].coolie + '</td>'+
		    			'<td>' + data[i].date + '</td>'+
		    			'<td>' + data[i].userName + '</td>'+
		    			'<td>' +'<a href="/purchase/edit/'+data[i].id+'"><img src="https://img.icons8.com/office/16/000000/edit.png"/></a>' + '</td>'+
		    			'<td>' +'<a href="/purchase/delete/'+data[i].id+'"><img src="https://img.icons8.com/officexs/16/000000/delete-sign.png"/></a>' + '</td>'+
		    			
		    			'</tr>' );

		    	 
		    	 }
		    	 $('#grantTotal').val(total);
		    
		    }
		});
	  
	  $("#loader").removeClass("loader");
	  $("#tableMain").show();
	 
	  
	  }
	  
  });
  
  
  
  </script>
  
   <script>
  $(document).on("change", "#searchBending", function(){
		 
	  var materialId =  $(this).val();
	  
	  if(materialId != 0){
		  $("#tableMain").hide();
		  $("#loader").addClass("loader");
		  
	  $.ajax({
		    type : "GET",
		    url : "/purchase/searchByBendings",
		    data : {
		    },
		    success: function(data){
		    	$("#loader").removeClass("loader");
		    	$("#tableMain").empty();
		    	
		    	$('#tableMain').append(
		    			
'<tr>'+
						'<th>Material name</th>'+
						'<th>Qty load/kg/unit</th>'+
						'<th>Rate</th>'+
						'<th>Total</th>'+
						'<th>Paid</th>'+
						'<th>Bending</th>'+
						'<th>OutStanding</th>'+
						'<th>Coolie</th>'+
						'<th>Date</th>'+
						'<th>User Name</th>'+
						'<th>Edit</th>'+
						'<th>Delete</th>'+
		    			'</tr>'
		    	
		    	);
		    	
		    	var total = 0;
		    	 for ( var i = 0, len = data.length; i < len; ++i) {
		    			total = total + data[i].total + data[i].coolie;
		    	
		    	$('#tableMain').append( 
		    		
		    			
		    			'<tr>'+
		    			'<td>' + data[i].materialName + '</td>'+
		    			'<td>' + data[i].qty + '</td>'+
		    			'<td>' + data[i].rate + '</td>'+
		    			'<td>' + data[i].total + '</td>'+
		    			'<td>' + data[i].paid + '</td>'+
		    			'<td>' + data[i].bending + '</td>'+
		    			'<td>' + data[i].outStanding + '</td>'+
		    			'<td>' + data[i].coolie + '</td>'+
		    			'<td>' + data[i].date + '</td>'+
		    			'<td>' + data[i].userName + '</td>'+
		    			'<td>' +'<a href="/purchase/edit/'+data[i].id+'"><img src="https://img.icons8.com/office/16/000000/edit.png"/></a>' + '</td>'+
		    			'<td>' +'<a href="/purchase/delete/'+data[i].id+'"><img src="https://img.icons8.com/officexs/16/000000/delete-sign.png"/></a>' + '</td>'+
		    			
		    			'</tr>' );

		    	 
		    	 }
		    	 $('#grantTotal').val(total);
		    
		    }
		});
	  $("#loader").removeClass("loader");
	  $("#tableMain").show();
	  
	  }
	  
  });
  
  
  
  </script>
  

  
    <script>
  $(document).on("change", "#searchDate", function(){
		 
	  var date =  $(this).val();
	  
	  if(date != null){
		  $("#tableMain").hide();
		  $("#loader").addClass("loader");
		  
	  $.ajax({
		    type : "GET",
		    url : "/purchase/searchByDate",
		    data : {
		    	
		    	"date": date
		    },
		    success: function(data){
		    	
		    	
		    	$("#tableMain").empty();
		    	
		    	$('#tableMain').append(
		    			
'<tr>'+
						'<th>Material name</th>'+
						'<th>Qty load/kg/unit</th>'+
						'<th>Rate</th>'+
						'<th>Total</th>'+
						'<th>Paid</th>'+
						'<th>Bending</th>'+
						'<th>OutStanding</th>'+
						'<th>Coolie</th>'+
						'<th>Date</th>'+
						'<th>User Name</th>'+
						'<th>Edit</th>'+
						'<th>Delete</th>'+
		    			'</tr>'
		    	
		    	);
		    	
		    	var total = 0;
		    	
		    	 for ( var i = 0, len = data.length; i < len; ++i) {
		    		 
		    		 total = total + data[i].total + data[i].coolie;
		    	
		    	$('#tableMain').append( 
		    			
		    			
		    			'<tr>'+
		    			'<td>' + data[i].materialName + '</td>'+
		    			'<td>' + data[i].qty + '</td>'+
		    			'<td>' + data[i].rate + '</td>'+
		    			'<td>' + data[i].total + '</td>'+
		    			'<td>' + data[i].paid + '</td>'+
		    			'<td>' + data[i].bending + '</td>'+
		    			'<td>' + data[i].outStanding + '</td>'+
		    			'<td>' + data[i].coolie + '</td>'+
		    			'<td>' + data[i].date + '</td>'+
		    			'<td>' + data[i].userName + '</td>'+
		    			'<td>' +'<a href="/purchase/edit/'+data[i].id+'"><img src="https://img.icons8.com/office/16/000000/edit.png"/></a>' + '</td>'+
		    			'<td>' +'<a href="/purchase/delete/'+data[i].id+'"><img src="https://img.icons8.com/officexs/16/000000/delete-sign.png"/></a>' + '</td>'+
		    			
		    			'</tr>' );

		    	 
		    	 }
		    	 
		    	 $('#grantTotal').val(total);
		    	 
		    
		    }
		});
	  
	  $("#loader").removeClass("loader");
	  $("#tableMain").show();
	  
	  }
	  
  });
  
  
  
  </script>
  
  
   <p class="font-weight-bold">Filter Search</p>



         <div class="form-group"style="width:50%;float:left">
    <label for="materialId">Material</label>
   <select name="searchMaterialId" id="searchMaterial" class="form-control" style="width:50%;margin:auto"required = "true" >
   <option value="0">All</option>
   <c:forEach  items = "${materialList}" var="material">
   <option value="${material.id}">${material.name}</option>
   	</c:forEach>
   </select>
  </div>
  
    <div class="form-group"style="width:50%;float:left">
    <label for="materialId">Bendings</label>
   <select name="searchMaterialId" id="searchBending" class="form-control" style="width:50%;margin:auto"required = "true" >
   <option value ="0">All</option>
   <option value ="1">Bendings</option>
   </select>
  </div>
  
 
       <div class="form-group">
    <label for="materialId">Date</label>
    <input type="date"name = "searchDate" data-date-format="MM/DD/YYYY" class="form-control" style="width:50%;margin:auto"required = "true"  id ="searchDate">
    <div class="input-group-addon">
        <span class="glyphicon glyphicon-th"></span>
    </div>
   
 
</div>
    

 
  

<div class="panel panel-default" style="overflow:none;">
  <div class="panel-heading">Purchases</div>
  <div class="panel-body">
<div>
<span>Grant Total</span>
<input type="number"  readonly="true" id="grantTotal" value="${grantTotal}" style="border: none;text-align: center;background: fixed;color: coral;"/></div>

      <div id="loader" ></div>
	<table id="tableMain">
				<thead>
					<tr>
						
						<th>Material name</th>
						<th>Qty load/kg/unit</th>
						<th>Rate</th>
						<th>Total</th>
						<th>Paid</th>
						<th>Bending</th>
						<th>OutStanding</th>
						<th>Coolie</th>
						<th>Date</th>
						<th>User Name</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach  items = "${purchaseList}" var="purchase">
					<tr id="tbRow">
					
						
						<td>${purchase.materialName}</td>
						<td>${purchase.qty}</td>
						<td>${purchase.rate}</td>
						<td>${purchase.total}</td>
						<td>${purchase.paid}</td>
						<td>${purchase.bending}</td>
						<td>${purchase.outStanding}</td>
						<td>${purchase.coolie}</td>
						<td>${purchase.date}</td>
						<td>${purchase.userName}</td>
						<td><a href="<c:url value='/purchase/edit/${purchase.id}' />" ><img src="https://img.icons8.com/office/16/000000/edit.png"/></a></td>
						<td><a href="<c:url value='/purchase/delete/${purchase.id}' />" ><img src="https://img.icons8.com/officexs/16/000000/delete-sign.png"/></a></td>
					
					</tr>
				   	</c:forEach>
				</tbody>
			</table>
			</div>
		
</div>

<jsp:include page="footer.jsp" />


