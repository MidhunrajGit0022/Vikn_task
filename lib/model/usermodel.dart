class Userdata {
  Data? data;
  int? userId;
  String? message;
  String? username;

  Userdata({
    this.data,
    this.userId,
    this.message,
    this.username,
  });

  Userdata.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    userId = json['user_id'];
    message = json['message'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['user_id'] = userId;
    data['message'] = message;
    data['username'] = username;
    return data;
  }
}

class Data {
  String? access;
  int? userId;
  String? username;
  String? email;

  Data({
    this.access,
    this.userId,
    this.username,
    this.email,
  });

  Data.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access'] = access;
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;

    return data;
  }
}
