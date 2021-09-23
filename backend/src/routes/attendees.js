
const express = require("express");

const attendeeController = require("../controllers/attendee");
const attendValidation = require("../validation/attendes");
const router = express.Router();



router.post("/", attendValidation, attendeeController.registerForEvent);
router.get("/:id", attendValidation, attendeeController.usersRegisteredForEvent);


module.exports = router;