<%-- 
    Document   : Customer
    Created on : 17-Apr-2014, 17:31:34
    Author     : datht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details Admin Page</title>
        <link href="../css/screen.css" rel="stylesheet" type="text/css"/>
        <script src="../js/sorttable.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:useBean id="mrBean" scope="session" class="model.DataClass"/>
        <div id="page-top-outer">    

            <!-- Start: page-top -->
            <div id="page-top">

                
                <!--  end top-search -->
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
                        <ul class="select">
                            <li><a href="Product.jsp"><b>Products</b></a>
                                <div class="select_sub show">
                                    <ul class="sub">
                                        <li><a href="Product.jsp">View all products</a></li>
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

                        <ul class="current">
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
                <c:if test="${param.id==null}">
                    <c:redirect url="OrderList.jsp?page=1"/>
                </c:if>
                <!--  start page-heading -->
                <div id="page-heading">
                    <h1>Detail Order: ${param.id}</h1> 
                    
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
                                    <!--  start product-table ..................................................................................... -->



                                    <div style="font-weight: bolder; font-size: medium;">
                                     <c:forEach var="os" items="${mrBean.getOrderByID(param.id)}">
                                       
                                          Customer Name: <a class="dat">${os.customerName}</a> &nbsp;
                                            Address: <a class="dat">${os.customerAddress}</a> &nbsp;
                                            Email: <a class="dat">${os.customerEmail}</a> &nbsp;
                                            Phone: <a class="dat">${os.customerPhone}</a> &nbsp;
                                    </c:forEach>
                                    </div><br/>
                                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table" class="sortable">

                                        <tr>

                                            
                                            <th class="table-header-repeat line-left minwidth-1" style="max-width:70px;  "><a>Product Name</a></th>
                                            <th class="table-header-repeat line-left"><a>Price</a></th>
                                            <th class="table-header-repeat line-left"><a>Quantity</a></th>
                                            <th class="table-header-repeat line-left minwidth-1" style="max-width: 100px;"><a>Total Price</a></th>

                                        </tr>
                                        <c:forEach var="od" items="${mrBean.getOrderDetails(param.id)}">
                                            <tr>

                                              
                                                <td>${od.productName}</td>
                                                <td>${od.price}</td>
                                                <td>${od.quantity}</td>
                                                <td>${od.sumPrice}</td>
                                            </tr>
                                        </c:forEach>     
                                    </table><br/>
                                    <div style="font-weight: bolder; font-size: large;">
                                     <c:forEach var="os" items="${mrBean.getOrderByID(param.id)}">
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Order Total Price: <a class="dat">${os.price}</a>&nbsp;$ &nbsp;
                                         &nbsp;&nbsp;&nbsp; Status: <a class="dat">${os.status}</a> &nbsp;
                                          <form action="../UpdateOrderDetails?id=${param.id}" method="POST" style="float: right;">
                                              <select  class="styledselect" name="select">
                                                  <option value="1"> Completed</option>
                                    <option value="2"> Cancel</option>
                                    <option value="0"> In Process</option>
                                    
                                          </select>
                                              <input type="submit" value="Change Status" class="styledselect"/>
                                    </form>

                                               

                                    </c:forEach>
                                         
                                </select> 
                                    </div>
                                    <!--  end product-table................................... --> 

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
