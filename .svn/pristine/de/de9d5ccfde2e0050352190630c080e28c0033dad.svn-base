<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<h3>
		Deck: ${deck.nickname}
	</h3>
	<c:forEach items="${deck.flashCards}" var="flashCard" varStatus="index">
		<div class="row">
	  		<div class="col-md-6 col-lg-6">
				<div id="${index.index}" class="panel panel-default front-flash-card">
					<div class="panel-body" style="text-align:center">
				    	<h4>${flashCard.front}</h4>
				    	<em>(Click to show back)</em>
				  	</div>
				</div>
			</div>
	  		<div class="col-md-6 col-lg-6">
				<div id="back-flash-card-${index.index}" class="panel panel-default back-flash-card" style="display:none;">
					<div class="panel-body" style="text-align:center;">
				    	<h4>${flashCard.back}</h4>
				    	<em>(Click to hide)</em>
				  	</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$('.front-flash-card').bind("click", function() {
	var id = $(this).attr('id');
	var backSelector = '#back-flash-card-'+id;
	$(backSelector).show();
});
$('.back-flash-card').bind("click", function() {
	$(this).hide();
});
</script>