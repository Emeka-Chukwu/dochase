
const express = require("express");

const eventController = require("../controllers/event");
const eventValidation = require("../validation/events");
const router = express.Router();



router.post("/events", eventValidation, eventController.createEvent)
router.get("/events",eventController.listEvents )


module.exports = router;