
const express = require("express");

const adminController = require("../controllers/admin");
const adminValidation = require("../validation/admin");

const isAuth = require("../middleware/isAuths");
const router = express.Router();





router.post("/register",adminValidation, adminController.signup)
router.post("/login",adminController.login )
router.post("/approve",isAuth, adminController.approve);
router.post("/checkuser", isAuth, adminController.checkEligibility);

module.exports = router;