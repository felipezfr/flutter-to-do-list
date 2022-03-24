import 'package:flutter/material.dart';
import 'package:flutter_application_teste_not/api/login_api.dart';
import 'package:flutter_application_teste_not/dominio/usuario.dart';
import 'package:google_fonts/google_fonts.dart';

// Define a custom Form widget.
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final Usuario _userLogin = Usuario();

  void _processar() {
    // Login.Logar(_userLogin)
    //     .then((value) => {
    Navigator.of(context).pushNamed('/home');
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Bem vindo")));
    // })
    // .onError((error, stackTrace) => {
    // ScaffoldMessenger.of(context).showSnackBar(
    // SnackBar(content: Text(error.toString())),
    // )
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Text(
              'Login App',
              style: GoogleFonts.montserrat(fontSize: 40),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Informe o e-mail',
                      prefixIcon: const Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'informe seu e-mail';
                    }
                    _userLogin.email = value;
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Informe a senha',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe sua senha';
                    }
                    _userLogin.senha = value;
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    _processar();
                    // }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
