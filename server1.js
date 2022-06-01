const expresss=require('express');
const app=expresss();
var fs = require('fs');

const options = {
    key: fs.readFileSync('/home/serverappsstagin/ssl/keys/a4f14_ce787_0ee556cf5218418204ef09810f7dd212.key'),
    cert: fs.readFileSync('/home/serverappsstagin/ssl/certs/server_appsstaging_com_a4f14_ce787_1637107199_52cd2543f2d2e3116f8b03943d3b1c27.crt'),
};
const server=require("https").createServer(options,app);

const io=require('socket.io')(server,
{
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
    credentials: true,
    transports: ['websocket', 'polling'],
    allowEIO3: true
  },

});



var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "serverap_khalidmeer",
  password: "4Ce_~k8GZ)_5",
  database: "serverap_prayer"
});



io.on('connection',(socket)=>{
	console.log("connection established");
    let members;
	socket.on("sendChatToServer",(data)=>{

  if(typeof data.group_id!='undefined'){
  let sql = "INSERT INTO chats (sender_id, group_id,message) VALUES ("+data.sender_id+", "+data.group_id+",'"+data.message+"')";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
    let check="SELECT user_id FROM group_users WHERE group_id="+data.group_id;
    con.query(check,function (err,result){
      console.log(result);
      io.emit('sendChatToClient',result);
        // members=result;
    });
  }

//   console.log(members);
//     console.log(data);
    
		
	})
	//Join Group
socket.on("JoinGroup",(data)=>{
  socket.join("room-"+data.group_id);
   //Send this event to everyone in the room.
   io.sockets.in("room-"+data.group_id).emit('connectToRoom', "You are in room no. "+data.group_id);
})
	
	socket.on("disconnect",(socket)=>{
		console.log("disconnected");
	})
})

server.listen(3010,()=>{
	console.log("runninga");
})