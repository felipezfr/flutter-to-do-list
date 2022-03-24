import 'package:flutter/material.dart';
import 'package:flutter_application_teste_not/telas/contador.dart';
import 'package:flutter_application_teste_not/telas/dias_vividos.dart';
import 'package:flutter_application_teste_not/telas/home.dart';
import 'package:flutter_application_teste_not/telas/login.dart';
import 'package:flutter_application_teste_not/telas/projeto_list.dart';
import 'package:flutter_application_teste_not/telas/sobre.dart';
import 'package:flutter_application_teste_not/telas/usuario_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String titulo = 'Aplicativo';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titulo,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/contador': (context) => const ContadorPage(title: 'Contador'),
        '/sobre': (context) => const SobrePage(),
        '/dias': (context) => const DiasVividosPage(),
        '/usuarios': (context) => const UsuarioListPage(),
        '/projetos': (context) => const ProjetoListPage(),
      },
    );
  }
}
