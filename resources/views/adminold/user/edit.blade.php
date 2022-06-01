@extends('admin.layout.master')
@section('style')

@endsection
@section('content')
 <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Books</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Add Book</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
 <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Add  New Book</h3>
              </div>
              @if(session('success'))
                        <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                            <span class="badge badge-pill badge-success"></span>
                                          {{session('success')}}
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>                   
                             @endif
              <!-- /.card-header -->
              <!-- form start -->
              <form action="{{route('update-book')}}" method="post" enctype="multipart/form-data">
                <div class="card-body">
                  @csrf
                   <div class="form-group">
                    <label for="exampleInputEmail1">Category</label>
                    <select name="category" class="form-control" placeholder="Select Category" required="">
                        @forelse($categories as $key=> $category)
                        <option value="{{$category->id}}" <?php if ($book->category_id==$category->id) {
                          echo "selected";
                        }  ?>>{{$category->name}}</option>
                        @empty
                        <option value="">Category Not Available</option>
                      @endforelse
                    </select>
                    <span class="text-danger">{{$errors->first('category')}}</span>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">IBN</label>
                    <input type="text" class="form-control"  placeholder="Enter IBN" name="ibn" required="" value="{{$book->iban}}">
                    <span class="text-danger">{{$errors->first('ibn')}}</span>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Title</label>
                    <input type="text" class="form-control"  placeholder="Enter Title" name="title" required="" value="{{$book->title}}">
                    <span class="text-danger">{{$errors->first('title')}}</span>
                  </div>
                    <div class="form-group">
                    <label for="exampleInputEmail1">Author</label>
                    <input type="text" class="form-control"  placeholder="Enter Author" name="author" required="" value="{{$book->author}}">
                    <span class="text-danger">{{$errors->first('author')}}</span>
                  </div>
                    <div class="form-group">
                    <label for="exampleInputEmail1">Price</label>
                    <input type="text" class="form-control"  placeholder="Enter Price" name="price" required="" value="{{$book->price}}">
                    <span class="text-danger">{{$errors->first('price')}}</span>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Cover Image Image</label>
                    <input type="file" class="form-control"  placeholder="Upload Image" name="image" >
                    <span class="text-danger">{{$errors->first('image')}}</span>
                  </div>

                  <div class="form-group">
                    <label for="exampleInputPassword1">Demo File</label>
                    <input type="file" class="form-control"  placeholder="Upload Image" name="demo_file">
                    <input type="hidden" name="demo_duration" value="">
                    <input type="hidden" name="id" value="{{$book->id}}">
                    <span class="text-danger">{{$errors->first('image')}}</span>
                  </div>
                    <div class="form-group">
                      <button type="button" class="btn btn-success add_more_chapters">Add Chapter</button>

                    </div>
                  <div class="form-group">
                    <table class="table">
                      <tr><th>Title</th><th>Media</th><th>Chapter Number</th></tr>
                      @forelse($book->chapters as $key=> $chater)
                      <tr class="clone"><td><input type="text" name="chapter_title[{{$key}}]" class="form-control" required=""  value="{{$chater->title}}"></td><td><input type="file" name="chapter_file[{{$key}}]" class="form-control" required="" > <input type="hidden" name="chapter_duration[{{$key}}]" value="{{$chater->duration}}" required=""></td><td><input type="number" name="chapter_number[{{$key}}]" class="form-control" required="" value="{{$chater->chapter_no}}"></td><td><button type="button" class="btn btn-danger remove_chapters">Remove Chapter</button></td></tr>
                      @empty
                      @endforelse
                    </table>
                    
                  </div>
                
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->

          
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->
         
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
   
  
@endsection
@section('script')

<script type="text/javascript">
  

function computeLength(file) {
  return new Promise((resolve) => {
    var objectURL = URL.createObjectURL(file);
    var mySound = new Audio([objectURL]);
    mySound.addEventListener(
      "canplaythrough",
      () => {
        URL.revokeObjectURL(objectURL);
        resolve({
          file,
          duration: mySound.duration
        });
      },
      false,
    );
  });  
}

$("[name='chapter_file[]']").change(function(e) {
  var files = Array.from(e.currentTarget.files);
  var elm=$(this);
  Promise.all(files.map(computeLength)).then((songs) => {
  console.log(songs);
    $(songs).each(function(i,val){
      console.log(elm);
      elm.siblings("[name='chapter_duration[]']").val(Math.round(val.duration));

    })
   

  });
});

$("[name='demo_file']").change(function(e) {
  var files = Array.from(e.currentTarget.files);
  var elm=$(this);
  Promise.all(files.map(computeLength)).then((songs) => {
  console.log(songs);
    $(songs).each(function(i,val){
      
      $("[name='demo_duration']").val(Math.round(val.duration));

    })
   

  });
});

//Add chapters

$(".add_more_chapters").click(function(){
 var clone= $(".clone").first().clone();
 $(".clone").last().after(clone);
})
$(document).on("click",".remove_chapters",function(){
var leng=$(".clone").length;
console.log(leng);
if (leng>1) {
  $(this).parents("tr.clone").remove();

}

})


</script>



@endsection
