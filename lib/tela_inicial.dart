import 'package:flutter/cupertino.dart';
import 'package:projeto_andre/tela_login.dart';
import 'package:flutter/material.dart';
//import 'package:projeto_andre/listagem.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicial createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {
  @override
  //Widget build(BuildContext context) {
    

    Widget build(BuildContext context) {
      var obj = ModalRoute.of(context)!.settings.arguments as Cadastro;
      return Scaffold(
        //Barra superior de título
        appBar: AppBar(
          title: const Text('YourList'),
          backgroundColor: Colors.red.shade400,
        ),
        body: Container(
          //largura responsiva
          width: MediaQuery.of(context).size.width,
          color: Colors.red[100],
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Bem vindo ' + obj.nome,style: TextStyle(fontSize: 24),),
                SizedBox(height: 10,),
                Caminho('Lista', 'Faça aqui a sua lista!', 
                    'lib/img/lista.jpg', 't3'),
                Caminho('Sobre', 'Saiba mais sobre esse App!',
                    'lib/img/teste.jpg', 't4'),
              ],
            ),
          ),
        ),
      );
    }
  }

class Caminho extends StatelessWidget {
  //ATRIBUTOS
  //Os atributos serão utilizados para receber dados no momento
  //da cração do Widget
  final String caminho_nome;
  final String caminho_descricao;
  final String foto;
  final String caminho;

  //CONSTRUTOR
  const Caminho(
      this.caminho_nome, this.caminho_descricao, this.foto, this.caminho,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //MARGENS
      //margin: EdgeInsets.all(20),
      //margin: EdgeInsets.only(top: 20),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),

      //ESPAÇAMENTO INTERNO
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

      width: MediaQuery.of(context).size.width * 0.50,
      //height: 350,

      //DECORAÇÃO
      decoration: BoxDecoration(
          color: Colors.red[400],

          //BORDAS
          border: Border.all(color: Colors.black, width: 2),

          //BORAS ARREDONDADAS
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),

      child: Column(children: [
        Text(this.caminho_nome,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            )),
        Text(this.caminho_descricao,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            )),

        //FOTO
        Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.black,
            //     width: 2,
            //   ),
            // ),
            
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, this.caminho);
              },
              child: Image.asset(this.foto),
            )),
      ]),
    );
  }
}
