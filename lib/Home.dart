import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static TextEditingController _controllerAlcool = TextEditingController();
  static TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular() {
    double precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(',', '.'));
    double precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(',', '.'));

    setState(() {
      if (precoAlcool == null || precoAlcool <= 0) {
        _resultado = "Valor do litro de Alcool inválido.";
      } else if (precoGasolina == null || precoGasolina <= 0) {
        _resultado = "valor do litro da Gasolina inválido";
      } else {
        if ((precoAlcool / precoGasolina) >= 0.7) {
          _resultado = "É melhor abastecer com Gasolina !";
        } else {
          _resultado = "É melhor abastecer com Alcool !";
        }
        _limparCampos();
      }
    });
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png')),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para o abastecimento do seu carro.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço do Alcool, ex: 1.59"),
              style: TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço da gasolina, ex: 3.59"),
              style: TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                onPressed: _calcular,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
