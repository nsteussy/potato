<footer class="container main-footer">
	<p>Copyright &copy;2014 Flash Potato | SE 329 | Team 31: Potato </p>
</footer>
<script>
$(document).ready(function() {
	var dm = new DeckManager();
	var count = dm.getDeckCount();
	if (count > 0) {
		$('#main-navbar').append('<li><a href="${pageContext.request.contextPath}/controller/main/myDecks">Local Decks <span class="badge">' + count + '</span></a></li>');
	}
});
</script>
</body>
</html>