<%-- 
    Document   : Product
    Created on : 17-Apr-2014, 17:31:34
    Author     : vieta_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="mrBean" scope="session" class="model.DataClass"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Admin Page</title>
        <link href="../css/screen.css" rel="stylesheet" type="text/css"/>
        <script src="../js/sorttable.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page-top-outer">    

            <!-- Start: page-top -->
            <div id="page-top">

                <div class="clear"></div>

            </div>
            <!-- End: page-top -->

        </div>
        <!-- End: page-top-outer -->

        <div class="clear">&nbsp;</div>

        <!--  start nav-outer-repeat................................................................................................. START -->
        <div class="nav-outer-repeat"> 
            <!--  start nav-outer -->
            <div class="nav-outer"> 

                <!-- start nav-right -->
                <div id="nav-right">		
                    <div class="nav-divider">&nbsp;</div>
                    <a href="" id="logout"><img src="../images/shared/nav/nav_logout.gif" width="64" height="14" alt="" /></a>
                    <div class="clear">&nbsp;</div>		
                </div>
                <!-- end nav-right -->
                <!--  start nav -->
                <div class="nav">
                    <div class="table">		
                        <div class="nav-divider">&nbsp;</div>		                    
                        <ul class="current">
                            <li><a href="#nogo"><b>Products</b></a>
                                <div class="select_sub show">
                                    <ul class="sub">
                                        <li class="sub_show"><a href="Product.jsp">View all products</a></li>
                                        <li><a href="AddProduct.jsp">Add product</a></li>
                                    </ul>
                                </div>		
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="select">
                            <li><a href="CustomerList.jsp"><b>Customer</b></a>
                                	
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="select">
                            <li><a href="OrderList.jsp"><b>Orders</b></a>
                                
                                <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--  start nav -->

            </div>
            <div class="clear"></div>
            <!--  start nav-outer -->
        </div>
        <!--  start nav-outer-repeat................................................... END -->

        <div class="clear"></div>

        <!-- start content-outer ........................................................................................................................START -->
        <div id="content-outer">
            <!-- start content -->
            <div id="content">
                <!--  start page-heading -->
                <div id="page-heading">
                    <h1>All product</h1>
                </div>
                <!-- end page-heading -->

                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
                    <tr>
                        <th rowspan="3" class="sized"><img src="../images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
                        <th class="topleft"></th>
                        <td id="tbl-border-top">&nbsp;</td>
                        <th class="topright"></th>
                        <th rowspan="3" class="sized"><img src="../images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
                    </tr>
                    <tr>
                        <td id="tbl-border-left"></td>
                        <td>
                            <!--  start content-table-inner ...................................................................... START -->
                            <div id="content-table-inner">

                                <!--  start table-content  -->
                                <div id="table-content">	
                                    <c:if test="${param.txtSearch==null}">
                                        <c:redirect url="Product.jsp?txtSearch=&page=1"/>
                                    </c:if>
                                    <form action="Product.jsp?page=1" method="POST">
                                        Search by name: &nbsp; &nbsp;
                                        <input type="text" name="txtSearch" value="${param.txtSearch}"/>&nbsp;&nbsp;
                                        <input type="submit" value="Search"/>
                                    </form><br/>
                                    <!--  start product-table ..................................................................................... -->
                                    <form id="mainform" action="">
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table" class="sortable">
                                            <tr>
                                                <th style="width: 10%" class="table-header-repeat line-left"><a>Name</a>	</th>
                                                <th style="width: 10%" class="table-header-repeat line-left"><a>Category</a></th>
                                                <th style="width: 8%" class="table-header-repeat line-left"><a>Price</a></th>
                                                <th style="width: 5%" class="table-header-repeat line-left"><a>Quantity</a></th>
                                                <th style="width: 50%" class="table-header-repeat line-left"><a>Description</a></th>
                                                <th style="width: 10%" class="table-header-repeat line-left"><a>Image</a></th>
                                                <th style="width: 7%" class="table-header-repeat line-left"><a>Control</a></th>
                                            </tr>
                                            <c:forEach var="p" items="${mrBean.getData(param.txtSearch,param.page)}">
                                                <tr>
                                                    <td>${p.name}</td>
                                                    <td>${p.categoryName}</td>
                                                    <td>${p.price}</td>
                                                    <td>${p.quantity}</td>
                                                    <td>${p.description}</td>
                                                    <td>${p.img}</td>
                                                    <td class="options-width">
                                                        <a href="UpdateProduct.jsp?pId=${p.id}" title="Edit" class="icon-1 info-tooltip"></a>
                                                        <a href="../ProductServlet?action=deleteProduct&pId=${p.id}" title="Delete" class="icon-2 info-tooltip"></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        Page: &nbsp; <c:forEach var="i" items="${mrBean.totalPageCustomer}">
                                            <a href="Product.jsp?txtSearch=${param.txtSearch}&page=${i}">${i}</a>&nbsp;
                                        </c:forEach>
                                    </form>
                                </div>
                                <!--  end content-table  -->

                                <!--  start paging..................................................... -->

                                <!--  end paging................ -->

                                <div class="clear"></div>		 
                            </div>
                            <!--  end content-table-inner ............................................END  -->
                        </td>
                        <td id="tbl-border-right"></td>
                    </tr>
                    <tr>
                        <th class="sized bottomleft"></th>
                        <td id="tbl-border-bottom">&nbsp;</td>
                        <th class="sized bottomright"></th>
                    </tr>
                </table>
                <div class="clear">&nbsp;</div>

            </div>
            <!--  end content -->
            <div class="clear">&nbsp;</div>
        </div>
        <!--  end content-outer........................................................END -->
        <div class="clear">&nbsp;</div>

    </body>
</html>
