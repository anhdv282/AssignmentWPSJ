<%-- 
    Document   : ViewCart
    Created on : Apr 8, 2014, 9:27:37 AM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
        <link href="../css/style2.css" rel="stylesheet" type="text/css"/>
        <link href="../css/media-queries2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="body">
        <header class="mainHeader">
            <hgroup>
                    <h1 id="site-logo"><a href="#">I Love Shopping</a></h1>
                    <h2 id="site-description">cake cake</h2>
            </hgroup>
            <nav><ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li class="active"><a href="ViewCart.jsp">Shop</a></li>
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
                    <jsp:include page="MyCart.jsp"/>
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
