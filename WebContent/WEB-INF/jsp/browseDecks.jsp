<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<h1>Browse Decks</h1>
	<table id="browse-decks-table" class="table table-striped table-hover">
		<thead><tr><th>Deck Name</th><th><span class="pull-right">Action</span></th></tr><thead>
		<tbody>
			<c:forEach items="${decks}"  var="deck">
				<c:if test="${!empty deck.nickname}">
					<tr>
						<td>${deck.nickname}</td>
						<td><span class="pull-right">
							<a href="${pageContext.request.contextPath}/controller/main/decks/${deck.deckId}"  style="margin-right:30px;">View</a>  
							<a href="${pageContext.request.contextPath}/controller/main/freeResponse/decks/${deck.deckId}" style="margin-right:30px;">Free Response Quiz</a> 
							<a href="${pageContext.request.contextPath}/controller/main/multChoice/decks/${deck.deckId}" style="margin-right:30px;">Multiple Choice Quiz</a>
							<a href="#" id="${deck.deckId}" class="shareDeckModal">Share</a>
						</span></td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>

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
<input id="rootContext" type="hidden" value="http://localhost:8080/FlashPotato/controller/main/decks/"/>
<script>
	$('#browse-decks-table').dataTable();
	$('.shareDeckModal').bind('click', function() {
		var id = $(this).attr('id');
		var contextPath = $('#rootContext').val();
		$('#deckUrl').val(contextPath + id);
		console.warn($('#deckUrl').val());
		$('#myModal').modal();  
	});
</script>