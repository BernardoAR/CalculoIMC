import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controleIdade = TextEditingController();
  final TextEditingController _controleAltura = TextEditingController();
  final TextEditingController _controlePeso = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _calculaIMC() {
    // Verifica se os campos correspondem
  }
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
                    child: Form(
                  key: _formKey,
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
                        child: TextFormField(
                            controller: _controleIdade,
                            validator: (valor) {
                              if (valor.isEmpty) {
                                return 'Campo idade não pode ser vazio';
                              }
                              if (int.parse(valor) <= 0) {
                                return 'Por favor, entre com uma idade válida';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: false),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Idade',
                                hintText: 'Ex: 22',
                                icon: Icon(Icons.person_outline))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                            controller: _controleAltura,
                            validator: (valor) {
                              if (valor.isEmpty) {
                                return 'Campo altura não pode ser vazio';
                              }
                              if (double.parse(valor) <= 0) {
                                return 'Por favor, entre com uma altura válida';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Altura (m)',
                                hintText: 'Ex: 1.80',
                                icon: Icon(Icons.assessment))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                            controller: _controlePeso,
                            validator: (valor) {
                              if (valor.isEmpty) {
                                return 'Campo peso não pode ser vazio';
                              }
                              if (double.parse(valor) <= 0) {
                                return 'Por favor, entre com um peso válido';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Peso (kg)',
                                hintText: 'Ex: 50',
                                icon: Icon(Icons.line_weight))),
                      ),
                      Center(
                          child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Text('Calcular'),
                        color: Colors.lightBlueAccent,
                      ))
                    ],
                  ),
                )),
              ],
            )));
  }
}
