<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categories" scope="request" type="java.util.List<com.ute.onlineautionhcmute.beans.Category>" />
<jsp:useBean id="listProductType" scope="request" type="java.util.Hashtable<java.lang.String, java.util.List<com.ute.onlineautionhcmute.beans.ProductType>>" />

<div class="card">
    <h4 class="card-header bg-dark text-light">Categories</h4>
    <div class="list-group">
        <c:forEach items="${categories}" var="category">
            <a type="button" class="btn btn-group text-light bg-secondary rounded-0 border border-dark py-3" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true">
                ${category.name}
                ${listProductType.get('"' + category.id + '"')[0].name}
            </a>

            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">
                    <a type="button" class="btn btn-outline-success w-100 mb-1" href="#" role="button">${listProductType.get(category.id)[0].name}</a>
                </div>
            </div>

        </c:forEach>
    </div>
</div>

