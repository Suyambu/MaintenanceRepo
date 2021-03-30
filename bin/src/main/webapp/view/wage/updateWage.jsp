
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	  
	  $("#newWage").addClass("active");
	  $("#getWage").removeClass("active");

	  
	});
  </script>

  <h2>Purchase</h2>
  <div class="panel panel-primary">
    
    <form action = "updateWage" method = "post"enctype="multipart/form-data" >
     <div class="panel-body">
     
   <div class="form-group">
    <label for="workName">Work Name :</label>
    <input type="text"name="workName" value="${wage.workName}" class="form-control" style="width:50%;margin:auto"required = "true"  id="workName">
  </div>
  
  <div class="form-group">
    <label for="workerName">Worker Name :</label>
    <input type="text"name="workerName" value="${wage.workerName}" class="form-control" style="width:50%;margin:auto"required = "true"  id="workerName">
  </div>
  
  
   <div class="form-group">
    <label for="amount">Amount Paid :</label>
    <input type="number"name="amount" value="${wage.amount}" class="form-control" style="width:50%;margin:auto"required = "true"  id="amount">
  </div>
 
</div>
<div class="panel-footer" style="text-align:center"> <button type="submit" class="btn btn-primary" onclick = "return check();" style="margin:auto;">Submit</button></div>
    </form>
    
    
    
  </div>
  

<jsp:include page="footer.jsp" />
