<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<H1>Login</H1>
		<form>
        <!-- <form id="form" action="<c:url value='/login.do'/>" method="POST">-->
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
            Username:<br>
            <input type="text" name="username" value=""/><br><br>
            Password:<br>
            <input type="password" name="password" value=""/>
             
           <!--  <input value="Login" name="submit" type="submit"/>-->
           
        </form>
         <br />
       <!--  <a href="${pageContext.request.contextPath}/controller/main/view" class="btn btn-primary">Register</a>
        <br />-->
        <div id="register" value="Create Account" class="btn btn-default btn-lg">Create Account</div>
        
        <br />OR:
        <br />
        <a href="${pageContext.request.contextPath}/controller/main/signUp" class="btn btn-primary">Create a new account</a>
</div>
<jsp:include page='footer.jsp'></jsp:include>