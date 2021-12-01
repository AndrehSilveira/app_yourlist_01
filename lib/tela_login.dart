import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('YourList'),
          centerTitle: true,
          backgroundColor: Colors.red.shade400),
      backgroundColor: Colors.red.shade100,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtEmail,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400),
                  borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.email, color: Colors.red), 
                  labelText: 'Email', labelStyle: TextStyle(color: Colors.red),),
                  
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
                  borderSide: BorderSide(color: Colors.red.shade400),
                  borderRadius: BorderRadius.circular(25),
                ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400),
                borderRadius: BorderRadius.circular(25)),
                prefixIcon: Icon(Icons.lock, color: Colors.red,), 
                labelText: 'Senha', labelStyle: TextStyle(color: Colors.red),),
            ),
            const SizedBox(height: 30),
            Container(
              width: 150,
                child: OutlinedButton(
                  child: const Text('ENTRAR', style: const TextStyle(color: Colors.red),),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red, width: 0.5)
                  ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);
                },
              ),
                //ElevatedButton(
                //style: 
                  //ElevatedButton.styleForm(side: BorderSide(width: 5.0, color: Colors.black),
                  //ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade200),
                  //),
                //child: const Text('ENTRAR', style: const TextStyle(color: Colors.black),),
                //onPressed: () {
                //  setState(() {
                //    isLoading = true;
                //  });
                //  login(txtEmail.text, txtSenha.text);
                //},
              ),
            
            const SizedBox(height: 20),
            Container(
              width: 20,
              child: OutlinedButton(
                child: const Text('Criar conta', style: const TextStyle(color: Colors.red),),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red, width: 0.5)
                  ),
                onPressed: () {
                  Navigator.pushNamed(context, 't5');
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      Navigator.pushNamed(context, 't2');
    }).catchError((erro) {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'ERRO: Usuário não encontrado';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'ERRO: Senha incorreta!';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'ERRO: E-mail inválido!';
      } else {
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(mensagem), 
          duration: const Duration(seconds: 2)
          )
      );
    });
  }
}
