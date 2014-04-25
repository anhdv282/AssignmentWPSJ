<%-- 
    Document   : ViewCart
    Created on : Apr 8, 2014, 9:27:37 AM
    Author     : DucNM
--%>

<%@page import="entity.Product"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <script src="Script/sorttable.js"></script>
        <link href="Css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="CartController?action=edit" method="POST">
            <table class="sortable">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Quantity</th>
                    <th>Amount</th>
                    <th class="sorttable_nosort">Delete</th>
                </tr>
                <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    Hashtable<Product,Integer> content = cart.getContent();
                    Enumeration enumeration = content.keys();

                    while(enumeration.hasMoreElements()) {
                        Product p = (Product)enumeration.nextElement();
                        int quantity = Integer.parseInt(content.get(p).toString());
                        int id = p.getId();
                        String name = p.getName();
                        float price = p.getPrice();
                        float amount = p.getPrice() * quantity;
                %>
                <tr>
                    <td><%=id%></td>
                    <td><%=name%></td>
                    <td><%=price%></td>
                    <td><input type="number" min="1" max="10" step="1" name="quantity" value="<%=quantity%>"/> <input type="hidden" name="id" value="<%=id%>"/></td>
                    <td><%=amount%></td>
                    <td><a href="CartController?action=del&id=<%=id%>" >Delete</a></td>
                </tr>
                <%}%>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="submit" value="Update"/></td>
                    <td><input type="submit" value="Checkout"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
