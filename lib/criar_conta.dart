// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({Key? key}) : super(key: key);

  @override
  _CriarConta createState() => _CriarConta();
}

class _CriarConta extends State<CriarConta> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
        ),
          title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('YourList', style: TextStyle(fontSize: 25)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
          backgroundColor: Colors.red.shade400,
          actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 't1');
            },
          )
        ],
      ),
      body: Container(
        
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400)),
                prefixIcon: Icon(Icons.person, color: Colors.red,),
                labelText: 'Nome', labelStyle: TextStyle(color: Colors.red)
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              style: const TextStyle(
                  color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
                  prefixIcon: Icon(Icons.email, color: Colors.red),
                  labelText: 'Email',  labelStyle: TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400)),
                prefixIcon: Icon(Icons.lock, color: Colors.red),
                labelText: 'Senha',labelStyle: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: const Text('criar', style: const TextStyle(color: Colors.red),),
                    onPressed: () {
                      criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: const Text('cancelar', style: const TextStyle(color: Colors.red),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      backgroundColor: Colors.red.shade100,
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      //Armazenar o nome dcompleto do Usuário
      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(value.user!.uid)
          .set({
        'nome': nome,
        'email': email,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuário criado com sucesso!'),
          duration: Duration(seconds: 3),
        ));
        Navigator.pop(context);
      });
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('ERRO: O email informado já está em uso.'),
            duration: Duration(seconds: 3)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO: ${erro.message}'),
          duration: const Duration(seconds: 3),
        ));
      }
    });
  }
}
