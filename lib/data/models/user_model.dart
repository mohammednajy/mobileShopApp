class UserModel {
  final bool status;
  final String message;
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;
  UserModel({
    required this.status,
    required this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      status: map['status'],
      message: map['message'],
      id: map['data']['id'],
      name: map['data']['name'],
      email: map['data']['email'],
      phone: map['data']['phone'],
      image: map['data']['image'],
      points: map['data']['points'],
      credit: map['data']['credit'],
      token: map['data']['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "points": points,
        "credit": credit,
        "token": token
      }
    };
  }
}
