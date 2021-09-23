const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const attendeeSchema = new Schema(
  {
    firstName: {type: String, required: true},
    lastName: {type: String, required: true},
    phone: {type: String, required: true},
    email: {type: String, required :true},
    status: {type: String, default: "pending"},
    event: {type: Schema.Types.ObjectId, ref: 'Event', required: true},

  },
  {timestamps: true}
);

module.exports = mongoose.model('Attendee', attendeeSchema );