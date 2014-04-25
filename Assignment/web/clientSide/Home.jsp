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
        <c:if test="${param.txtSearch==null}">
                    <c:redirect url="Home.jsp?txtSearch=&page=1"/>
                </c:if>  
        <header class="mainHeader">
            <hgroup>
                    <h1 id="site-logo"><a href="#">I Love Shopping</a></h1>
                    <h2 id="site-description">cake cake</h2>
            </hgroup>
            <nav><ul>
                    <li class="active"><a href="Home.jsp">Home</a></li>
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
                <article class="topcontent">	
                        <img src="../images/blueberry-muffin-recipe1.jpg"/>					
                </article>

                <article class="bottomcontent">	
                    <header>
                            <h2>I love cake</h2>
                    </header>

                <div class="item-grid">
                    
                    <c:forEach var="p" items="${mrBean.getAllProduct(param.txtSearch,param.page)}">
                        <div class="item" style="background-image:url(../images/${p.img})">
                            <div class="info">
                            <div class="name">
                                <a href="../CartController?action=add&id=${p.id}"><img src="../images/cart_icon.png"/> </a>
                            <p><a href="DetailProduct.jsp&id=${p.id}" style="color:#FFF;">${p.name}</a></p>
                            </div>
                            <div class="hover-price">${p.price} $</div>
                            </div>
                        </div>
                    </c:forEach>                            
                        
                </div>
                    <div style="text-align: center;">
                    <c:forEach var="i" items="${mrBean.totalPageCustomer}">
                        <a href="Home.jsp?txtSearch=${param.txtSearch}&page=${i}">${i}</a>&nbsp;
                    </c:forEach>
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
                                    <li><a href="Home.jsp?txtSearch=c&&page=1">Pain</a> </li>
                                    <li><a href="Home.jsp?txtSearch=v&&page=1">Chocolate</a> </li>
                                    <li><a href="Home.jsp?txtSearch=n&&page=1">Cream </a> </li>
                                    <li><a href="Home.jsp?txtSearch=d&&page=1">Fruits </a> </li>
                                    <li><a href="Home.jsp?txtSearch=t&&page=1">Low Calories </a> </li>
                                </ul> 
                            </article>
                        </aside>				

                        <aside class="bottom-sidebar">
                            <jsp:include page="CartPanel.jsp" />
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
