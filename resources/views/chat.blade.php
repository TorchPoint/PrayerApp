<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Chat Socket.io</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-8 offset-sm-2">
          <ul class="chatlist">
            
          </ul>

        </div>
      </div>
       <div class="row">
        <div class="col-sm-2">
        </div>
        <div class="col-sm-8">
          <input type="text" name="message" class="form-control" placeholder="Enter Text" value="dfdsfl">
          <button class="text-primary btn" name="send">Send</button>
        </div>
         <div class="col-sm-2">
          User List
           <?php  
            $groups=\App\Models\Group::whereHas('member',function ($query) {
                $query->where('user_id','=',Auth::user()->id);
            })->get();
              $users=\App\Models\User::where('id','<>',Auth::user()->id)->get();
            ?>
          
              <select  class="userlist form-control" >
                <option value="">Select</option>
           @foreach($users as $user)
            <option value="{{$user->id}}">{{$user->email}}</option>
           @endforeach
          </select>
          
          <select  class="group form-control" >
              <option value="">Select</option>
           @foreach($groups as $group)
            <option value="{{$group->id}}">{{$group->name}}</option>
           @endforeach
          </select>
          
        </div>
      </div>
    </div>
   
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"  ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="https://cdn.socket.io/4.1.2/socket.io.min.js"  ></script>
<script>
  $(function(){
    let ip_address='https://server.appsstaging.com:3010';
    let socket_port='3010';
    let socket=io(ip_address);
    socket.on("connection");
    
$(document).on("click","[name='send']",function(){
  var reciever_id=$(".userlist").val();
  var group_id=$(".group").val();
  alert(group_id);
  var message=$("[name='message']").val();
  var data={'sender_id':{{Auth::user()->id}},'reciever_id':reciever_id,'group_id':group_id,'message':message};
    $(".chatlist").append("<li style='list-style:none; background-color:gray;color:black;'>"+message+"</li>");

socket.emit("send_message", data);
})


$(document).on("change","select.userlist",function(){
var reciever_id=$(this).val();
  var data={'sender_id':{{Auth::user()->id}},'reciever_id':reciever_id}; 
socket.emit("get_messages",data);
})

$(document).on("change","select.group",function(){
var group_id=$(this).val();
  var data={'sender_id':{{Auth::user()->id}},'group_id':group_id}; 
socket.emit("group_get_messages",data);


})


// $(document).on("change","select.userlist",function(){
// var reciever_id=$(this).val();
//     var data={'sender_id':{{Auth::user()->id}},'reciever_id':reciever_id,};

// socket.emit("JoinGroup",data);
// })

socket.on("connectToRoom",(data)=>{
   console.log(data); 
})

socket.on("response", (data)=>{
    console.log(data);
  if (data.reciever_id=={{Auth::user()->id}}) {
    $(".chatlist").append("<li style='list-style:none; background-color:lightgreen;color:black;'>"+data.message+"</li>");
  }
});

// socket.on("get_messages", (data)=>{
//     console.log(data);
//   if (data.reciever_id=={{Auth::user()->id}}) {
//     $(".chatlist").append("<li style='list-style:none; background-color:lightgreen;color:black;'>"+data.message+"</li>");
//   }
// });

// socket.on("response", (data)=>{
//     console.log(data);
//   if (data.reciever_id=={{Auth::user()->id}}) {
//     $(".chatlist").append("<li style='list-style:none; background-color:lightgreen;color:black;'>"+data.message+"</li>");
//   }
// });
    
  })
</script>
  </body>
</html>