import 'package:equatable/equatable.dart';

import 'redux/user_state.dart';

class AppState extends Equatable {
  final UserState userState;
  AppState({
    required this.userState,
  });

  factory AppState.initial() {
    return AppState(userState: UserState.initial());
  }

  @override
  List<Object> get props => [userState];

  @override
  String toString() => 'AppState(userState: $userState)';

  AppState copyWith({
    UserState? userState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
    );
  }
}
