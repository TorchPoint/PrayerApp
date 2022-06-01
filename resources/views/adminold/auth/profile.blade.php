@extends('admin.layout.master');
@section('content')
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

           

         
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-12">
            <div class="card">
            
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="activity">
                   
                     @if(session('success'))
                        <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                                        <span class="badge badge-pill badge-success"></span>
                                          {{session('success')}}
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                             @endif

                      
                  <!-- /.tab-pane -->
                 

                  <div class="tab-pane" id="settings">
                  <form action="{{route('updateadmin')}}" method="post" enctype="multipart/form-data" class="form-horizontal">
                                   @csrf
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">First Name</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control"  placeholder="Name"name='first_name' required value="{{Auth::guard('admin')->user()->first_name}}">
                        </div>
                        <span class="text-danger">{{$errors->first('first_name')}}</span>

                      </div>
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">Last Name</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control"  placeholder="Name" name='last_name' required value="{{Auth::guard('admin')->user()->last_name}}">
                        </div>
                        <span class="text-danger">{{$errors->first('last_name')}}</span>

                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control"  placeholder="Email" name="email" required value="{{Auth::guard('admin')->user()->email}}">
                        </div>
                        <span class="text-danger">{{$errors->first('email')}}</span>

                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Image</label>
                        <div class="col-sm-10">
                          <input type="file" class="form-control"  placeholder="Name" name="image">
                        </div>
                      </div>

                         <div class="form-group row password" style="display:none;">
                        <label for="inputName2" class="col-sm-2 col-form-label">New Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control"  placeholder="Password" name="password">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" name='change_password'> Want To Change <a href="#">Password</a>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
@endsection

@section('script')
<script>
$(document).ready(function(){
    $("[name='change_password']").change(function(){
        
            $(".password").toggle();
                    if(!$("[name='password']").prop('required')){
                $("[name='password']").prop('required',true)
            } else {
               $("[name='password']").prop('required',false);


            }
            console.log();

        })
})
</script>
@endsection


