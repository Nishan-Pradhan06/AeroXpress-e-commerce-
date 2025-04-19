import '../../domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.id, required super.email});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(id: json['id'] as int, email: json['email'] as String);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email};
  }
}
