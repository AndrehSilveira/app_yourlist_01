import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra de titulo
      appBar: AppBar(
        title: const Text('YourList'),
        backgroundColor: Colors.red.shade400,
        leading: new IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: new Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Container(
        color: Colors.red[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   color: Colors.red[400],
                //   border: Border.all(color: Colors.black, width: 2),
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(20),
                //   )
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sobre a Aplicação YourList\n', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400]
                      ),
                    ),
                    Text('Esse aplicativo está sendo desenvolvido com o objetivo de criar um controle pessoal para o usuário de compras de itens em qualquer estabelecimento. O usuário cadastra o estabelecimento que vai realizar as compras, o aplicativo cria uma lista onde o usuário vai cadastrando os itens e os preços, e no final é possível somar e deixar salvo o nome do local junto com a data e o valor gasto, atrelado diretamente ao login cadastrado.',
                      //padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      //child: Text('Esse aplicativo está sendo desenvolvido com o objetivo de criar um controle pessoal para o usuário de compras de itens em qualquer estabelecimento. O usuário cadastra o estabelecimento que vai realizar as compras, o aplicativo cria uma lista onde o usuário vai cadastrando os itens e os preços, e no final é possível somar e deixar salvo o nome do local junto com a data e o valor gasto, atrelado diretamente ao login cadastrado.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.red[300]
                        ),
                    ),
                    Text('Desenvolvedor: André Silveira de Carvalho',
                      //padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      //child: Text('Esse aplicativo está sendo desenvolvido com o objetivo de criar um controle pessoal para o usuário de compras de itens em qualquer estabelecimento. O usuário cadastra o estabelecimento que vai realizar as compras, o aplicativo cria uma lista onde o usuário vai cadastrando os itens e os preços, e no final é possível somar e deixar salvo o nome do local junto com a data e o valor gasto, atrelado diretamente ao login cadastrado.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.red[300]
                        ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.all(20),
                      //child: SingleChildScrollView(
                        child: Image.asset('lib/img/mim.jpg'),
                        
                    )
                      
                    
                  ],
                )
              ),
              
              
          ],
          ),
        )
      ),
    );
  }
}
