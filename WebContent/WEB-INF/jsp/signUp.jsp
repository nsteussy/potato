<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<H1>Create an Account</H1>
       <!-- <form id="form" action="<c:url value='/index.jsp'/>" method="POST">-->
       <form id="form">
         <!--  
            <c:if test="${not empty param.err}">
                <div><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></div>
            </c:if>
            <c:if test="${not empty param.out}">
                <div>You've logged out successfully.</div>
            </c:if>
            <c:if test="${not empty param.time}">
                <div>You've been logged out due to inactivity.</div>
            </c:if>
          --> 
            First Name:<br>
            <input type="text" name="fname" value=""/><br><br>
            Last Name:<br>
            <input type="text" name="lname" value=""/><br><br>
            Email Address:<br>
            <input type="text" name="email" value=""/><br><br> 
            Username:<br>
            <input type="text" name="username" value=""/><br><br>
            Password:<br>
            <input type="password" name="password" value=""/>
            
           <!--  <input id= "register" value="Create Account" name="register" type="submit"/> -->
        </form>
        <br />
       <!--  <a href="${pageContext.request.contextPath}/controller/main/view" class="btn btn-primary">Register</a>
        <br />-->
        <div id="register" value="Create Account" class="btn btn-default btn-lg">Create Account</div>
        <br />OR:
        <br />
        <a href="${pageContext.request.contextPath}/controller/main/login" class="btn btn-primary">Already have an account?</a>
	
</div>
<jsp:include page='footer.jsp'></jsp:include>

<script>
$('#register').click(function() {
	${user.setUsername(document.getElementById(username))};
	
	parent.location.href = "${pageContext.request.contextPath}/controller/main/view";
});
</script>