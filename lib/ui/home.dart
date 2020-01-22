import 'package:calculo_peso/ui/alerta.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controleIdade = TextEditingController();
  final TextEditingController _controleAltura = TextEditingController();
  final TextEditingController _controlePeso = TextEditingController();
  final _form = GlobalKey<FormState>();
  final Alerta _alerta = Alerta();

  /// Método para cálculo do IMC
  void _calculaIMC() {
    setState(() {
      // Pega os dados e colocam em variáveis locais
      double _alturaTmp = double.parse(_controleAltura.text);
      double _pesoTmp = double.parse(_controlePeso.text);

      // Faz o cálculo do IMC
      double calculoImc = ((_pesoTmp) / (_alturaTmp * _alturaTmp));
      _verificaIMC(calculoImc);
    });
  }

  /// Método para verificação do IMC
  void _verificaIMC(double valor) {
    String _tipo = '';
    if (valor < 17) {
      _tipo = 'Muito abaixo do Peso';
    } else if (valor >= 17 && valor < 18.5) {
      _tipo = 'Abaixo do Peso';
    } else if (valor >= 18.5 && valor < 25) {
      _tipo = 'Peso normal';
    } else if (valor >= 25 && valor < 30) {
      _tipo = 'Obesidade I';
    } else if (valor >= 35 && valor < 40) {
      _tipo = 'Obesidade II (severa)';
    } else {
      _tipo = 'Obesidade III (mórbida)';
    }
    // Manda pro alerta
    _alerta.alerta(
        context: context,
        texto:
            'O valor do seu IMC foi ${valor.toStringAsPrecision(2)}. \nE o normal é entre 18.50 e 24.99 \n ',
        titulo: _tipo);
  }

  /// Método utilizado para validar a idade
  String _validaIdade(valor) {
    if (valor.isEmpty) {
      return 'Campo idade não pode ser vazio';
    }
    if (valor is double) {
      return 'Campo idade não pode ser decimal';
    }
    if (int.parse(valor) <= 0) {
      return 'Por favor, entre com uma idade válida';
    }
    return null;
  }

  /// Método utilizado para validar a altura
  String _validaAltura(valor) {
    if (valor.isEmpty) {
      return 'Campo altura não pode ser vazio';
    }
    if (double.parse(valor) <= 0) {
      return 'Por favor, entre com uma altura válida';
    }
    return null;
  }

  /// Método utilizado para validar o peso
  String _validaPeso(valor) {
    if (valor.isEmpty) {
      return 'Campo peso não pode ser vazio';
    }
    if (double.parse(valor) <= 0) {
      return 'Por favor, entre com um peso válido';
    }
    return null;
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
                  key: _form,
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
                            validator: _validaIdade,
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
                            validator: _validaAltura,
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
                            validator: _validaPeso,
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
                          if (_form.currentState.validate()) {
                            // Se o formulário deu certo, calcula o IMC
                            _calculaIMC();
                          }
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Text('Calcular'),
                        color: Colors.lightBlueAccent,
                      )),
                    ],
                  ),
                )),
              ],
            )));
  }
}
