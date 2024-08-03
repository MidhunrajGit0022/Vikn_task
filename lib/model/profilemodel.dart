class Profiledata {
  int? statusCode;
  Data? data;
  CustomerData? customerData;

  Profiledata({this.statusCode, this.data, this.customerData});

  Profiledata.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    customerData = json['customer_data'] != null
        ? CustomerData.fromJson(json['customer_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (customerData != null) {
      data['customer_data'] = customerData!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? username;
  String? email;

  Data({this.firstName, this.lastName, this.username, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}

class CustomerData {
  String? dateOfBirth;
  String? country;
  int? phone;
  String? state;
  Null city;
  Null address;
  String? photo;
  String? countryName;
  String? stateName;

  CustomerData(
      {this.dateOfBirth,
      this.country,
      this.phone,
      this.state,
      this.city,
      this.address,
      this.photo,
      this.countryName,
      this.stateName});

  CustomerData.fromJson(Map<String, dynamic> json) {
    dateOfBirth = json['DateOfBirth'];
    country = json['Country'];
    phone = json['Phone'];
    state = json['State'];
    city = json['City'];
    address = json['Address'];
    photo = json['photo'];
    countryName = json['CountryName'];
    stateName = json['StateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DateOfBirth'] = dateOfBirth;
    data['Country'] = country;
    data['Phone'] = phone;
    data['State'] = state;
    data['City'] = city;
    data['Address'] = address;
    data['photo'] = photo;
    data['CountryName'] = countryName;
    data['StateName'] = stateName;
    return data;
  }
}
