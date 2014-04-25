<%-- 
    Document   : Home
    Created on : 17-Apr-2014, 15:46:36
    Author     : vieta_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="SearchByName" uri="/WEB-INF/tlds/myFunction"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
        <link href="../css/style2.css" rel="stylesheet" type="text/css"/>
        <link href="../css/media-queries2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="body">
        <jsp:useBean id="mrBean" scope="session" class="model.DataClass"/>
          
        <header class="mainHeader">
            <hgroup>
                    <h1 id="site-logo"><a href="Home.jsp?txtSearch=&&page=1">I Love Shopping</a></h1>
                    <h2 id="site-description">cake cake</h2>
            </hgroup>
            <nav><ul>
                    <li class="active"><a href="Home.jsp?txtSearch=&&page=1">Home</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li><a href="ViewCart.jsp">Shop</a></li>
                    <li><a href="About.jsp">News</a></li>
            </ul></nav>
            <form id="searchform">                                     
                    <form action="Home.jsp" method="POST">
                        <input type="text" id="s" placeholder="Search" name="txtSearch" value="${param.txtSearch}"/>
                        <input type="text" value="1" name="page" style="visibility: hidden; position: absolute;"/>
                        <div class="btnSearch"><input type="submit" value=""/></div>
                    </form>
            </form>
	</header>
        <div class="mainContent">
            <div class="content">
                <article class="bottomcontent">	
                    <header>
                            <h2>I love cake</h2>
                    </header>
                  
                        
                <div class="product">
                    <c:forEach var="p" items="${mrBean.getProduct(param.id)}">
                        <p class="productName">${p.name}</p>
                        
                        <p><img src="../images/${p.img}"/></p>
                        <div class="productGroup1">
                        ${p.price}$
                        <a class="productPrice" href="../CartController?action=add&id=${p.id}"><img src="../images/cart_icon.png"/> </a>
                        </div>
                        <p class="productDescription">${p.description}</p>
                    </c:forEach>    
                </div>
                    <div style="text-align: center;">
                   
                    </div>
                </article>
                
		</div>
                    <aside class="top-sidebar">
                        <jsp:include page="Login.jsp" />
                    </aside>

                        <aside class="middle-sidebar">                            
                            <article>
                                <h2>Category</h2>
                                <ul>
                                        <li><a href="#">Pain</a> </li>
                                        <li><a href="#">Chocolate</a> </li>
                                        <li><a href="#">Cream </a> </li>
                                        <li><a href="#">Fruits </a> </li>
                                        <li><a href="#">Low Calories </a> </li>
                                </ul> 
                            </article>
                        </aside>				

                        <aside class="bottom-sidebar">                            
                            <article>
                                <h2>Shopping Cart</h2>
                                <div>
                                <p>03 items</p>
                                <p>Totals: $1000</p>
                                <a href="#" class="detail">Detail</a>
                                </div>
                            </article>  
                        </aside>	
	</div>
	
	<footer class="mainFooter">
            <p>I love cake</p>
            <img src="../images/PNG/24/social-006_facebook.png"/>
            <img src="../images/PNG/24/social-003_twitter.png"/>
            <img src="../images/PNG/24/social-004_flickr.png"/>
            <img src="../images/PNG/24/social-009_google.png"/>
            <img src="../images/PNG/24/social-019_delicious.png"/>
	</footer>

</body>
</html>
