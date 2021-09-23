const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");
const {validationResult} = require("express-validator");

const User = require("../models/user");

 let transporter = nodemailer.createTransport({
    service:"gmail",
    auth: {
    user: process.env.EMAIL,
    pass: process.env.PASSWORD,
    },
  });

class AuthenticationRepo{
    static async registerUser(req, res, next){
        const errors = validationResult(req);
        if(!errors.isEmpty()) {
            const error = new Error('Signup validation failed');
            error.statusCode = 422;
            error.data = errors.array();
            // throw error;
            next(error);
            return;
        }
        const   {email,password} = req.body;
        bcrypt
        .hash(password, 12)
        .then(hashed => {
        const user = new User({email, password: hashed});
        console.log(email, password, "hash:", hashed);
        return user.save();
        }) 
    .then(user => {
      
      res
      .status(201)
      .json({message: 'User successfully created', user: user})
    })
    .catch(err => {
      if(!err.statusCode) err.statusCode = 500;
      console.log(err, "error");
      next(err);
    });

    }



    static async loginUser(req, res, next){
        const {email, password} = req.body;
        let user;
        const errors = validationResult(req);
        if(!errors.isEmpty()) {
            const error = new Error('login validation failed');
            error.statusCode = 422;
            error.data = errors.array();
            // throw error;
            if(!error.statusCode) err.statusCode = 500;
            next(error);
            return;
        }
        User
            .findOne({email})
            .then(usr => {
            if(!usr) {
                const error = new Error('Email not found');
                error.statusCode = 401;
                throw error;
            }
            user = usr;
            return bcrypt.compare(password, usr.password);
            })
            .then(result => {
            if(!result) {
                const error = new Error('Password incorrect');
                error.statusCode = 401;
                throw error;
            }
            const token = jwt.sign(
                {email: user.email, userId: user._id.toString()},
                process.env.JWT_SECRET,
                {expiresIn: '24h'}
            );
            res.status(200).json({token, userId: user._id.toString()});
            })
            .catch(err => {
            if(!err.statusCode) err.statusCode = 500;
            next(err);
            });
    }

}

module.exports = AuthenticationRepo;



