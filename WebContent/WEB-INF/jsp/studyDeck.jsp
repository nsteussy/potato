<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>
<style>
#f1_container {
  position: relative;
  margin: 10px auto;
  width: 450px;
  height: 200px;
  z-index: 1;
}
#f1_container {
  perspective: 1000;
}
#f1_card {
  width: 100%;
  height: 100%;
  transform-style: preserve-3d;
  transition: all 1.0s linear;
}
#f1_container:hover #f1_card {
  transform: rotateY(180deg);
  box-shadow: -5px 5px 5px #aaa;
}
.face {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}
.face.back {
  transform: rotateY(180deg);
  padding: 10px;
  color: black;
  text-align: center;
}
</style>
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