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
        
        <header class="mainHeader">
            <hgroup>
                    <h1 id="site-logo"><a href="Home.jsp?txtSearch=&&page=1">I Love Shopping</a></h1>
                    <h2 id="site-description">cake cake</h2>
            </hgroup>
            <nav><ul>
                    <li ><a href="Home.jsp?txtSearch=&&page=1">Home</a></li>
                    <li class="active"><a href="About.jsp">About</a></li>
                    <li><a href="ViewCart.jsp">Shop</a></li>
                    <li ><a href="About.jsp">News</a></li>
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
                        <div style="margin-left: 30px;margin-right: 30px;">
                         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam lacinia porta arcu, eu iaculis ante scelerisque id. Cras et justo tincidunt, pellentesque enim eu, porttitor turpis. Ut a rhoncus risus. Ut sagittis hendrerit leo vel blandit. Quisque laoreet nunc suscipit, pulvinar nibh sed, gravida arcu. Maecenas lobortis tempus velit, non malesuada metus sollicitudin ac. Aliquam rhoncus, odio sed accumsan pulvinar, sapien mi molestie sapien, a eleifend eros ante non odio. Ut ullamcorper dictum turpis. Phasellus luctus tempor nulla, luctus laoreet mi sagittis ut. Ut hendrerit urna et pulvinar faucibus. Nunc bibendum porta eros ac rhoncus. Duis et ante fermentum, congue quam quis, imperdiet sem. Suspendisse quis orci suscipit, blandit eros ut, consectetur eros. In sapien sapien, pretium eget tortor tristique, aliquam dapibus lorem. Nulla arcu elit, tempus sit amet egestas eget, tristique id turpis.

Duis pellentesque convallis aliquet. In ac arcu est. Aenean lorem ante, hendrerit at lectus quis, feugiat molestie leo. Vivamus consequat eros et nunc pulvinar, eget vulputate diam consequat. Vestibulum congue ligula non massa venenatis rutrum. Mauris tellus odio, consectetur id mollis sed, semper at ante. Sed ut odio eu nisl ornare auctor. Curabitur libero nibh, hendrerit ac nibh at, varius hendrerit elit.

Phasellus magna est, dictum adipiscing placerat eu, venenatis quis lorem. Praesent cursus, diam at malesuada sollicitudin, elit tellus vehicula diam, vel ornare quam enim eu elit. Maecenas ut nisl eget nisl pharetra posuere. Vestibulum scelerisque eget nunc in pretium. Nunc ultricies ipsum auctor est adipiscing accumsan. Aliquam aliquam, nulla vitae pharetra pulvinar, arcu neque gravida sem, nec sodales arcu dolor in metus. Phasellus interdum luctus neque, in malesuada nisi suscipit in. Vivamus dapibus odio eget nunc elementum imperdiet ac nec massa. Nulla consectetur in mi non tristique. In lectus erat, elementum vitae magna nec, rhoncus fermentum erat.

Nunc euismod enim nec luctus suscipit. Aenean viverra ac ipsum congue dictum. Duis aliquet, massa sit amet tincidunt mattis, est orci tincidunt mauris, semper aliquet purus nunc congue odio. Nam eu dolor at justo facilisis facilisis quis non elit. Mauris semper sit amet tortor at cursus. Pellentesque sapien massa, vehicula hendrerit dignissim at, auctor nec nulla. Morbi a sapien erat. Pellentesque dolor urna, dictum non velit et, consequat dapibus sem. 
                        </div>
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
