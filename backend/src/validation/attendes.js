const {body} = require("express-validator");


module.exports = [
 
     body("lastName")
        .trim()
        .isLength({min:4}),
     body("firstName")
        .trim()
        .isLength({min:4}),
        //  body("event")
        // .trim()
        // .isLength({min:1}),
    body("phone")
        .trim()
        .isLength({min:4}),
    body("email")
        .trim().isEmail()
        .isLength({min:1}),
   
   
   
];


