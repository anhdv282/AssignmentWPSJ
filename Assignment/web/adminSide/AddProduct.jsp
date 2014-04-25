<%-- 
    Document   : addProduct
    Created on : 17-Apr-2014, 20:58:48
    Author     : vieta_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="AddProduct" uri="/WEB-INF/tlds/myFunction"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<jsp:useBean id="mrBean" scope="session" class="model.DataClass"/>
<jsp:useBean id="product" scope="page" class="entity.Product" />
<jsp:useBean id="dataClass" scope="request" class="model.DataClass" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add product admin Page</title>
        <script src="../js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script> 
        <!--  checkbox styling script -->
        <script src="../js/jquery/ui.core.js" type="text/javascript"></script>
        <link href="../css/screen.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery/ui.checkbox.js" type="text/javascript"></script>
        <script src="../js/jquery/jquery.bind.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $('input').checkBox();
                $('#toggle-all').click(function() {
                    $('#toggle-all').toggleClass('toggle-checked');
                    $('#mainform input[type=checkbox]').checkBox('toggle');
                    return false;
                });
            });
        </script>  

        <!--  styled select box script version 1 -->
        <script src="../js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.styledselect').selectbox({inputClass: "selectbox_styled"});
            });
        </script>


        <!--  styled select box script version 2 --> 
        <script src="../js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.styledselect_form_1').selectbox({inputClass: "styledselect_form_1"});
                $('.styledselect_form_2').selectbox({inputClass: "styledselect_form_2"});
            });
        </script>

        <!--  styled select box script version 3 --> 
        <script src="../js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.styledselect_pages').selectbox({inputClass: "styledselect_pages"});
            });
        </script>

        <!--  styled file upload script --> 
        <script src="../js/jquery/jquery.filestyle.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            $(function() {
                $("input.file_1").filestyle({
                    image: "../images/forms/upload_file.gif",
                    imageheight: 29,
                    imagewidth: 78,
                    width: 300
                });
            });
        </script>

        <!-- Custom jquery scripts -->
        <script src="../js/jquery/custom_jquery.js" type="text/javascript"></script>

        <!-- Tooltips -->
        <script src="../js/jquery/jquery.tooltip.js" type="text/javascript"></script>
        <script src="../js/jquery/jquery.dimensions.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $('a.info-tooltip ').tooltip({
                    track: true,
                    delay: 0,
                    fixPNG: true,
                    showURL: false,
                    showBody: " - ",
                    top: -35,
                    left: 5
                });
            });
        </script> 

        <!--  date picker script -->
        <link rel="stylesheet" href="../css/datePicker.css" type="text/css" />
        <script src="../js/jquery/date.js" type="text/javascript"></script>
        <script src="../js/jquery/jquery.datePicker.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            $(function()
            {

                // initialise the "Select date" link
                $('#date-pick')
                        .datePicker(
                                // associate the link with a date picker
                                        {
                                            createButton: false,
                                            startDate: '01/01/2005',
                                            endDate: '31/12/2020'
                                        }
                                ).bind(
                                        // when the link is clicked display the date picker
                                        'click',
                                        function()
                                        {
                                            updateSelects($(this).dpGetSelected()[0]);
                                            $(this).dpDisplay();
                                            return false;
                                        }
                                ).bind(
                                        // when a date is selected update the SELECTs
                                        'dateSelected',
                                        function(e, selectedDate, $td, state)
                                        {
                                            updateSelects(selectedDate);
                                        }
                                ).bind(
                                        'dpClosed',
                                        function(e, selected)
                                        {
                                            updateSelects(selected[0]);
                                        }
                                );

                                var updateSelects = function(selectedDate)
                                {
                                    var selectedDate = new Date(selectedDate);
                                    $('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
                                    $('#m option[value=' + (selectedDate.getMonth() + 1) + ']').attr('selected', 'selected');
                                    $('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
                                };
                                // listen for when the selects are changed and update the picker
                                $('#d, #m, #y')
                                        .bind(
                                                'change',
                                                function()
                                                {
                                                    var d = new Date(
                                                            $('#y').val(),
                                                            $('#m').val() - 1,
                                                            $('#d').val()
                                                            );
                                                    $('#date-pick').dpSetSelected(d.asString());
                                                }
                                        );

                                // default the position of the selects to today
                                var today = new Date();
                                updateSelects(today.getTime());

                                // and update the datePicker to reflect it...
                                $('#d').trigger('change');
                            });
        </script>

        <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
        <script src="../js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(document).pngFix( );
            });
        </script>
    </head>
    <body> 
        <!-- Start: page-top-outer -->
        <div id="page-top-outer">    

            <!-- Start: page-top -->
            <div id="page-top">

                <!-- start logo -->

                <!-- end logo -->


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

                    <!--  start account-content -->	

                    <!--  end account-content -->

                </div>
                <!-- end nav-right -->


                <!--  start nav -->
                <div class="nav">
                    <div class="table">

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="current"><li><a href="#nogo"><b>Products</b><!--[if IE 7]><!--></a><!--<![endif]-->
                                <!--[if lte IE 6]><table><tr><td><![endif]-->
                                <div class="select_sub show">
                                    <ul class="sub">
                                        <li><a href="Product.jsp">View all products</a></li>
                                        <li class="sub_show"><a href="AddProduct.jsp">Add product</a></li>
                                    </ul>
                                </div>
                                <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="select"><li><a href="#nogo"><b>Customers</b><!--[if IE 7]><!--></a><!--<![endif]-->
                                <!--[if lte IE 6]><table><tr><td><![endif]-->
                                <div class="select_sub">
                                    <ul class="sub">
                                        <li><a href="#nogo">View all customers</a></li>
                                        <li><a href="#nogo">Edit customers</a></li>
                                        <li><a href="#nogo">Delete customers</a></li>
                                    </ul>
                                </div>
                                <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                            </li>
                        </ul>

                        <div class="nav-divider">&nbsp;</div>

                        <ul class="select"><li><a href="#nogo"><b>Orders</b><!--[if IE 7]><!--></a><!--<![endif]-->
                                <!--[if lte IE 6]><table><tr><td><![endif]-->
                                <div class="select_sub">
                                    <ul class="sub">
                                        <li><a href="#nogo">View all orders</a></li>
                                        <li><a href="#nogo"></a></li>
                                        <li><a href="#nogo"></a></li>
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

        <!-- start content-outer -->
        <div id="content-outer">
            <!-- start content -->
            <div id="content">


                <div id="page-heading"><h1>Add product</h1></div>


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
                            <!--  start content-table-inner -->
                            <div id="content-table-inner">

                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td>



                                            <!-- start id-form -->
                                            <form action="../ProductServlet?action=addProduct" method="POST">
                                                <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                                                    <tr>
                                                        <th valign="top">Product name:</th>
                                                        <td><input type="text" class="inp-form" name="txtProductName" /></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Category:</th>
                                                        <td>	
                                                            <select class="styledselect_form_1" name="txtCategory" >
                                                                <c:forEach var="p" items="${mrBean.category}">
                                                                    <option value="${p.categoryID}">${p.categoryName}</option>            
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        <td></td>
                                                    </tr>

                                                    <tr>
                                                        <th valign="top">Price:</th>
                                                        <td><input type="text" class="inp-form" name="txtPrice" /></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Quantity:</th>
                                                        <td><input type="text" class="inp-form" name="txtQuantity" /></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Description:</th>
                                                        <td><textarea rows="" cols="" class="form-textarea" name="txtDescription"></textarea></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <form action="UploadProcess" method="post" enctype="multipart/form-data">
                                                        <th>Image:</th>
                                                        <td><input type="file" class="file_1" name="txtImage" /></td>
                                                        <td>
                                                            <div class="bubble-left"></div>
                                                            <div class="bubble-inner">JPEG, GIF 5MB max per image</div>
                                                            <div class="bubble-right"></div>
                                                        </td>
                                                        <td><input type="submit" value="upload" /></td>
                                                        </form>
                                                    </tr> 
                                                    <tr>
                                                        <th>&nbsp;</th>
                                                        <td valign="top">
                                                            <input type="submit" value="" class="form-submit" />
                                                            <input type="reset" value="" class="form-reset"  />
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>

                                            </form>
                                            <!-- end id-form  -->




                                        </td>
                                        <td>

                                            <!--  start related-activities -->
                                            <!-- end related-act-top -->

                                            <!--  start related-act-bottom -->

                                            <!-- end related-activities -->

                                        </td>
                                    </tr>
                                    <tr>
                                        <td><img src="../images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
                                        <td></td>
                                    </tr>
                                </table>

                                <div class="clear"></div>


                            </div>
                            <!--  end content-table-inner  -->
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
        <!--  end content-outer -->
        <div class="clear">&nbsp;</div>

    </body>
</html>
