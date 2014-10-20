<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<h1>Enter Name of Deck:</h1>
	<input id='main-flashcard-input-name' type='text' placeholder='Enter Name of Deck'>
	<button id="createDeckBtn" class="btn btn-md btn-primary">Create</button>
</div>
<script type="text/javascript">
var dm = new DeckManager();
var createDeck = function(e) {
	e.preventDefault();
	dm.create($('#main-flashcard-input-name').val()).then(function(res) {
		window.location.assign('/FlashPotato/controller/main/deckEditor/' + res['deckId']);
	});
};
$('#createDeckBtn').click(createDeck);
</script>
<jsp:include page='footer.jsp'></jsp:include>