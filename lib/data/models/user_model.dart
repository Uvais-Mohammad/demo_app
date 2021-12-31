import 'dart:io';

class User{
  String? name;
  String? description;
  File? image;

  User({this.name, this.description, this.image});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? File(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image != null ? image!.path : null;
    return data;
  }
}