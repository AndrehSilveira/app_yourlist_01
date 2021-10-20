import 'package:projeto_andre/main.dart';
import 'package:projeto_andre/tela_inicial.dart';
import 'package:flutter/material.dart';

//
//Classe para troca de Dados entre as telas
//
class Cadastro {
  final String nome;
  final String senha;
  Cadastro(this.nome, this.senha);
}

//
//TELA LOGIN
//

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLogin createState() => _TelaLogin();
}

class _TelaLogin extends State<TelaLogin> {
  var nome = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.red.shade100),
        padding: const EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                heightFactor: 3,
                child: Text(
                  'YourList',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    backgroundColor: Colors.red.shade400,
                  ),
                )),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      controller: nome,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Login',
                          labelStyle: TextStyle(color: Colors.red.shade400),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade400),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade400),
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: senha,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Colors.red.shade400),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade400),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade400),
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade400)),
                      onPressed: () {
                        setState(() {
                          // Encapsular os dados que foram inseridos em tela
                          if (nome.text.isNotEmpty) {
                            var obj = Cadastro(
                              nome.text,
                              senha.text,
                            );
                            Navigator.pushNamed(context, 't2', arguments: obj);
                          } else {
                            caixaDialogo('teste');
                          }
                          ;
                          
                        });

                        // if (((nome.text).isEmpty)) {
                        //   AlertDialog(
                        //     title: Text('Campo Vazio!'),
                        //     content: Text(
                        //         'O campo de usuário não pode estar vazio!'),
                        //     actions: [
                        //       TextButton(
                        //         onPressed: () {
                        //           Navigator.of(context).pop();
                        //         },
                        //         child: Text('Fechar'),
                        //       ),
                        //     ],
                        //   );
                        // };
                      },
                      child: Text('ENVIAR'),
                    )
                  ],
                ),
              ),
              
            ),
            
            //OutlinedButton(
            //  onPressed: () {
            //    Navigator.pushNamed(context, 't2');
            //  },
            //  child: const Text('próximo'),
            //),
          ],
        ),
      ),
    );
  }
                            caixaDialogo(msg) {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Campo Vazio!'),
                                    content: Text(
                                        'Favor, preencher o nome do usuario'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Fechar'),
                                      ),
                                    ],
                                  );
                                });
                          }
}
