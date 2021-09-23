const adminRepo = require("../repositories/admin_role");
const userRepo = require("../repositories/user");
const eventsRepo = require("../repositories/events")

exports.signup = async (req, res, next) => {
      await userRepo.registerUser(req,res,next);  
};


exports.login = async (req, res, next) => {
    await userRepo.loginUser(req,res,next);  
};

exports.approve = async (req, res, next) => {
    // try{
    await adminRepo.ApproveOrDeclinedAttendee(req,res,next, eventsRepo.updateEventWhenApproved); 
    // }catch(e){
    // next(e)
// }
};

exports.checkEligibility = async (req, res, next) => {
    await adminRepo.checkForQrCode(req, res, next)
};