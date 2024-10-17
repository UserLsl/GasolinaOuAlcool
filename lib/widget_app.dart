
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  GlobalKey <FormState> _formkey = GlobalKey<FormState>();

  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();

  String _infoText = "Informe o valor de cada combustível";

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Gasolina ou Alcool ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orange,
        //leading:  Icon(Icons.refresh, color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formkey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch, Outra forma de centralizar sem ser usando o SizedBox com widget
            children: [
              buildIcon(),
              buildTextFormFieldGasolina(),
              buildTextFormFieldAlcool(),
              buildButton(context),
              buildTextInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildIcon() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Icon(Icons.directions_car, size: 100, color: Colors.black),
    );
  }

  Padding buildTextFormFieldGasolina() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: "Preço da Gasolina",
          floatingLabelStyle: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(30),
          )
        ),
        controller: gasolinaController,
        validator: (value) {
          if(value!.isEmpty) {
            return 'Informe o valor do gasolina';
          }
          return null;
        },
      ),
    );
  }

  Padding buildTextFormFieldAlcool() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 8, 40, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: "Preço do Álcool",
          floatingLabelStyle: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(30),
          )
        ),
        controller: alcoolController,
        validator: (value) {
          if(value!.isEmpty) {
            return 'Informe o valor do álcool';
          }
          return null;
        },
      ),
    );
  }

  Padding buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Calcular",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            if(_formkey.currentState!.validate()) {
              //calcula();
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
        ),
      ),
    );
  }

  Padding buildTextInfo() {
    return Padding(padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
      child: Text(_infoText, style: const TextStyle(fontSize: 25), textAlign: TextAlign.center,),
    );
  }

}