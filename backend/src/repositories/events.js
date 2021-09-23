
const qrcode = require("qrcode");

const Event = require("../models/events");



class EventsRepo {

    static async updateEventWhenRegistering(eventId){
     Event.findById(eventId).then(event => {
         event.registered  =  event.registered + 1;
        event.save();
        // next();
     }).
      catch(err=>{
        
      });
        
    }
    
 static async updateEventWhenApproved(eventId){
     Event.findById(eventId).then(event => {
         event.approved  =  event.approved + 1;
        event.save();
      
     }).
      catch(err=>{
         
      });
        
    }

 static async createEvent( req, res, next){
    
    let {title,body} = req.body;
    let event = new Event({title,body});

    try{
    let data = await event.save();
    if(!data){
     res.status(422).json({  message: "Event not created", success: false,});
    }
     res.status(201).json({ data: data , message: "Event created", success: true,});

    }catch(e){
        next(e);
    }
    }

 static async getAllEvents( req, res, next){
    
 

    try{
    let data = await Event.find();;
    if(!data){
     res.status(422).json({  message: "Error occured while fetching data", success: false,});
    }
     res.status(200).json({ data: data , message: "Events Fetched", success: true,});

    }catch(e){
        next(e);
    }
    }

    
}

module.exports = EventsRepo;