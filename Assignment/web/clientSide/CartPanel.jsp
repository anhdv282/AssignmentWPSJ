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
            <c:set var="cart" value="${sessionScope['cart']}"/>
            <h2>Shopping Cart</h2>
            <div>
            <p>${cart.getTotalItem()}</p>
            <p>Totals: ${cart.getTotalMoney()}</p>
            <a href="ViewCart.jsp" class="detail">Detail</a>
            </div>
        </article> 
    </body>
</html>
