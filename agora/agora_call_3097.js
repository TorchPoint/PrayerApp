const express = require("express");
const app = express();
const Agora = require("agora-access-token");
var admin = require("firebase-admin");
var serviceAccount = require("./firebase-key.json");

 const appID = "d16d4a2e151647c18a8a2a99d57593a7";
 const appCertificate = "c57ea22d9e6d46af9b7549b6ddd2f35d";
 const expirationTimeInSeconds = 3600;
  
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
//   databaseURL: "https://sample-project-e1a84.firebaseio.com"
});

app.use(express.json());
var users=0;
var mysql = require("mysql");
var con_mysql = mysql.createPool({
   host: "localhost",
   user: "serverap_khalidmeer",
   password: "4Ce_~k8GZ)_5",
   database: "serverap_prayer",
    debug             :   true
});

const notification_options = {
    priority: "high",
    timeToLive: 60 * 60 * 24
  };
  
app.post("/rtctoken", (req, res) => {
   //RTC Token Generator 
  const uid = req.body.sender_id;
  const reciever_id = req.body.reciever_id?req.body.reciever_id:null;
  const group_id=req.body.group_id?req.body.group_id:null;
  const role = req.body.isPublisher ? Agora.RtcRole.PUBLISHER : Agora.RtcRole.SUBSCRIBER;
  const channel = 'prayer_app+km'+new Date().getTime();
// const channel='prayer-app01';
  const name = req.body.name;
  const group_name = req.body.group_name?req.body.group_name:null;
  const currentTimestamp = Math.floor(Date.now() / 1000);
  const expirationTimestamp = currentTimestamp + expirationTimeInSeconds;
  const token = Agora.RtcTokenBuilder.buildTokenWithUid(appID, appCertificate, channel, uid, role, expirationTimestamp);
  var user="";
  
  const role1 = req.body.isPublisher ? Agora.RtcRole.PUBLISHER : Agora.RtcRole.SUBSCRIBER;
  const reciever_token = Agora.RtcTokenBuilder.buildTokenWithUid(appID, appCertificate, channel, reciever_id, role1, expirationTimestamp);
  
//  ONE TO ONE
//   sender_user(req.body,function(response){
//     user=JSON.stringify (response[0]);
//   });

 channel_joining(req.body,channel,function(response){
    if(reciever_id!==null){
    get_user_token(req.body,function(response){
            if(response.length>0){
             const message_notification = {
             notification: {
             title: name+"Calling You ",
             body: "calling"
                 },
                 data:{
                     "channel":channel,
                     "type":"call",
                     'user':""+uid,
                     "token":reciever_token,
                     "user_name":name
                 }
            };
    //Push Notification
    const  registrationToken =response[0].user_device_token;
    const options =  notification_options
      admin.messaging().sendToDevice(registrationToken, message_notification, options);
             return res.status(200).send({channel:channel,token:token});
            }else{
            return res.status(400).send({message:"User Not Found...!"});
            }
        });
        
    }
    if(group_id!==null){
         group_user_token(req.body,function(response){
            if(response.length>0){
               response.forEach(element => {
                   
               const role1 = req.body.isPublisher ? Agora.RtcRole.PUBLISHER : Agora.RtcRole.SUBSCRIBER;
               const reciever_token = Agora.RtcTokenBuilder.buildTokenWithUid(appID, appCertificate, channel, element.id, role1, expirationTimestamp);
             const message_notification = {
             notification: {
             title: name+"Calling In "+group_name,
             body: "Channel Calling"
                 },data:{
                 "channel":channel,
                 "type":"group_call",
                  'group':""+group_id,
                "token":reciever_token,
                "user_name":group_name
                 }
             };
              const  registrationToken =element.user_device_token;
              const options =  notification_options;
              admin.messaging().sendToDevice(registrationToken, message_notification, options);
          });
       return res.status(200).send({channel:channel,token:token});
     }
    
    else{
        return res.status(400).send({message:"User Not Found...!"});
        }
     });
    }
  });
});


app.post("/joining-call", (req, res) => {

    const channel1=req.body.channel;
    const groupID=req.body.group_id?req.body.group_id:null;
    const senderId=req.body.sender_id?req.body.sender_id:null;
      available_users(req.body,function(response){
    //   users=response[0].user_count; 
        if(response[0].user_count>=1){
      user_accept(req.body,function(response){
      });
            console.log(senderId);

      if(groupID!==null){
           group_info(req.body,function(response){
      res.send({ group:response[0],status:1 ,c:users,d:channel1});   
      });
      }
       if(senderId!==null){
     sender_user(req.body,function(response){
      res.send({ user:response[0],status:1 ,c:users,d:channel1});   
      });  }
  }
  else{
    res.send({ status:0,message:"Caller Left",c:users,d:channel1 });   
  }
      });

  
 
});




app.post("/leave-channel",(req,res)=>{
    
 leave_channel(req.body,function(response){
       res.send({ message:"channel left",status:0});
 })  
});


app.post("/reject-call",(req,res)=>{
    
    
    
     const channel1=req.body.channel;
    const groupID=req.body.group_id?req.body.group_id:null;
    const senderId=req.body.sender_id?req.body.sender_id:null;
    if(senderId!==null){
      get_user_reject_token(req.body,function(response){
         const message_notification = {
             notification: {
             title: "Call Rejected ",
             body: "calling"
                 },
                 data:{
                     "channel":req.body.channel,
                     "type":"call_reject",
                 }
            };
    //Push Notification
    const  registrationToken =response[0].user_device_token;
    const options =  notification_options
      admin.messaging().sendToDevice(registrationToken, message_notification, options);
      reject_call(req.body,function (response){
          res.send({ message:"Call Rejected",status:0});
      })
       
 })  
    
}else{
              res.send({ message:"Group Call Rejected",status:0});
}
     
    
})

var reject_call=function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`UPDATE call_users SET user_status='left' where joiner_id=${object.sender_id} and channel='${object.channel}'`, function(error,data){
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

var leave_channel = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`UPDATE call_users SET user_status='left' where joiner_id=${object.user_id} and channel='${object.channel}'`, function(error,data){
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



var channel_joining = function(object,channel,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`INSERT INTO calls( sender_id,  reciever_id, channel_name) VALUES (${object.sender_id},${object.reciever_id},'${channel}')`, function(error,data){
                if(error){
                    callback(error);
                }else{
                     connection.query(`INSERT INTO call_users( joiner_id, channel, user_status) VALUES (${object.sender_id},'${channel}','joined')`, function(error,data){
                        connection.release();
                        if(error){
                            callback(error);
                        }else{
                            callback(data);
                        }
                    });
                    // callback(data);
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

var available_users = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`SELECT COUNT(id) as user_count FROM call_users WHERE channel='${object.channel}' AND user_status='joined'`, function(error,data){
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


var user_accept = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`INSERT INTO call_users( joiner_id, channel, user_status) VALUES (${object.reciever_id},'${object.channel}','joined')`, function(error,data){
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


var group_info = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`select * from groups where id=${object.group_id}`, function(error,data){
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



var group_user_token = function(object,callback){
    con_mysql.getConnection(function(error,connection){
        if(error){
            callback(false);
        }else{
            connection.query(`SELECT users.* FROM group_users 
            INNER JOIN users ON group_users.user_id=users.id WHERE group_users.group_id=${object.group_id} AND group_users.user_id!=${object.sender_id}`, function(error,data){
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
     
     var get_user_reject_token = function(object,callback){
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

const port = process.env.PORT || 3097;
app.listen(port, () => console.log(`Agora Auth Token Server listening at Port ${port}`));