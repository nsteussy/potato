<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<h3>
		Deck: ${deck.nickname}
	</h3>
	<hr>
	
	<c:forEach items="${quiz.questions}" var="question" varStatus="index">
		<div class="row">
	  		<div class="col-md-12 col-lg-12">
				
				<p><h4>${question.getClue()}</h4>
					Your answer: <br /><input type="text" correct="${question.getAnswer()}" id="guess${question.getUID()}" />
					<label style="display:none" id="answer${question.getUID()}">Correct answer: ${question.getAnswer()}</label>			
				</p>
				<hr>
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
	//Go through each question & check guess
	var curGuess;
	var guessDiv;
	var answerDiv;
	var nCorrect = 0;
	var total = 0;
	<c:forEach items="${quiz.questions}" var="question" varStatus="index">
		// get the id of div user entered their guess into.
		guessDiv = "guess" + "${question.getUID()}";
		// now check if it is correct, using info to color code and update score
		var guess = $(guessDiv).value;
		isCorrect = ${question.isCorrect(document.getElementById(guessDiv).value)};
		if (isCorrect){
			//color textbox green
			$(document.getElementById(guessDiv)).css('background-color', '#5cb85c');
			nCorrect++;
		} else { // incorrect guess
			// mark wrong answer red
			//$(guessDiv).css('background-color', '#d9534f');

			$(document.getElementById(guessDiv)).css('background-color', '#d9534f');
			//display correct answer
			answerDiv = "answer" + "${question.getUID()}";
			$(document.getElementById(answerDiv)).css('display', 'inline');
		}
		total++; // increment either way
	</c:forEach>
	
	// replace submit button with 'retry'
	$("#submitQuiz").css("display", "none");
	$("#retry").css("display", "inline-block");
	
	// display results
	$("#results").text("Correct: " + nCorrect + " / " + total)
	$("#results").css("display", "block");
});

$('#retry').click(function() {
	location.reload();
});
</script>