import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final String name;
  final String email;
  final String password;
  UserState({
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserState.initial() {
    return UserState(name: '', email: '', password: '');
  }

  @override
  List<Object> get props => [name, email, password];

  @override
  String toString() =>
      'UserState(name: $name, email: $email, password: $password)';

  UserState copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
