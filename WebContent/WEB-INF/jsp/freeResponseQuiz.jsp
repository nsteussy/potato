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
					Your answer: <br /><input type="text" correct="${question.getAnswer()}" id="question${question.getUID()}" />
					<label style="display:none" id="answer${question.getUID()}">Correct answer: ${question.getAnswer()}</label>			
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
	
});

$('#retry').click(function() {
	location.reload();
});
</script>