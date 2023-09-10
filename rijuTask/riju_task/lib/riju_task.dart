import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:riju_task/redux/user_action.dart';
import 'package:riju_task/show_page.dart';

import 'app_state.dart';

class RijuTask extends StatefulWidget {
  const RijuTask({super.key});

  @override
  State<RijuTask> createState() => _RijuTaskState();
}

class _RijuTaskState extends State<RijuTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Form(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                onChanged: (value) {
                  vm.enterUser(nameController.text);
                },
              ),
              TextFormField(
                controller: emailController,
                onChanged: (value) {
                  vm.enterEmail(emailController.text);
                },
              ),
              TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  vm.enterPassword(passwordController.text);
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              const ShowPage()
            ],
          ),
        ));
      },
    );
  }
}

class _ViewModel extends Equatable {
  final String username;
  final String email;
  final String password;
  // final void Function(String username, String email, String password) enterplz;
  final void Function(String userName) enterUser;
  final void Function(String email) enterEmail;
  final void Function(String password) enterPassword;

  _ViewModel({
    this.username = '',
    this.email = '',
    this.password = '',
    required this.enterUser,
    required this.enterEmail,
    required this.enterPassword,
  });

  @override
  List<Object> get props {
    return [
      username,
      email,
      password,
    ];
  }

  static fromStore(Store<AppState> store) {
    return _ViewModel(
      enterUser: (String userName) => store.dispatch(UserAction(
        userName: userName,
        email: store.state.userState.email,
        password: store.state.userState.password,
      )),
      enterEmail: (email) => store.dispatch(UserAction(
        userName: store.state.userState.name,
        email: email,
        password: store.state.userState.password,
      )),
      enterPassword: (password) => store.dispatch(UserAction(
          userName: store.state.userState.name,
          email: store.state.userState.email,
          password: password)),
    );
  }
}
