// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InserirDocumentoPage extends StatefulWidget {
  const InserirDocumentoPage({Key? key}) : super(key: key);

  @override
  _InserirDocumentoPageState createState() => _InserirDocumentoPageState();
}

class _InserirDocumentoPageState extends State<InserirDocumentoPage> {
  var txtNome = TextEditingController();
  var txtPreco = TextEditingController();

  //
  // RETORNAR UM DOCUMENTO a partir do ID
  //
  getDocumentById(id) async {
    // select * from tb_cafes where id = 1;
    await FirebaseFirestore.instance
        .collection('lojas')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtPreco.text = doc.get('preco');
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR o ID
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty && txtPreco.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('YourList'),
        backgroundColor: Colors.red.shade400,
        leading: new IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.red.shade100,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: const TextStyle(
                color: Colors.black,
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
                  labelText: 'Produto',
                  labelStyle: TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: txtPreco,
              style: const TextStyle(
                color: Colors.black,
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
                  labelText: 'Preço',
                  labelStyle: TextStyle(color: Colors.red)),
            ),

            //VALIDADOR DE CONVERSÃO DE VIRGULA PARA PONTO DEVIDO A CARACTERISTICA DO DOUBLE
            // validator: (value){
            //   value = value!.replaceFirst(',', '.');
            //   if (double.tryParse(value) == null){
            //     return: 'Digite ponto ao invés de virgula!'
            //   }else{
            //     return null;
            //   }
            // }

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: const Text(
                      'SALVAR',
                      style: const TextStyle(color: Colors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red, width: 0.5)),
                    onPressed: () {
                      if (id == null) {
                        //
                        // ADICIONAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance.collection('lojas').add(
                            {'nome': txtNome.text, 'preco': txtPreco.text});
                      } else {
                        //
                        // ATUALIZAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance
                            .collection('lojas')
                            .doc(id.toString())
                            .set(
                                {'nome': txtNome.text, 'preco': txtPreco.text});
                      }

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 3),
                      ));

                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                      child: const Text(
                        'CANCELAR',
                        style: const TextStyle(color: Colors.red),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red, width: 0.5)),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
