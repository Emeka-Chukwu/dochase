class EventModel {
  List<Data> data;
  String message;
  bool success;

  EventModel({
    required this.data,
    required this.message,
    required this.success,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    List<Data> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    String message = json['message'];
    bool success = json['success'];
    return EventModel(data: data, message: message, success: success);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   data['message'] = this.message;
  //   data['success'] = this.success;
  //   return data;
  // }
}

class Data {
  String id;
  String title;
  String body;
  int approved;
  int registered;
  // List<Null> attendees;
  String createdAt;
  String updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.body,
    required this.approved,
    required this.registered,
    // required this.attendees,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    String id = json['_id'];
    String title = json['title'];
    String body = json['body'];
    int approved = json['approved'];
    int registered = json['registered'];
    // if (json['attendees'] != null) {
    //   attendees = new List<Null>();
    //   json['attendees'].forEach((v) {
    //     attendees.add(new Null.fromJson(v));
    //   });
    // }
    String createdAt = json['createdAt'];
    String updatedAt = json['updatedAt'];

    return Data(
        id: id,
        title: title,
        body: body,
        approved: approved,
        registered: registered,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   data['approved'] = this.approved;
  //   data['registered'] = this.registered;
  //   if (this.attendees != null) {
  //     data['attendees'] = this.attendees.map((v) => v.toJson()).toList();
  //   }
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}
