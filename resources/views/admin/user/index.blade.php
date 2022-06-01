@extends('admin.layout.master')
@section('style')
<link rel="stylesheet" href="{{asset('public/admin/plugins/fontawesome-free/css/all.min.css')}}">
  <!-- DataTables -->
  <link rel="stylesheet" href="{{asset('public/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
  <link rel="stylesheet" href="{{asset('public/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
  <link rel="stylesheet" href="{{asset('public/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('public/admin/dist/css/adminlte.min.css')}}">
@endsection
@section('content')
 <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Users</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Users</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
          

            <div class="card">
              <div class="card-header">
                <h3 class="card-title float-right  text-white"><a href="{{route('create-user')}}" class="btn-success btn">Add New</a></h3>
                
              </div>
              
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>#</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Login Type</th>
                    <th>Action</th>
                    
                  </tr>
                  </thead>
                  <tbody>
                 @forelse($users as $key=> $user)
                  <tr>

                      <td>{{$key+1}}</td>
                       <td><img src="{{$user->profile_image}}"/ width="50px" height="50px"></td>

                      <td>{{$user->first_name}} {{$user->last_name}}</td>
                  
                   
                      <td>{{$user->email}}</td>
                       
                      <td>{{$user->contact_no}}</td>
                     <td><select class="form-control status" data-id="{{$user->id}}">
                        <option value="1" @if($user->is_active==1) selected @endif>@if($user->is_active==1) Activated @else Activate @endif </option>
                        <option value="0" @if($user->is_active==0) selected @endif>@if($user->is_active==0) Deactivated @else Deactivate @endif</option>

                      </select></td>
                      <td>{{$user->user_social_type??"Gmail"}}</td>
                      <td>  <a href="{{route('user-profile',['id'=>$user->id])}}"> <button type="button" class="btn btn-success view" 
                          data-description="{{$user->description}}"><i class="fa fa-eye" aria-hidden="true" 
                          ></i></button></a></td>
                     

                      
                  </tr>                        
                  @empty
                                           
                @endforelse
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card --> 
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
@endsection
@section('script')
<!-- Bootstrap 4 -->
<!-- DataTables  & Plugins -->
<script src="{{asset('public/admin/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/jszip/jszip.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('public/admin/plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      // "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
   $(document).on("click",".delete",function(){
            if (!confirm("All Related Data Will Be Deleted")){
              return false;
            }
        var id=$(this).data("id");
        $.ajax({
            url:"{{route('delete-user')}}",
            data:{id:id,"_token":"{{csrf_token()}}"},
            type:"post",
            success:function(res){
                console.log(res);
                location.reload();

            }
        })
      })
       $(document).on("change",".status",function(){
        var id=$(this).data("id");
        var status=$(this).find('option:selected').val();
        
        $.ajax({
            url:"{{route('user-status')}}",
            data:{user_id:id,status:status,"_token":"{{csrf_token()}}"},
            type:"post",
            success:function(res){
                console.log(res);
                location.reload();

            }
        })
      })
</script>
@endsection
