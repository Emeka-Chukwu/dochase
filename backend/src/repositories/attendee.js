
const Attendee = require("../models/attendee");
const eventsRepo = require("../repositories/events");
const sendMail = require("../services/send_mail");
const Event = require("../models/events");



class AttendeeRepo {


 static async createAttendee( req, res, next, callBackFunction){
    
    let {lastName, firstName, phone,email, event} = req.body;
    let attendee = Attendee({lastName,firstName,phone,email,event});


    try{
    let data = await attendee.save();
    if(!data){
     res.status(422).json({  message: "Attendee not created", success: false,});
    }
    console.log(data);
    await callBackFunction(event);
   let eventName = await Event.findById(event);
      await sendMail.sendMail("Event Registration Pending ", "Event Registration", `you have successfull registered for ${eventName.title} `, `${eventName.firstName} ${eventName.lastName}`, email);
    return res.status(201).json({ data: data , message: "Attendee created", success: true,});

    }catch(e){
        console.log(e);
        next(e);
    }
    }



     static async getAllUsers( req, res, next){
         let event = req.params.id;
    
        try{
            console.log(event);
        let data = await Attendee.find({"event": event})
        if(!data){
            res.status(422).json({  message: "Error occured while fetching users", success: false,});
        }
            res.status(200).json({ data: data , message: "Users Fetched", success: true,});

        }catch(e){
            next(e);
        }
    }

    


    
}

module.exports = AttendeeRepo ;

