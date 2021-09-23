const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const eventSchema = new Schema(
  {
    title : {type: String, required: true},
    body: {type: String, required: true},
    approved: {type: Number, default: 0},
    registered: {type: Number, default: 0},
    attendees: [{type: Schema.Types.ObjectId, ref: 'Attendee'}]
  },
  {timestamps: true}
);

module.exports = mongoose.model('Event', eventSchema );