<jsp:include page='header.jsp'></jsp:include>
<div class='container'>
	<H1>Create an Account</H1>
        <form id="form" action="<c:url value='/register.do'/>" method="POST">
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
            
            <input value="Create Account" name="register" type="submit"/>
        </form>
        <br />OR:
        <br />
        <a href="${pageContext.request.contextPath}/controller/main/login" class="btn btn-primary">Already have an account?</a>
	
</div>
<jsp:include page='footer.jsp'></jsp:include>