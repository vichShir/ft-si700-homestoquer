import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class RegisterScreen extends StatelessWidget {
  final BuildContext cont;
  const RegisterScreen({Key? key, required this.cont}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    String nome = "";
    String endereco = "";
    String telefone = "";
    return Scaffold(
          appBar: AppBar(
            title: const Text("Homestoquer"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 140),
                const Center(
                  child: Text("Registro", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)
                ),
              ),
              SizedBox(
                width: 360,
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "Email",
                        ),
                        validator: (String? inValue) {
                          if (inValue!.isEmpty) {
                            return "Insira seu email";
                          }
                          return null;
                        },
                        onSaved: (String? inValue) {
                          username = inValue!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Nome",
                        ),
                        validator: (String? inValue) {
                          if (inValue!.isEmpty) {
                            return "Insira seu nome";
                          }
                          return null;
                        },
                        onSaved: (String? inValue) {
                          nome = inValue!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.house),
                          hintText: "Endere??o",
                        ),
                        validator: (String? inValue) {
                          if (inValue!.isEmpty) {
                            return "Insira o endere??o da sua resid??ncia";
                          }
                          return null;
                        },
                        onSaved: (String? inValue) {
                          endereco = inValue!;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Telefone",
                        ),
                        validator: (String? inValue) {
                          if (inValue!.isEmpty) {
                            return "Insira seu telefone para contato";
                          }
                          return null;
                        },
                        onSaved: (String? inValue) {
                          telefone = inValue!;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "******",
                        ),
                        validator: (String? inValue) {
                          if (inValue!.length < 4) {
                            return "Tem que ter ao menos 6 caracters";
                          }
                          return null;
                        },
                        onSaved: (String? inValue) {
                          password = inValue!;
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 80,
                        width: 220,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black54)],
                            gradient: const LinearGradient(
                              colors: [Color(0xFF006B0C), Color(0xFF00B815)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(const Size(220, 50)),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                elevation: MaterialStateProperty.all(3),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  // Lan??ando evento
                                  BlocProvider.of<AuthBloc>(cont).add(RegisterUser(username: username, password: password, nome: nome, endereco: endereco, telefone: telefone));
                                  Navigator.pop(cont);
                                }
                              },
                              child: const Text("Registrar"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ]
        ),
      ),
    );
  }
}
