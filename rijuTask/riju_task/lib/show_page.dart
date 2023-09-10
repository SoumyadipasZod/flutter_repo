import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'redux/user_action.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Column(
          children: [
            Row(
              children: [Text("Name:"), Text("${vm.username}")],
            ),
            Row(
              children: [Text("email:"), Text("${vm.email}")],
            ),
            Row(
              children: [Text("password:"), Text("${vm.password}")],
            )
          ],
        );
      },
    );
  }
}

class _ViewModel extends Equatable {
  // final void Function(String username, String email, String password) enterplz;
  final String username;
  final String email;
  final String password;
  _ViewModel({
    // required this.enterplz,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [username, email, password];

  static fromStore(Store<AppState> store) {
    return _ViewModel(
        // enterplz: (String userName, String email, String password) =>
        //     store.dispatch(UserAction(
        //         userName: userName, email: email, password: password)),
        email: store.state.userState.email,
        password: store.state.userState.password,
        username: store.state.userState.name);
  }
}
