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
        <title>Customer Admin Page</title>
        <link href="../css/screen.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="mrBean" scope="session" class="model.DataClass"/>
        <div id="page-top-outer">    

            <!-- Start: page-top -->
            <div id="page-top">

                <!--  start top-search -->
                <div id="top-search">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td><input type="text" value="Search" onblur="if (this.value == '') {
                                        this.value = 'Search';
                                    }" onfocus="if (this.value == 'Search') {
                                                this.value = '';
                                            }" class="top-search-inp" /></td>
                            <td>
                                <select  class="styledselect">
                                    <option value=""> All</option>
                                    <option value=""> Products</option>
                                    <option value=""> Customers</option>
                                    <option value=""> Orders</option>
                                </select> 
                            </td>
                            <td>
                                <input type="image" src="../images/shared/top_search_btn.gif"  />
                            </td>
                        </tr>
                    </table>
                </div>
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
                    <div class="showhide-account"><img src="../images/shared/nav/nav_myaccount.gif" width="93" height="14" alt="" /></div>
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
                            <li><a href="#nogo"><b>Products</b></a>
                                <div class="select_sub show">
                                    <ul class="sub">
                                        <li><a href="#nogo">View all products</a></li>
                                        <li><a href="#nogo">Add product</a></li>
                                        <li><a href="#nogo">Delete products</a></li>
                                    </ul>
                                </div>		
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="current">
                            <li><a href="#nogo"><b>Customer</b></a>
                                <div class="select_sub">
                                    <ul class="sub">
                                        <li class="select_sub"><a href="#nogo">Customer Management</a></li>

                                    </ul>
                                </div>		
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="select">
                            <li><a href="#nogo"><b>Orders</b></a>
                                <div class="select_sub">
                                    <ul class="sub">
                                        <li><a href="#nogo">Details 1</a></li>
                                        <li><a href="#nogo">Details 2</a></li>
                                        <li><a href="#nogo">Details 3</a></li>

                                    </ul>
                                </div>
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
                    <h1>Customer Management</h1>
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
                                      <c:if test="${param.txtSearch==null}">
                                        <c:redirect url="CustomerList.jsp?txtSearch="/>
                                    </c:if>
                                    <div style="float: right;">
                                    <form action="CustomerList.jsp" method="POST">
                                        Search by name: &nbsp; &nbsp;
                                        <input type="text" name="txtSearch" value="${param.txtSearch}"/>&nbsp;&nbsp;
                                        <input type="submit" value="Search"/>

                                    </form><br/>
                                    </div>
                                  


                                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">

                                        <tr>

                                            <th class="table-header-repeat line-left minwidth-1" style="width:20px;"><a href="">ID</a>	</th>
                                            <th class="table-header-repeat line-left minwidth-1"><a href="">Customer Name</a></th>
                                            <th class="table-header-repeat line-left"><a href="">Email</a></th>
                                            <th class="table-header-repeat line-left"><a href="">Address</a></th>
                                            <th class="table-header-repeat line-left"><a href="">Phone Number</a></th>
                                            <th class="table-header-options line-left minwidth-1" style="width:100px; "><a href="">Options</a></th>
                                        </tr>



                                        <c:forEach var="cus" items="${mrBean.getAllCustomer(param.txtSearch)}">
                                            <tr>

                                                <td>${cus.id}</td>
                                                <td>${cus.name}</td>
                                                <td>${cus.email}</td>
                                                <td>${cus.address}</td>
                                                <td>${cus.phone}</td>
                                                <td style="text-decoration: underline; color: #00cc33; font-weight: bold;"><a href="OrderDetails.jsp?id=${cus.id}" style="color: #009933;">View Order</td>





                                            </tr>




                                        </c:forEach>     
                                    </table>
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
