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
      status: map['status'] as bool,
      message: map['message'] as String,
      id: map['data']['id'] as int,
      name: map['data']['name'] as String,
      email: map['data']['email'] as String,
      phone: map['data']['phone'] as String,
      image: map['data']['image'] as String,
      points: map['data']['points'] as int,
      credit: map['data']['credit'] as int,
      token: map['data']['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "image": image,
      "points": points,
      "credit": credit,
      "token": token,
    };
  }
}
