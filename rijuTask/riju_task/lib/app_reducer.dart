import 'package:riju_task/app_state.dart';

import 'redux/user_reducer.dart';

AppState reducer(AppState state, action) {
  return AppState(userState: userrrrrrrrrReducer(state.userState, action));
}
