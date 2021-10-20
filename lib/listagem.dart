import 'package:projeto_andre/tela_login.dart';
import 'package:flutter/material.dart';
import 'package:projeto_andre/tela_inicial.dart';

class Item {
  final String descricao;
  final double preco;

  Item(this.descricao, this.preco);
}

class Listagem extends StatefulWidget {
  const Listagem({Key? key}) : super(key: key);

  @override
  _Listagem createState() => _Listagem();
}

class _Listagem extends State<Listagem> {
  //lista dinâmica para armazenamento das tarefas
  //var lista = [];
  final List<Item> lista = [];

  Item macarrao = Item('Macarrao', 2.50);
  Item feijao = Item('Feijao', 8.50);
    var txtTarefa = TextEditingController();
  var txtPreco = TextEditingController();

  double totalPreco = 0.00;

  @override
  void initState() {
    lista.add(macarrao);
    lista.add(feijao);
    // lista.add("Ir ao supermercado", 2.50);
    // lista.add("Comprar ração para o cachorro");
    // lista.add("Trocar a lâmpada da cozinha");
    // lista.add("Pagar a conta de internet");
    // lista.add("Comprar um ventilador novo");
    // lista.add("Abastecer o veículo");
    // lista.add("Cortar o cabelo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YourList'),
        backgroundColor: Colors.red.shade400,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.red.shade100,

        //
        // ListView
        //
        child: ListView.builder(
          //definir a orientação (horizontal ou vertical)
          scrollDirection: Axis.vertical,

          //separatorBuilder: (context,index){
          //  return Divider(
          //    color: Colors.grey.shade400,
          //    thickness: 1,
          //  );
          //},

          //definir a quantidade de itens
          itemCount: lista.length,

          //definir a aparência dos itens da lista
          itemBuilder: (context, index) {
            final _item = lista[index];
            totalPreco += _item.preco;

            return Card(
              elevation: 10,
              shadowColor: Colors.red.shade400,
              child: ListTile(
                // leading: Text(
                //   totalPreco.toString(),
                // ),
                //leading: Icon(Icons.task_outlined),
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _item.descricao,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'R\$ ${_item.preco.toString()}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),

                //subtitle: Text('Clique aqui para selecionar o item da lista'),

                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    //remover um item da lista
                    setState(() {
                      lista.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Produto removido com sucesso'),
                        duration: Duration(seconds: 2),
                      ));
                    });
                  },
                ),

                //selecionar item da lista
                hoverColor: Colors.red.shade100,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Produto selecionado: ${lista[index]}'),
                    duration: Duration(seconds: 3),
                  ));
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ),

      //
      // ADICIONAR tarefas
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Adicionar na Lista',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  content: Container(
                    height: 150,
                    child: Column(
                      children: [
                        TextField(
                          controller: txtTarefa,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'Produto',
                              labelStyle:
                                  new TextStyle(color: Colors.red.shade400)),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Preço',
                              labelStyle:
                                  new TextStyle(color: Colors.red.shade400)),
                          controller: txtPreco,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('ok'),
                      onPressed: () {
                        setState(() {
                          var msg = '';
                          if (txtTarefa.text.isNotEmpty) {
                            Item _item = Item(
                                txtTarefa.text, double.parse(txtPreco.text.replaceFirst(',','.')));
                            lista.add(_item);
                            txtTarefa.clear();
                            txtPreco.clear();
                            msg = 'Produto adicionado com sucesso.';
                          } else {
                            msg =
                                'Descreva o nome do produto para adicionar a lista.';
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(msg),
                            duration: Duration(seconds: 3),
                          ));
                        });

                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}

