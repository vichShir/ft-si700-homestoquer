import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_event.dart';
import 'login_screen.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

import 'main_app.dart';
import 'register_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Autenticado"),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  child: const Icon(Icons.logout)),
              body: const MainApp());
        } else {
          return //LoginScreen();

              DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: const TabBarView(
                      children: [
                        RegisterScreen(),
                        LoginScreen()
                      ],
                    ),
                    appBar: AppBar(
                      title: const Text("Autenticação Necessária"),
                      bottom: const TabBar(
                        tabs: [
                          Tab(text: "Novo Cadastro"),
                          Tab(text: "Efetuar Login")
                        ],
                      ),
                    ),
                  ));
        }
      },
    );
  }
}