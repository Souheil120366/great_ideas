<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<title>Read Share</title>
	
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	
	<!-- For any Bootstrap that uses JS -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript" src="/js/clearErrors.js"></script>		
	
</head>
<body>
	
	<div class="container-fluid vh-100 mt-5 custom-width align-items-center">
		 
		<h1>Book Club</h1>
		<h2>A place for friends to share thoughts on books.</h2>
		
		<div class="form-group mt-3 d-flex justify-content-between">
		
			<div class="col-md-5">
				
				<h2>Register</h2>
				<br>
				<form:form action="/register" method="POST" modelAttribute="newUser">
				
					<form:errors id="userNameErrors" path="userName" class="text-danger"/>
					<div class="form-group d-flex align-items-center">
		            	<form:label class="col-md-3" path="userName">User Name: </form:label>
		            	<form:input type="text" class="form-control" id="userName" path="userName"/>
		            </div>
		            <br>
		            <form:errors id="emailErrors" path="email" class="text-danger"/>
					<div class="form-group d-flex align-items-center">
		            	<form:label class="col-md-3" path="email">Email: </form:label>
		            	<form:input type="email" class="form-control" id="email" path="email"/>
		            </div>
		            <br>
		            <form:errors id="passwordErrors" path="password" class="text-danger"/>
					<div class="form-group d-flex align-items-center">
		            	<form:label class="col-md-3" path="password">Password: </form:label>
		            	<form:input type="password" class="form-control" id="password" path="password"/>
		            </div>
		            <br>
		            <form:errors id="confirmErrors" path="confirm" class="text-danger"/>
					<div class="form-group d-flex align-items-center">
		            	<form:label class="col-md-3" path="confirm">Confirm PW: </form:label>
		            	<form:input type="password" class="form-control" id="confirm" path="confirm"/>
		            </div>
		            <br>
		            <div class="d-flex mt-2 justify-content-end">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
    			
    			</form:form>
    		</div>
    		<div class="col-md-5">
    			<h2>Log In</h2>
    			<br>
    			<form:form action="/login" method="POST" modelAttribute="newLogin">
    				<form:errors id="emailErrors" path="email" class="text-danger"/>
    				<div class="form-group d-flex align-items-center">
	            		<form:label class="col-md-3" path="email">Email: </form:label>
	            		<form:input type="email" class="form-control" id="email" path="email"/>
	            	</div>
	            	<br>
	            	<form:errors id="passwordErrors" path="password" class="text-danger"/>
	            	<div class="form-group d-flex align-items-center">
	            		<form:label class="col-md-3" path="password">Password: </form:label>
	            		<form:input type="password" class="form-control" id="password" path="password"/>
	            	</div>
	            	<br>
					<div class="d-flex mt-2 justify-content-end">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
					
				</form:form>
			</div>
			
		</div>
		    
    </div>
    
</body>
</html>