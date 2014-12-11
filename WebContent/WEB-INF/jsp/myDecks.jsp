<jsp:include page='header.jsp'></jsp:include>
<div id='main-container' class='container'>
	<h1>Local Decks <small id='your-decks-loading'>loading &hellip;</small></h1>
	<table id='your-decks' class='table table-striped table-hover' style='display: none;'>
		<thead>
			<tr>
				<th> Deck Name </th>
				<th> <span class='pull-right'>Action</span> </th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<script type="text/javascript">
var dm = new DeckManager();
var count = dm.getDeckCount();
if (count > 0) {
	var decks = dm.getMyDecks();
	for (var deckId in decks) {
		var prom = dm.getDeckPublic(deckId);
		prom.then(function(data) {
			console.log(data);
			$('#your-decks').fadeIn();
			$('#your-decks-loading').fadeOut();
			var row = '<tr>' + 
				'<td>' + 
					data['nickname'] + ' <span class="badge">' + data['flashCards'].length + ' cards</span></td>' +
				'<td><span class="pull-right">' +
				'<a href="${pageContext.request.contextPath}/controller/main/decks/' + data['deckId'] + '" style="margin-right:30px;">View</a>  ' +
				'<a href="${pageContext.request.contextPath}/controller/main/deckEditor/' + data['deckId'] + '" style="margin-right:30px;">Edit</a>' +
				'<a href="#" style="margin-right:30px;">Share</a> ' +
				'<a href="#" style="margin-right:30px;">Free Response Quiz</a> ' +
				'<a href="${pageContext.request.contextPath}/controller/main/multChoice/decks/' + data['deckId'] + '">Multiple Choice Quiz</a>  ' +
				'</span></td></tr>';
			$('#your-decks tbody').append(row);
		});
	}
} else {
	$('#your-decks-loading').hide();
	$('#main-container').append('<p>Sorry, you don\'t have any decks stored.</p>');
}

</script>
<jsp:include page='footer.jsp'></jsp:include>