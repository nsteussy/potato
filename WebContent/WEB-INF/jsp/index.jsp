<jsp:include page="header.jsp"></jsp:include>

<div class="jumbotron">
  <div class="container">
  	<img class='pull-left' src="${pageContext.request.contextPath}/img/potato.gif" />
    <h1>Study Faster!</h1>
    <p>Flash Potato makes it easy to study. Build a deck of flash cards and share it with your friends!</p>
    <p>
    	<a href="${pageContext.request.contextPath}/controller/main/deckCreator" class="btn btn-primary btn-lg" role="button" style="margin-right:20px;">Build a Deck &raquo;</a>
    	<a href="${pageContext.request.contextPath}/controller/main/login" class="btn btn-primary btn-lg" role="button"  style="margin-right:20px;">Log in</a>
    	<a href="${pageContext.request.contextPath}/controller/main/signUp" class="btn btn-primary btn-lg" role="button">Register</a>
    </p>
    <p>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>