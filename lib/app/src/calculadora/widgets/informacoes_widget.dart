import 'package:flutter/material.dart';

class InformacoesWidget extends StatefulWidget {
  final String resultado;
  final String classificacao;
  final String grauObesidade;
  const InformacoesWidget({ Key? key, required this.resultado, required this.classificacao, required this.grauObesidade }) : super(key: key);

  @override
  State<InformacoesWidget> createState() => _InformacoesWidgetState();
}

class _InformacoesWidgetState extends State<InformacoesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
              widget.resultado,
              style: const TextStyle( fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.classificacao,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.grauObesidade,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            )
      ],
    );
  }
}