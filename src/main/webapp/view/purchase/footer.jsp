</div>

</div>
<div class="footer">
  <p>Any Queries please contact suyambu</p>
</div>

<style>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: #FFA000;
  color: white;
  text-align: center;
}
</style>
<script>
		$(document).ready(
				function() {
					var date_input = $('#date'); //our date input has the name "date"
					var container = $('.bootstrap-iso form').length > 0 ? $(
							'.bootstrap-iso form').parent() : "body";
				   var date = new Date();
				  date.setDate(date.getDate());

					var options = {
						format : 'yyyy/mm/dd',
						container : container,
						todayHighlight : true,
						autoclose : true,
						 startDate: date,
					};
					date_input.datepicker(options);
				})
	</script>
	
</body>
</html>
