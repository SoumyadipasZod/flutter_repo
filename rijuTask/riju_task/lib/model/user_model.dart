import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String password;
  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserModel.initial() {
    return UserModel(name: '', email: '', password: '');
  }

  @override
  List<Object> get props => [name, email, password];

  @override
  String toString() =>
      'UserModel(name: $name, email: $email, password: $password)';

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
