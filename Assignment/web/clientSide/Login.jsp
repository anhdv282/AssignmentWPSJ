<%-- 
    Document   : Login
    Created on : Apr 25, 2014, 11:32:05 AM
    Author     : DucNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <article>
            <c:choose>
                <c:when test="${(empty cookie['username']) && (empty sessionScope['username'])}" >
                    <h2>Sign in</h2>
                    <form  action="../LoginController?action=login" autocomplete="on" method="post"> 
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
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${not empty cookie['username']}">
                            <c:set var="username" scope="session" value="${cookie['username']}"/>
                            <h2>Welcome</h2>
                            <div class="welcome">
                                Welcome <b>${username.getValue()}</b>
                                <a href="../LoginController?action=logout" >Log out</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:set var="username" scope="session" value="${sessionScope['username']}"/>
                            <h2>Welcome</h2>
                            <div class="welcome">
                                Welcome <b>${username}</b>
                                <a href="../LoginController?action=logout" >Log out</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>    
        </article>
    </body>
</html>
