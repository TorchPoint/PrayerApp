const express = require('express');
const app = express();
var fs = require('fs');
var admin = require("firebase-admin");
var serviceAccount = require("./firebase-key.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
//   databaseURL: "https://sample-project-e1a84.firebaseio.com"
});
const notification_options = {
    priority: "high",
    timeToLive: 60 * 60 * 24
  };
const options = {
    key: fs.readFileSync('/home/serverappsstagin/ssl/keys/a4f14_ce787_0ee556cf5218418204ef09810f7dd212.key'),
    cert: fs.readFileSync('/home/serverappsstagin/ssl/certs/server_appsstaging_com_a4f14_ce787_1637107199_52cd2543f2d2e3116f8b03943d3b1c27.crt'),
};

const server = require('https').createServer(options, app);
var io = require('socket.io')(server, {
    
    cors: {
        origin: "*",
        methods: ["GET", "POST","PATCH","DELETE"],
        credentials: false,
        transports: ['websocket', 'polling'],
        allowEIO3: true
    },
});

var mysql = require("mysql");
var con_mysql = mysql.createPool({
   host: "localhost",
   user: "serverap_khalidmeer",
   password: "4Ce_~k8GZ)_5",
   database: "serverap_prayer",
    debug             :   true
});

// SOCKET START
io.on('connection',function(socket){

    // GET MESSAGES EMIT
    socket.on('get_messages',function(object){
          console.log("GET_MESG",object.sender_id)
          var user_room = "user_"+object.sender_id;
          socket.join(user_room);
        
          get_messages(object,function(response){
            if(response){
                console.log("get_messages has been successfully executed...");
                io.to(user_room).emit('response', {object_type:"get_messages", data:response});
            }else{
                console.log("get_messages has been failed...");
                io.to(user_room).emit('error', {object_type:"get_messages", message:"There is some problem in get_messages..."});
            }
        });
    });
    
    
    //GET GROUP MESSAGE
     socket.on('group_get_messages',function(object){
           var group_room = "group_"+object.group_id;
        var sender = "user_"+object.sender_id;
          socket.join(group_room);
          socket.join(sender);
          group_get_messages(object,function(response){
            if(response){
                console.log("get_messages has been successfully executed...");
                io.to(sender).emit('response', {object_type:"get_messages", data:response});
            }else{
                console.log("get_messages has been failed...");
                io.to(group_room).emit('error', {object_type:"get_messages", message:"There is some problem in get_messages..."});
            }
        });
    });
    
    
    // SEND MESSAGE EMIT
    socket.on('send_message',function(object){

        var sender_room = "user_"+object.sender_id;
        var receiver_room = "user_"+object.reciever_id;
        console.log("trting to send mesg",object);
         var user_name="";
          sender_user(object,function(response){
          user_name =response[0].first_name+" "+response[0].last_name;   
          });
        send_message(object,function(response){
            if(response){
                console.log("send_message has been successfully executed...");
                io.to(sender_room).to(receiver_room).emit('response', {object_type:"get_message", data:response});
                                    get_user_token(object,function(response){
                                if(response.length>0){
                                 const message_notification = {
                                 notification: {
                                 title: user_name+" Messaged to You ",
                                 body: "New Message Recieved"
                                     },
                                     data:{
                                         "type":"chat"
                                        
                                     }
                                };
                        //Push Notification
                        const  registrationToken =response[0].user_device_token;
                        const options =  notification_options
                          admin.messaging().sendToDevice(registrationToken, message_notification, options);
                                
                                }
                            });
            }else{
                console.log("send_message has been failed...");
                io.to(sender_room).to(receiver_room).emit('error', {object_type:"get_message", message:"There is some problem in get_message..."});
            }
        });
    });
    
//SEND GROUP MESSAGE
  socket.on('group_send_message',function(object){
         var group_room = "group_"+object.group_id;
          socket.join(group_room);
          var user_name="";
          sender_user(object,function(response){
          user_name =response[0].first_name+" "+response[0].last_name;   
          }); 
        group_send_message(object,function(response){
            if(response){
                console.log("send_message has been successfully executed...");
             io.to(group_room).emit('response', {object_type:"get_messages", data:response});
              group_user_token(object,function(response){
            if(response.length>0){
               response.forEach(element => {
             const message_notification = {
             notification: {
             title:user_name+" Messaged In "+element.name,
             body: "New Message Recieved"
                 },data:{
                 "type":"chat",
                 
              
                 }
             };
              const  registrationToken =element.user_device_token;
              const options =  notification_options;
              admin.messaging().sendToDevice(registrationToken, message_notification, options);
          });
      
     }
    
   
     });
            }else{
                console.log("send_message has been failed...");
                io.to(group_room).emit('error', {object_type:"get_messages", message:"There is some problem in get_messages..."});
            }
        });
    });
    

    
    
    socket.on('disconnect',function(){
        
       console.log("Use disconnection",socket.id)
    });
});
// SOCKET END





// GET MESSAGES FUNCTION
var get_messages = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`select users.first_name, users.last_name , users.profile_image, chats.id , chats.sender_id,chats.reciever_id , chats.group_id,chats.message from chats inner join users on chats.sender_id = users.id
WHERE (chats.sender_id = ${object.sender_id} AND chats.reciever_id=${object.reciever_id}) OR (chats.sender_id=${object.reciever_id} AND chats.reciever_id=${object.sender_id}) order by chats.id ASC`, function(error,data){
                connection.release();
                if(error){
                    callback(false);
                }else{
                    callback(data);
                }
            });
        }
    });
};

//GROUP MESSAGE
var group_get_messages = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`select users.first_name, users.last_name , users.profile_image, chats.id , chats.sender_id,chats.reciever_id ,chats.group_id, chats.message from chats inner join users on chats.sender_id = users.id
             WHERE chats.group_id=${object.group_id} order by chats.id ASC`, function(error,data){
                connection.release();
                if(error){
                    callback(false);
                }else{
                    callback(data);
                }
            });
        }
    });
};


// SEND MESSAGE FUNCTION
var send_message = function(object,callback){
        console.log("Send msf call bacj")
    con_mysql.getConnection(function(error,connection){
        if(error){
            console.log("CONNECTIOn ERROR ON SEND MESSAFE")
            callback(false);
        }else{
              connection.query(`  INSERT INTO chats (sender_id , reciever_id , message) VALUES ('${object.sender_id}' , '${object.reciever_id}', '${object.message}')`, function(error,data){
                if(error){
                     console.log("FAILED TO VERIFY LIST")
                        callback(false);
                        }else{
                                console.log("update_list has been successfully executed...");
                                connection.query(`  SELECT u.first_name,last_name, u.profile_image, c.*
                                                FROM users AS u
                                                JOIN chats AS c
                                                ON u.id = c.sender_id
                                                WHERE c.id = '${data.insertId}'`, function(error,data){
                                        connection.release();
                                        if(error){
                                            callback(false);
                                        }else{
                                            callback(data);
                                        }
                                    });
                                
                        }
                    });
        }
    });
};

//SEND GROUP MESSAGE
var group_send_message = function(object,callback){
        console.log("Send msf call bacj");
    con_mysql.getConnection(function(error,connection){
        if(error){
            console.log("CONNECTIOn ERROR ON SEND MESSAFE")
            callback(false);
        }else{
              connection.query(`  INSERT INTO chats (sender_id , group_id , message) VALUES ('${object.sender_id}' , '${object.group_id}', '${object.message}')`, function(error,data){
                if(error){
                     console.log("FAILED TO VERIFY LIST")
                        callback(false);
                        }else{
                                console.log("update_list has been successfully executed...");
                                connection.query(`  SELECT u.first_name,last_name, u.profile_image, c.*
                                                FROM users AS u
                                                JOIN chats AS c
                                                ON u.id = c.sender_id
                                                WHERE c.id = '${data.insertId}'`, function(error,data){
                                        connection.release();
                                        if(error){
                                            callback(false);
                                        }else{
                                            callback(data);
                                        }
                                    });
                                
                        }
                    });
        }
    });
};



//Push Notification
var group_user_token = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`SELECT users.*,groups.name FROM group_users 
            INNER JOIN users ON group_users.user_id=users.id INNER JOIN groups ON group_users.group_id=groups.id WHERE group_users.group_id=${object.group_id} AND group_users.user_id!=${object.sender_id}`, function(error,data){
                connection.release();
                if(error){
                    callback(error);
                }else{
                    callback(data);
                }
            });
        }
    });
};

var get_user_token = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`select * from users where id=${object.reciever_id}`, function(error,data){
                connection.release();
                if(error){
                    callback(error);
                }else{
                    callback(data);
                }
            });
        }
    });
};

var sender_user = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`select * from users where id=${object.sender_id}`, function(error,data){
                connection.release();
                if(error){
                    callback(error);
                }else{
                    callback(data);
                }
            });
        }
    });
};

// SERVER LISTENER
server.listen(3090, function(){
    console.log("Server is running on port 3090");
});