import 'package:flutter/material.dart';
import 'package:flutter_application_teste_not/api/usuario_api.dart';
import 'package:flutter_application_teste_not/dominio/usuario.dart';
import 'package:flutter_application_teste_not/telas/usuario_edit.dart';

// Define a custom Form widget.
class UsuarioListPage extends StatefulWidget {
  const UsuarioListPage({Key? key}) : super(key: key);

  @override
  UsuarioListPageState createState() {
    return UsuarioListPageState();
  }
}

class UsuarioListPageState extends State<UsuarioListPage> {
  List<Usuario> lista = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _atualizarLista();
  }

  void _atualizarLista() {
    lista.clear();
    UsusarioApi.getList().then((value) => {
          setState(() {
            lista.addAll(value);
          })
        });
  }

  void _inserir() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsuarioEditPage(obj: Usuario()),
      ),
    );
    _atualizarLista();
  }

  void _editar(Usuario selecao) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsuarioEditPage(obj: selecao),
      ),
    );
    _atualizarLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
            padding: const EdgeInsets.all(10.0),
            scrollDirection: Axis.vertical,
            children: lista
                .map((data) => ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(data.nome.toString()),
                      onTap: () => _editar(data),
                    ))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _inserir,
        tooltip: 'Inserir',
        child: const Icon(Icons.add),
        heroTag: 'Botão inserir',
      ),
    );
  }
}
