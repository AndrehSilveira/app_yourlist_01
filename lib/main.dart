import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_andre/inserir_documento.dart';
import 'package:projeto_andre/tela_login.dart';
import 'package:projeto_andre/tela_inicial.dart';
import 'package:projeto_andre/listagem.dart';
import 'package:projeto_andre/sobre.dart';
import 'package:projeto_andre/criar_conta.dart';
//import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto André',

      //
      //NAVEGAÇÃO
      //

      initialRoute: 't0',
      routes: {
        't0': (context) => const Inicio(),
        't1': (context) => const TelaLogin(),
        't2': (context) => const TelaInicial(),
        't3': (context) => const Listagem(),
        't4': (context) => const Sobre(),
        't5': (context) => const CriarConta(),
        't6': (context) => const InserirDocumentoPage()
      },
    ),
  );
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: new BoxDecoration(color: Colors.red.shade400),
            padding: const EdgeInsets.all(100),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    //backgroundColor: Colors.red.shade400,
                    child: TextButton(
                        child: Text('YourList'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              backgroundColor: Colors.red.shade400),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 't1');
                        }),
                  ),
                ])));
  }
}
