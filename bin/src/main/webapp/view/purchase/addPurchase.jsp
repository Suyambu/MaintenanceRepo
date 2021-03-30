
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="com.suyambu.construction.model.Material"%>
  <style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>
<jsp:include page="header.jsp" />

			 <script type="text/javascript">

  $(document).ready(function(){
	  
	  $("#newPurchase").addClass("active");
	  $("#getPurchase").removeClass("active");

	  
	});
  </script>

  <h2>Purchase</h2>
  <div class="panel panel-primary">
    
    <form action = "newPurchase" method = "post"enctype="multipart/form-data" >
     <div class="panel-body">
     <input type ="hidden" value = "0" name="userId"/>
     <div class="form-group">
    <label for="materialId">Material :</label>
   <select name="materialId" id="materialSelector" class="form-control" style="width:50%;margin:auto"required = "true" >
   <c:forEach  items = "${materialList}" var="material">
   <option value="${material.id}">${material.name}</option>
   	</c:forEach>
   </select>
  </div>
  
  
   <div class="form-group">
    <label for="rate">Amount :</label>
    <input type="number"name="rate" readonly="true" class="form-control" style="width:50%;margin:auto"required = "true"  id="rate">
  </div>
  
  <div class="form-group">
    <label for="qty">Qty :</label>
    <input type="number"name="qty" onchange="calc()" class="form-control" style="width:50%;margin:auto"required = "true"  id="qty">
  </div>
  
  
   <div class="form-group">
    <label for="total">Total :</label>
    <input type="number"name="total" readonly="true" class="form-control" style="width:50%;margin:auto"required = "true"  id="total">
  </div>
  
   <div class="form-group">
    <label for="paid">Paid :</label>
    <input type="number"name="paid"onchange="calc()" class="form-control" style="width:50%;margin:auto"required = "true"  id="paid">
  </div>
  
   <div class="form-group">
    <label for="bending">Bending :</label>
    <input type="number"name="bending" readonly="true" class="form-control" style="width:50%;margin:auto"required = "true"  id="bending">
  </div>
  
  <div class="form-group">
    <label for="outStanding">Outstanding :</label>
    <input type="number"name="outStanding" readonly="true" class="form-control" style="width:50%;margin:auto"required = "true"  id="outStanding">
  </div>
  
   <div class="form-group">
    <label for="coolie">Coolie :</label>
    <input type="number"name="coolie" onchange="calc()" class="form-control" style="width:50%;margin:auto"required = "true"  id="coolie">
  </div>
 <div class="form-group date" data-provide="datepicker">
 <label for="date">Date :</label>
    <input type="text"name = "date" class="form-control" style="width:50%;margin:auto"required = "true"  id ="date">
    <div class="input-group-addon">
        <span class="glyphicon glyphicon-th"></span>
    </div>
</div>
</div>
<div class="panel-footer" style="text-align:center"> <button type="submit" class="btn btn-primary" onclick = "return check();" style="margin:auto;">Submit</button></div>
   
   
    </form>
    
    
    
  </div>
  
  <script>
  
  $(document).ready(function(){

	  $('#coolie').val(0);
	  $('#paid').val(0);
	  $('#outStanding').val(0);
	  $('#bending').val(0);
	  $('#total').val(0);
	  $('#rate').val(0);
	  $('#qty').val(0);

	});
  
  $(document).on("change", "#materialSelector", function(){
	 
	  var id =  $(this).val();
	  
	  $.ajax({
		    type : "GET",
		    url : "/purchase/getRate",
		    data : {
		        "id" : id
		    },
		    success: function(data){

		    	 $('#rate').val(data);
		    
		    }
		});
  });
  
 
 
  </script>
 
<script>


function calc(){
	  
	  var qty = document.getElementById("qty").value;
	  var amount = document.getElementById("rate").value;
	  var total = document.getElementById("total").value;
	  var bending = document.getElementById("bending").value;
	  var outStanding = document.getElementById("outStanding").value;
	  var paid = document.getElementById("paid").value;
	  var coolie = document.getElementById("coolie").value;
	  
	  total =  qty * amount;
	  total  = +total + +coolie;
	  
	  if(paid >= total) {
		  
		  bending = 0;
		  outStanding = paid - total;
		  
	  }else{
		  
		  outStanding = 0;
		  bending =  total - paid;
	  }
	  
	  
	  document.getElementById("total").value = total;
	  document.getElementById("bending").value = bending;
	  document.getElementById("outStanding").value = outStanding;

	  
}


</script>

<jsp:include page="footer.jsp" />
