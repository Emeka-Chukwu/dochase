const attendRepo = require("../repositories/attendee");
const eventsRepo = require("../repositories/events");


exports.registerForEvent = async (req, res, next) => {
    try{
      console.log(req.body);
      await attendRepo.createAttendee(req,res,next,  eventsRepo.updateEventWhenRegistering);  
    }catch(e){
        next(e);
    }
};


exports.usersRegisteredForEvent = async (req, res, next) => {
    try{
      await attendRepo.getAllUsers(req,res,next);
    }catch(e){
        next(e);
    }
};
