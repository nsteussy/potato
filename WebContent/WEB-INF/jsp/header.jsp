<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS imports -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/DataTables-1.10.3/examples/resources/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

<!-- JavaScript Imports -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/DeckManager.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables-1.10.3/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/DataTables-1.10.3/examples/resources/bootstrap/3/dataTables.bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default main-navigation" role="navigation">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/controller/main/view">Flash Potato</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul id='main-navbar' class="nav navbar-nav navbar-left">
	        <li><a href="${pageContext.request.contextPath}/controller/main/deckCreator">Create a Deck</a></li>
	        <li><a href="${pageContext.request.contextPath}/controller/main/browseDecks">Browse Decks</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
	        <li><a href="${pageContext.request.contextPath}/controller/main/about">About</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container -->
	</nav>