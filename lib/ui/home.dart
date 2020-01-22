import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Cálculo de IMC'),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Passe os dados a Seguir:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24.0, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: false),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Idade',
                                icon: Icon(Icons.person_outline))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Altura (m)',
                                hintText: '1.80',
                                icon: Icon(Icons.assessment))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Peso (kg)',
                                hintText: '50',
                                icon: Icon(Icons.line_weight))),
                      ),
                      Center(
                          child: RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Text('Calcular'),
                        color: Colors.lightBlueAccent,
                      ))
                    ],
                  ),
                ),
              ],
            )));
  }
}
