const {body} = require("express-validator");


module.exports = [
 
     body("email")
    .trim()
    .isEmail(),
    body("password")
    .trim().isLength({min:6})
];


