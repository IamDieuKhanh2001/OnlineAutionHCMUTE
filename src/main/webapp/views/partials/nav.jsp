<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/Home/Index">
        <i class="fa fa-home" aria-hidden="true"></i>
        Home
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/Home/About">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <div class="d-flex justify-content-between">
                <button type="button" class="btn btn-outline-warning mr-3" data-toggle="modal" data-target="#exampleModalCenter">
                    <i class="fa fa-bell" aria-hidden="true"></i>
                    Notifications
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    99+
                    </span>
                </button>
                <a class="btn btn-outline-danger mr-3" href="${pageContext.request.contextPath}/Product/MyWatchList" role="button">
                    <i class="fa fa-heart" aria-hidden="true"></i>
                    My watch list
                </a>
                <a class="btn btn-outline-success mr-3" href="${pageContext.request.contextPath}/Account/Login" role="button">
                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                    Sign in
                </a>
                <a class="btn btn-outline-success mr-3" href="${pageContext.request.contextPath}/Account/Login" role="button">
                    <i class="fa fa-registered" aria-hidden="true"></i>
                    Register
                </a>
            </div>
        </form>
    </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">
                    <i class="fa fa-bell" aria-hidden="true"></i>
                    Notification
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Hien thi thong bao khi mon hang da dau gia thanh cong
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%--search--%>
<div class="container-fluid py-2 mt-2 bg-light">
<%--    dropdown buttton sort --%>
    <div class="sort d-flex justify-content-between">
        <div class="dropdown">
            <button class="btn btn-outline-secondary dropdown-toggle mr-2" type="button" id="sortTimeEnded" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Sort by time end
            </button>
            <div class="dropdown-menu" aria-labelledby="sortTimeEnded">
                <a class="dropdown-item" href="#">Lower</a>
                <a class="dropdown-item" href="#">Higher</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="btn btn-outline-secondary dropdown-toggle mr-2" type="button" id="sortPrice" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Sort by price
            </button>
            <div class="dropdown-menu" aria-labelledby="sortPrice">
                <a class="dropdown-item" href="#">Lower</a>
                <a class="dropdown-item" href="#">Higher</a>
            </div>
        </div>
<%--        search bar --%>
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </div>
</div>