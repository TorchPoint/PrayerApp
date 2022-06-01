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
            <h1>Contents</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Contents</li>
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
               
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>#</th>
                    <th>Type</th>
                   
                    <th>Action</th>

                  </tr>
                  </thead>
                  <tbody>
                 @forelse($contents as $key=> $content)
                  <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$content->type}}</td>
                     
                      <td><a href="{{route('edit-content',['id'=>$content->id])}}" class="btn btn-success view" 
                          data-description="{{$content->body}}" data-id="{{$content->id}}"><i class="fa fa-eye" aria-hidden="true" 
                          ></i></a></td>
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
<div class="modal" id="myModal">
   <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Content </h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <form action="{{route('update-content')}}" method="post">

      <!-- Modal body -->
      <div class="modal-body">
        <div class="form-group">
          <label>Description</label>
          <input type="hidden" name="id">
          @csrf
          <textarea class="form-control" name="description"></textarea>
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-success" >Update</button>

        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
      </div>
      </form>

    </div>
  </div>
</div>
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
  //   $(document).on('click',".view",function(){
  //  var des=$(this).data("description");
  //  var id=$(this).data("id");
  //   $("[name='description']").html(des);
  //   $("[name='id']").val(id);
  //     $("#myModal").modal("show");
  // });
</script>
@endsection
