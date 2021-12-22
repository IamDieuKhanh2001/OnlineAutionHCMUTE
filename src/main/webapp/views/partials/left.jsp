<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ute.onlineautionhcmute.beans.ProductType" %>
<%--
  Created by IntelliJ IDEA.
  User: TomPC
  Date: 11/29/2021
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%--De su dung JSTL, can mo ta--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.Category>" />
<jsp:useBean id="listProductTypeWithDetails" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.ProductType>" />




<%
    int nCount = 0;
%>

    <div class="card">
        <h4 class="card-header bg-dark text-light">Danh mục</h4>
        <div class="list-group">

            <c:forEach var="category" items="${categoriesWithDetails}" >
                <a type="button" class="btn btn-group text-light bg-secondary rounded-0 border border-dark py-3" data-toggle="collapse" data-target="#collapse-${category.id}" aria-expanded="true">
                        ${category.name}
                </a>
                <div id="collapse-${category.id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body">

                <%
                    for(int i = nCount; i < listProductTypeWithDetails.size(); i++)
                    {
                        nCount = i;
                        ProductType productType = listProductTypeWithDetails.get(i);
                        if(productType == null)
                        {
                            nCount = i + 1;
                            break;
                        }
                        else
                        {
                %>
                        <a type="button" name="item-menu" class="btn btn-outline-success w-100 mb-1" href="${pageContext.request.contextPath}/Product/ByProID?id=<%= productType.getId() %>" role="button"><%= productType.getName() %></a>
                <%
                        }
                    }
                %>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>