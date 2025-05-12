<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    // Invalidate the current session to log the user out
    session.invalidate();
    // Redirect the user to the login page
    response.sendRedirect("login.jsp");
%>