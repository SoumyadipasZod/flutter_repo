import 'package:redux/redux.dart';

import 'user_action.dart';
import 'user_state.dart';

UserState userReducer(UserState state, UserAction action) {
  return state.copyWith(
      name: action.userName, email: action.email, password: action.password);
}

Reducer<UserState> userrrrrrrrrReducer = combineReducers<UserState>(
    [TypedReducer<UserState, UserAction>(userReducer)]);
