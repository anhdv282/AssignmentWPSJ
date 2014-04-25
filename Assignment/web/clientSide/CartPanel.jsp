<%-- 
    Document   : CartPanel
    Created on : Apr 25, 2014, 1:03:33 PM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <article>
<<<<<<< HEAD
<<<<<<< HEAD
           
=======
=======
>>>>>>> b27974e0ab7f652aac1ea403b3ceef91a743bfff
            <h2>Shopping Cart</h2>
            <div>
            <c:if test="${sessionScope.cart!=null}">
                ${sessionScope.cart.getTotalItem()} items<br/>
                Total: ${sessionScope.cart.getTotalMoney()} $<br/>
            </c:if>
            <a href="ViewCart.jsp" class="detail">Detail</a>
            </div>
>>>>>>> b27974e0ab7f652aac1ea403b3ceef91a743bfff
        </article> 
    </body>
</html>
