</div>

<p>Footer</p>
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