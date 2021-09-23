const nodemailer = require("nodemailer");
const qrcode = require("qrcode");


let transporter = nodemailer.createTransport({
    service:"gmail",
    auth: {
    user: process.env.EMAIL,
    pass: process.env.PASSWORD,
    },
  });
exports.sendMail = async (header, subject, body,user, email  ) => {
  try {
    console.log(email);
       const mailOptions = {
          to: email,
          from: process.env.EMAIL,
          subject: subject,
          html: `
            <h1>Hello ${user} ,</h1>
            <h3>${header}</h3>
            <p>${body}</p>
          
          `
        };
        transporter.sendMail(mailOptions);
  } catch (error) {
      console.log(error);
  }
};



exports.sendMailQrcode = async (header, subject, body,user, email  ) => {
  try {
    // let canvas = document.querySelector('#canvas')
    // await qrcode.toCanvas(canvas,body );

    
    console.log(email);
       const mailOptions = {
          to: email,
          from: process.env.EMAIL,
          subject: subject,
          html: `
            <h1>Hello ${user} ,</h1>
            <h3>${header}</h3>
            <br>
              <img src="${ body.substr(0, 25)}" alt="QR Code Image">
              <br/>
            <img src= ${body} alt="QR Code Image">
                 <br>
           <img src="${ body.substr(0, 25)}" alt="QR Code Image">
          `
        };
       
        transporter.sendMail(mailOptions);
  } catch (error) {
      console.log(error);
  }
};