<jsp:include page='header.jsp'></jsp:include>
<div id='deck-loadbox' class='container'>
	<h1> Loading Deck &hellip; </h1>
</div>
<div id='deck-editbox' class='container' style='display: none;'>
	<input id='main-flashcard-input-name' type='text' placeholder='Enter Name of Deck'>
	<div id='main-flashcard-editbox-container'>
	  	<div id='main-flashcard-editbox-new' class='main-flashcard-editbox row'>
	  		<div class='col-md-5'>
	  			<div class='main-flashcard-container'>
			  		<div class='main-flashcard main-flashcard-front'>
			  			<textarea id='main-flashcard-input-front' class='main-flashcard-input' placeholder='Enter Card Front Content'></textarea>
			  		</div>
			  	</div>
		  	</div>
		  	<div class='col-md-5'>
			  	<div class='main-flashcard-container'>
			  		<div class='main-flashcard main-flashcard-back'>
			  			<textarea id='main-flashcard-input-back' class='main-flashcard-input' placeholder='Enter Card Back Content'></textarea>
		  			</div>
			  	</div>
		  	</div>
		  	<div class='col-md-2 main-builder-nav-container'>
		  		<button id="main-flashcard-input-save" class='btn btn-primary btn-block'>Add Card</button>
		  	</div>
	  	</div>
	</div>

	<button class='btn btn-lg btn-block btn-primary modal'>Share This Deck</button>
	<button class='btn btn-lg btn-block btn-primary'>Study This Deck</button>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Share this Deck!</h4>
			</div>
			<div class="modal-body">
				<input id="deckUrl" class="form-control" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
function drawCard(card, top) {
	var html = 
		"<div id='main-flashcard-editbox-" + card['flashCardId'] + "' data-cardid='" + card['flashCardId'] + "' class='main-flashcard-editbox row'>" +
			"<div class='col-md-5'>" +
				"<div class='main-flashcard-container'>" +
			  		"<div class='main-flashcard main-flashcard-front'>" +
			  			"<div class='main-flashcard-curtain'></div>" +
			  			"<textarea class='main-flashcard-input input-old card-front' placeholder='" + card['front'] + "'>" + card['front'] + "</textarea>" +
			  		"</div>" +
		  		"</div>" +
		  	"</div>" +
		  	"<div class='col-md-5'>" +
			  	"<div class='main-flashcard-container'>" +
			  		"<div class='main-flashcard main-flashcard-back'>" +
			  			"<div class='main-flashcard-curtain'></div>" +
			  			"<textarea class='main-flashcard-input input-old card-back' placeholder='" + card['back'] + "'>" + card['back'] + "</textarea>" +
		  			"</div>" +
			  	"</div>" +
		  	"</div>" +
		  	"<div class='col-md-2 main-builder-nav-container'>" +
		  		"<button class='btn btn-danger btn-block btn-delete-card'> Delete Card </button>" +
		  	"</div>" +
	  	"</div>";
	html = $(html);
	html.hide();
	$('#main-flashcard-editbox-new').before(html);
	html.slideDown();
	
}
var dm = new DeckManager();
var deckId = ${deckID};
var privateID = dm.hasDeck(deckId);
if (privateID != undefined) {
	var prom = dm.getDeckPublic(deckId);
	prom.then(function(data) {
		deck = data;
		$('#main-flashcard-input-name').val(deck['nickname']);
		for (var i = 0; i < deck['flashCards'].length; i++) {
			drawCard(deck['flashCards'][i], true);
		}
		$('#deck-loadbox').hide();
		$('#deck-editbox').show();
	});
} else {
	$('#deck-loadbox').html($('<h1> Sorry, this deck is not part of your collection. </h1><p>You must be on the same machine you used to create this deck.</p>'));
}

$(document).on('click', '#main-flashcard-input-save', function() {
	var front = $('#main-flashcard-input-front').val().trim();
	var back = $('#main-flashcard-input-back').val().trim();
	if (front != "" && back != "") {
		$('#main-flashcard-input-save').attr('disabled', 'disabled');
		$('#main-flashcard-input-front').attr('disabled', 'disabled');
		$('#main-flashcard-input-back').attr('disabled', 'disabled');
		cardAdded = dm.addCard(privateID, front, back);
		cardAdded.then(function(data) {
			drawCard(data, false);
			$('#main-flashcard-input-front').val('');
			$('#main-flashcard-input-back').val('');
			$('#main-flashcard-input-front').removeAttr('disabled');
			$('#main-flashcard-input-back').removeAttr('disabled');
			$('#main-flashcard-input-save').removeAttr('disabled');
			$('#main-flashcard-input-front').focus();
		});
	}
});

$(document).on('click', '.btn-delete-card', function() {
	var container = $(this).parents('.main-flashcard-editbox');
	var cardId = container.data('cardid');
	var prom = dm.deleteCard(privateID, cardId);
	showStatus(cardId, 'front', 'Deleting Card', '#900');
	showStatus(cardId, 'back', 'Deleting Card', '#900');
	container.find('.card-front').attr('disabled', 'disabled');
	container.find('.card-back').attr('disabled', 'disabled');
	prom.then(function(data) {
		container.slideUp(function() { $(this).remove(); });
	});
});

function showStatus(cardId, side, message, color) {
	var msg = '<span style="color:' + color + '">' + message + '</span>';
	if (side == 'front') {
		var container = $('#main-flashcard-editbox-' + cardId + ' .main-flashcard-front .main-flashcard-curtain');
	} else {
		var container = $('#main-flashcard-editbox-' + cardId + ' .main-flashcard-back .main-flashcard-curtain');
	}
	container.html(msg);
	container.fadeIn();
	return container;
}

$(document).on('change', '.main-flashcard-input.card-front, .main-flashcard-input.card-back', function() {
	var cardId = $(this).parents('.main-flashcard-editbox').data('cardid');
	var front = $('#main-flashcard-editbox-' + cardId + ' .card-front').val().trim();
	var back = $('#main-flashcard-editbox-' + cardId + ' .card-back').val().trim();
	var side = $(this).hasClass('card-front') ? 'front' : 'back';
	if (front != "" && back != "") {
		$(this).attr('disabled', 'disabled');
		var status = showStatus(cardId, side, 'Updating card.', 'green');
		var me = $(this);
		var prom = dm.updateCard(deckId, cardId, front, back);
		prom.then(function(data) {
			me.removeAttr('disabled');
			status.fadeOut();
		});
	} else {
		var status = showStatus(cardId, side, 'Card Cannot be blank. Re-setting.', '#900');
		status.fadeOut(2000);
		$(this).val($(this).attr('placeholder'));
	}
});
</script>

<jsp:include page='footer.jsp'></jsp:include>