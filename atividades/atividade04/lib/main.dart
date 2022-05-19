import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:si700_estoque/view/first_screen.dart';
import 'package:si700_estoque/view/second_screen.dart';
import 'package:si700_estoque/view/third_screen.dart';

import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';
import 'bloc/form_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'view/wrapper.dart';

/// Nome: Victor Yukio Shirasuna
/// RA: 245155

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homestoquer',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.green,
      ),
      //home: const MyHomePage(),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc())],
        child: const Wrapper(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homestoquer"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Busca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: "Registro",
          ),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() => _currentScreen = novoItem); 
        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ManageBloc()),
          BlocProvider(create: (_) => MonitorBloc()),
          BlocProvider(create: (_) => RadioBloc()),
          BlocProvider(create: (_) => CheckBoxBloc()),
          BlocProvider(create: (_) => DateBloc()),
        ],
        child: IndexedStack(
          index: _currentScreen,
          children: [
              Home(),
              Search(),
              Register(),
          ],
        ),
      )
    );
  }
}