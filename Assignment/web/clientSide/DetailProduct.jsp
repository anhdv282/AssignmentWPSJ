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
    <jsp:useBean id="mrBean" scope="session" class="model.DataClass"/>
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
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">News</a></li>
            </ul></nav>
            <form id="searchform">                                     
                    <form action="#" method="POST">
                        <input type="text" id="s" placeholder="Search" name="search"/>
                        <div class="btnSearch"><input type="submit" value="" name=""/></div>
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
                    ${param.id}
                </div>
                        
                </article>
                
		</div>
                    <aside class="top-sidebar">                        
                            <article>
                                <h2>Sign in</h2>
                            <form  action="#" autocomplete="on" method="post"> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Your email or username </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="e-mail"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="password" /> 
                                </p>
                                <p class="keeplogin"> 
                                    <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
                                    <label for="loginkeeping">Remember me</label>
                                    <input type="submit" value="Login" class="btnLogin"/>
                                </p>
                                
                                <p class="change_link">
                                    Not a member yet ?
                                    <a href="#toregister" class="to_register">Sign up</a>
                                </p>
                            </form>
                        </article>
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
