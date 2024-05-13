<div class="container-fluid" style="height: 10px;background-color: #303f9f">
</div>
<div class ="container-fluid p-3 bg-light">
    <div class ="row justify-content-between">
        <div class="col-md-3 text-success">
            <h3>
                <i class="fas fa-book"></i>Ebooks
            </h3>
        </div>
        <div class="col-md-3 text-success">
            <h3>
                <i class="fa-solid fa-user"></i>
                <span class="ml-1">
                  <% 
                      //Lấy tên người dùng từ đối tượng User
                      com.entity.User user = (com.entity.User)session.getAttribute("userobj");
                      if (user != null) {
                          out.println(user.getName());
                      } else {
                          out.println("Guest"); // Nếu không có người dùng nào đăng nhập
                      }
                  %>
                </span>
            </h3>
        </div>
    </div>
</div>
        
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fas fa home"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
        <button class="btn btn-light my-2 my-sm-0 mx-2" type="submit">
            <i class="fas fa-cog"></i>Setting
        </button>
        <button class="btn btn-light my-2 my-sm-0 mx-2" type="submit">
            <i class="fas fa-phone-square-alt"></i>  Contact us
        </button>
    </form>
  </div>
</nav>