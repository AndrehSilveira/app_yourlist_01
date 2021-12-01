import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'main.dart';
// import 'criar_conta.dart';
// import 'inserir_documento.dart';
// import 'tela_login.dart';

class Listagem extends StatefulWidget {
  const Listagem({Key? key}) : super(key: key);

  @override
  _ListagemPageState createState() => _ListagemPageState();
}

class _ListagemPageState extends State<Listagem> {
  //Referenciar a Coleção de Cafés
  late CollectionReference lojas;

  //VARIAVEL PARA REALIZAR A SOMA DE TODOS OS PRODUTOS
  //double soma = 0;

  @override
  void initState() {
    super.initState();

    lojas = FirebaseFirestore.instance.collection('lojas');
  }

  //
  // Item Lista
  // Definir a aparência de cada item da lista
  Widget itemLista(item) {
    //setState(() {
    String nome = item.data()['nome'].replaceFirst(',', '.');
    String preco = item.data()['preco'].replaceFirst(',', '.');
    //}),

    //Somar os itens da lista
    //soma = soma + double.parse(preco);

    return ListTile(
      title: Text(nome, style: const TextStyle(fontSize: 30)),
      subtitle: Text('R\$ $preco', style: const TextStyle(fontSize: 20)),
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            //
            // APAGAR UM DOCUMENTO DA COLEÇÃO
            //
            lojas.doc(item.id).delete();
          }),
      onTap: () {
        Navigator.pushNamed(context, 't6', arguments: item.id);
      },
    );
  }

// Buscar os dados do usuário logado
  // getNomeUsuario(id) async {
  //   return await FirebaseFirestore.instance
  //       .collection('usuarios')
  //       .doc(id)
  //       .get()
  //       .then((doc) {
  //     return doc.get('nome');
  //   });
  // }

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
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('YourList', style: TextStyle(fontSize: 25)),
            SizedBox(
              width: 10,
            ),

            // PARA O E-MAIL DO USUÁRIO APARECER QUANDO LOGADO:
            //Text(FirebaseAuth.instance.currentUser!.email.toString()),

            //PARA O NOME DO USUÁRIO APARECER QUANDO LOGADO:
            // FutureBuilder(
            //     future: getNomeUsuario(
            //         FirebaseAuth.instance.currentUser!.uid.toString()),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         return Center(
            //           child: Text(
            //             snapshot.data.toString(),
            //             style: const TextStyle(fontSize: 20.0),
            //           ),
            //         );
            //       } else {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     })
          ],
        ),
        //centerTitle: true,
        backgroundColor: Colors.red.shade400,
        //automaticallyImplyLeading: false,
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

      //
      // EXIBIR OS DOCUMENTOS DA COLEÇÃO
      //
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 90),
        child: StreamBuilder<QuerySnapshot>(

            //fonte de dados (coleção)
            stream: lojas.snapshots(),

            //exibir os dados retornados
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                      child: Text('Não foi possível conectar ao Firebase'));

                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());

                //dados recebidos
                default:
                  final dados = snapshot.requireData;
                  return ListView.builder(
                      itemCount: dados.size,
                      itemBuilder: (context, index) {
                        return itemLista(dados.docs[index]);
                      });
              }
            }),
      ),

      backgroundColor: Colors.red.shade100,
      floatingActionButton:
          //Padding(
          //  padding: const EdgeInsets.only(right: 70),
          //child:
          FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 't6');
        },
      ),
    );
  }
}
