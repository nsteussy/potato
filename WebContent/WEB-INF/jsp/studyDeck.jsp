<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<h3>
		Deck: ${deck.nickname}
	</h3>
	<c:forEach items="${deck.flashCards}" var="flashCard" varStatus="index">
		<div id="f1_container">
			<div id="f1_card" class="shadow">
				<div class="front face">
					<div id="${index.index}" class="panel panel-default front-flash-card">
					<div class="panel-body" style="text-align:center; height:200px; vertical-align: middle;">
				    	<h4>${flashCard.front}</h4>
				  	</div>
				</div>
				</div>
				<div class="back face">
					<div class="panel-body" style="text-align:center; vertical-align: middle;">
				    	<h4>${flashCard.back}</h4>
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