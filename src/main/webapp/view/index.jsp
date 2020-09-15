<jsp:include page="header.jsp" />
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


	 <script type="text/javascript">

  $(document).ready(function(){

	  $("#newMaterial").addClass("active");
	  $("#materials").removeClass("active");

	  
	});
  </script>

  <h2>Add Material</h2>
  <div class="panel panel-primary">
    
    <form action = "newMaterial" method = "post"enctype="multipart/form-data" >
     <div class="panel-body">
   <div class="form-group">
    <label for="name">Material Name :</label>
    <input type="text"name="name" class="form-control" style="width:50%;margin:auto"required = "true"  id="start">
  </div>
  <div class="form-group">
    <label for="amount">Amount :</label>
    <input type="number"name="amount" class="form-control"style="width:50%;margin:auto;"required = "true" id="end">
  </div>
 
</div>
<div class="panel-footer" style="text-align:center"> <button type="submit" class="btn btn-primary" onclick = "return check();" style="margin:auto;">Submit</button></div>
   
   
    </form>
    
    
    
  </div>
  
 

<jsp:include page="footer.jsp" />
