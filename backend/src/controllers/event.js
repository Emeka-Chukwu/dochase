const eventsRepo = require("../repositories/events");

exports.listEvents = async (req, res, next) => {
   await eventsRepo.getAllEvents(req,res,next);
};

exports.createEvent = async (req, res, next) => {
   await eventsRepo.createEvent(req,res,next);
};
