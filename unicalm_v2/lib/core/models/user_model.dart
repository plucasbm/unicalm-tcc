class UserModel {
  String id;
  final String name;
  String? userImg;
  final String email;
  final String university;

  UserModel({
    this.id = '',
    required this.name,
    this.userImg,
    required this.email,
    required this.university,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': name,
      'email': email,
      'university': university,
      'userImg': userImg,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      university: json['university'],
      userImg: json['userImg'],
    );
  }

  Map<String, dynamic> toMap() {

    return {
      'id': id,
      'name': name,
      'userImg': userImg,
      'email': email,
      'university': university,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {

    return UserModel(
      id: data['id'],
      name: data['name'],
      userImg: data['userImg'],
      email: data['email'],
      university: data['university'],
    );
  }
}