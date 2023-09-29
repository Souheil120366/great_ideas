<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
	
	
</head>
<body>
	
	<div class="container-fluid vh-100 mt-5 custom-width  align-items-center">
		<div class="form-group mt-3 d-flex justify-content-between align-items-center">
			<h1>${idea.content}</h1>
			<p><a href="/ideas">Dashboard</a></p>
        </div> 
        <p>Created By: ${idea.user.userName}</p>
        <h2>Users who liked your idea:</h2>
        
        <table class="table">
	    <thead>
	        <tr>
	            <th>Name</th>
	            
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="oneUser" items="${userLike}">
	    		<tr>
	    			
	    			<td class="col-4"><c:out value="${oneUser.user.userName}"></c:out></a></td>
	    			
	    		</tr>
	    	</c:forEach>
	    </tbody>
	    </table>
        
        <c:set var="isUser" value="${idea.user.id == user.id}" />
        
        
        
        <div class="d-flex justify-content-end">
        	
        	<c:set var="ideaId" value="${idea.id}" />
        	
        
            <c:choose>
            	<c:when test="${isUser}">
            		<a href="/books/${bookId}/edit" class="btn btn-primary">
            			<c:out value="Edit" />
            		</a>
                	
                </c:when>
            </c:choose>
        </div> 
		
    </div>
    
    
</body>
</html>