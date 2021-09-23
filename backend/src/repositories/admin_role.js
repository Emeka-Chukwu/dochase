
const qrcode = require("qrcode");

const Attendee = require("../models/attendee");

const Event = require("../models/events");
const sendMail = require("../services/send_mail");



class AdminRepo {

      
 
 static async ApproveOrDeclinedAttendee( req, res, next, callbackIncreaseApprovedCount){
      
    
    let {eventId,userId, approved} = req.body;
    let user = await Attendee.findById(userId);
    // let  eventName = await Event.findById(eventId);
    if(!user){
        throw "Record not found";
    }

    let usercode = eventId +" "+userId;
    // try{
        if(!approved){
            user.status = "declined";
            user.save()
           await sendMail.sendMail("Event Registration  Declined", "Event Registration", "sorry you application is declined", `${user.firstName} ${user.lastName}`,` ${user.email}`);
          return  res.status(201).json({ message: " declined", success: true,});
        }
    if(!user){
     res.status(422).json({  message: "error occured while approving ", success: false,});
    }
    // let code = await  qrcode.create({name: usercode });
    let code =  await qrcode.toDataURL(usercode );

     user.status = "completed";
    user.save()
    await callbackIncreaseApprovedCount(eventId);
    await sendMail.sendMailQrcode("Event Registration Accepted", "Event Registration", code, `${user.firstName} ${user.lastName}`,` ${user.email}`);

     return res.status(201).json({    message: " approvide", success: true,});

    // }catch(e){
    //     next(e);
    // }
    }

 static async checkForQrCode( req, res, next){
    
    let {eventid, userEventId} = req.body;

    
    try{
   let event = userEventId.split(" ")[0];

    if(eventid == event){
       res.status(201).json({ data: data, code  , message: " approvide", success: true,}); 
    }
    res.status(401).json({ data: data, code  , message: " Not Approved for this Event", success: true,});

    }catch(e){
        next(e);
    }
    }

    
}

module.exports = AdminRepo;