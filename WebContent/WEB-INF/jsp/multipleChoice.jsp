<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<h3>
		Deck: ${deck.nickname}
	</h3>
	<c:forEach items="${quiz.questions}" var="question" varStatus="index">
		<div class="row">
	  		<div class="col-md-12 col-lg-12">
				
				<p><h4>${question.getClue()}</h4>
								
				<c:forEach items="${question.getChoices()}" var="choice" varStatus="choiceIndex">
					<p>
					<input type="radio" correct=${question.getAnswer().equals(choice)} name=${question.getClue()} id=${question.getUID(choiceIndex.index)} value=${choice}>
					<label for=${question.getUID(choiceIndex.index)}>${choice}</label>
					</p>
				</c:forEach>
				</p>
			</div>
		</div>
	</c:forEach>
	<div id="results" style="display:none"></div>
	<div id="submitQuiz" class="btn btn-default btn-lg">Submit</div>
	<div id="retry" style="display:none" class="btn btn-default btn-lg">Retry</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$('#submitQuiz').click(function() {
	$("input:checked[correct='false']").parent().css('background-color', '#d9534f');
	
	$("input[correct='true']").parent().css('background-color', '#5cb85c');
	$("#submitQuiz").css("display", "none");
	$("#retry").css("display", "inline-block");
	
	var correct = $("input:checked[correct='true']").length;
	var total = correct + $("input:checked[correct='false']").length;
	
	$("#results").text("Correct: " + correct + " / " + total)
	$("#results").css("display", "block");
});

$('#retry').click(function() {
	location.reload();
});
</script>