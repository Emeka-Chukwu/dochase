const {body} = require("express-validator");


module.exports = [
 
     body("title")
    .trim()
    .isLength({min:4}),
    body("body")
    .trim().isLength({min:4})
];


