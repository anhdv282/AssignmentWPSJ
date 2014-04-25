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
            <h2>Shopping Cart</h2>
            <div>
            <c:if test="${sessionScope.cart!=null}">
                ${sessionScope.cart.getTotalItem()} items<br/>
                Total: ${sessionScope.cart.getTotalMoney()} $<br/>
            </c:if>
           <c:if test="${sessionScope.cart==null}">
                0 items<br/>
                Total: 0 $<br/>
            </c:if>
            <a href="ViewCart.jsp" class="detail">Detail</a>
            </div>
        </article> 
    </body>
</html>
