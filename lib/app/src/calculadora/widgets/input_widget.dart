import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controllerPeso;
  final String textoPeso;
  final TextEditingController controllerAltura;
  final String textoAltura;
  final GlobalKey<FormState> keyValue;
  const InputWidget(
      {Key? key,
      required this.controllerPeso,
      required this.textoPeso,
      required this.controllerAltura,
      required this.textoAltura, required this.keyValue})
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyValue,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: widget.textoPeso,
            ),
            textAlign: TextAlign.center,
            style: const TextStyle( fontSize: 25.0),
            controller: widget.controllerPeso,
            validator: (value){
              if(value!.isEmpty){
                return 'Insira o seu peso';
              }
              return null;
            },
          ),
           TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: widget.textoAltura,
            ),
            textAlign: TextAlign.center,
            style: const TextStyle( fontSize: 25.0),
            controller: widget.controllerAltura,
            validator: (value){
              if(value!.isEmpty){
                return 'Insira o seu peso';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
