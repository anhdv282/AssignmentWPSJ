<%-- 
    Document   : MyCart
    Created on : Apr 25, 2014, 3:34:30 PM
    Author     : DucNM
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="entity.Product"%>
<%@page import="entity.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="../CartController?action=edit" method="POST" >
            <div class="CSSTableGenerator">
            <table>
                <tr>
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Product Price</td>
                    <td>Quantity</td>
                    <td>Amount</td>
                    <td class="sorttable_nosort">Delete</td>
                </tr>
                <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart != null) {
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
                    <td><%=price%> $</td>
                    <td><input type="number" min="1" max="100" step="1" name="quantity" value="<%=quantity%>"/> <input type="hidden" name="id" value="<%=id%>"/></td>
                    <td>$ <%=amount%> $</td>
                    <td><a href="../CartController?action=del&id=<%=id%>" >Delete</a></td>
                </tr>
                <%}} else {%>
                    <td>There are no item in your cart</td>
                <%}%>
            </table>
            </div>
                <div style="text-align: center">
                <input type="submit" value="Update"/>
                <input type="submit" value="Checkout"/>
                </div>
        </form>
    </body>
</html>
